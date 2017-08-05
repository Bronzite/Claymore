using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Claymore.Models;
using System.Data.Entity.Validation;

namespace Claymore.Controllers
{
    public class SessionsController : Controller
    {
        private ClaymoreDataModelContainer db = new ClaymoreDataModelContainer();

        // GET: Sessions
        public ActionResult Index()
        {
            var sessions = db.Sessions.Include(s => s.XPTransaction);
            List < Session > lstSessions = sessions.ToList();
            lstSessions.Sort(Claymore.Models.Session.Compare);
            lstSessions.Reverse();
            return View(lstSessions);
        }

        // GET: Sessions/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Session session = db.Sessions.Find(id);
            if (session == null)
            {
                return HttpNotFound();
            }
            return View(session);
        }

        public ActionResult RefreshAllSessionXP()
        {
            
            foreach(Session s in db.Sessions)
            {
                XPTransaction oldTrans = s.XPTransaction;
                XPTransaction trans = new XPTransaction();
                trans.Description = s.XPTransaction.Description;
                trans.Id = Guid.NewGuid();
                trans.Timestamp = s.XPTransaction.Timestamp;
                foreach(Session newS in s.XPTransaction.Sessions) { trans.Sessions.Add(newS); }
                s.XPTransaction = trans;
                List<XPChange> RemoveChanges = new List<XPChange>(oldTrans.Changes);
                foreach(XPChange chng in RemoveChanges)
                {
                    db.XPChanges.Remove(chng);
                }
                db.XPTransactions.Remove(oldTrans);
                //trans.Changes.Clear();
                foreach(Character c in s.Characters)
                {
                    XPAsset XPPool = null;
                    foreach(XPAsset curXPAsset in c.XPAssets)
                    {
                        if(curXPAsset.Name.Equals("XP Pool"))
                        {
                            XPPool = curXPAsset;
                        }
                    }
                    if (XPPool != null)
                    {
                        XPChange xpChange = new XPChange();
                        xpChange.Amount = int.Parse(s.BaseXP);
                        xpChange.Transaction = trans;
                        xpChange.XPTransactionId = trans.Id;
                        xpChange.XPAsset = XPPool;
                        xpChange.XPAssetId = XPPool.Id;
                        xpChange.Id = Guid.NewGuid();
                        trans.Changes.Add(xpChange);
                    }
                    else
                    {
                        //trans.Id = Guid.NewGuid();
                    }
                }
                
            }
            db.SaveChanges();
            XPAsset.RefreshAllXPAssets();
            return Redirect("~/Sessions/Index");
        }

        // GET: Sessions/Create
        public ActionResult Create()
        {
            ViewBag.XPTransactionId = new SelectList(db.XPTransactions, "Id", "Id");
            return View();
        }

        // POST: Sessions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,SessionDate,BaseXP")] Session session)
        {
            if (ModelState.IsValid)
            {

                session.Id = Guid.NewGuid();
                session.XPTransaction = new XPTransaction();
                session.XPTransaction.Sessions.Add(session);
                session.XPTransaction.Timestamp = DateTime.Now;
                session.XPTransaction.Description = string.Format("{0} XP", session.Name);
                session.XPTransaction.Id = Guid.NewGuid();
                db.XPTransactions.Add(session.XPTransaction);
                db.Sessions.Add(session);
                try
                {
                    db.SaveChanges();
                }
                catch(DbEntityValidationException hrve)
                {
                    
                    TempData["error"] = hrve;
                    return RedirectToAction("Create");
                }
                return RedirectToAction("Index");
            }

            ViewBag.XPTransactionId = new SelectList(db.XPTransactions, "Id", "Id", session.XPTransactionId);
            return View(session);
        }

        // GET: Sessions/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Session session = db.Sessions.Find(id);
            if (session == null)
            {
                return HttpNotFound();
            }
            ViewBag.XPTransactionId = new SelectList(db.XPTransactions, "Id", "Id", session.XPTransactionId);
            return View(session);
        }

        // POST: Sessions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(FormCollection coll)
        {
            Session retval = db.Sessions.Find(Guid.Parse(coll["Id"]));

            retval.Name = coll["Name"];
            retval.SessionDate = DateTime.Parse(coll["SessionDate"]);
            retval.BaseXP = coll["BaseXP"];

            retval.Campaigns.Clear();
            retval.Characters.Clear();
            foreach (string sKey in coll.Keys)
            {
                Guid guidKey = Guid.Empty;
                if (Guid.TryParse(sKey, out guidKey))
                {
                    foreach (Campaign c in db.Campaigns)
                    {
                        if (guidKey.Equals(c.Id))
                            retval.Campaigns.Add(c);
                    }
                    foreach (Character c in db.Characters)
                    {
                        if (guidKey.Equals(c.Id))
                            retval.Characters.Add(c);
                    }

                }
            }
            db.SaveChanges();
            //if()
            //ViewBag.XPTransactionId = new SelectList(db.XPTransactions, "Id", "Id", session.XPTransactionId);
            return View(retval);
        }

        // GET: Sessions/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Session session = db.Sessions.Find(id);
            if (session == null)
            {
                return HttpNotFound();
            }
            return View(session);
        }

        // POST: Sessions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Session session = db.Sessions.Find(id);
            db.Sessions.Remove(session);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
