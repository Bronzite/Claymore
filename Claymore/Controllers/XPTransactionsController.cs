using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Claymore.Models;

namespace Claymore.Controllers
{
    public class XPTransactionsController : Controller
    {
        private ClaymoreDataModelContainer db = new ClaymoreDataModelContainer();

        // GET: XPTransactions
        public ActionResult Index()
        {
            return View(db.XPTransactions.ToList());
        }

        // GET: XPTransactions/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            XPTransaction xPTransaction = db.XPTransactions.Find(id);
            if (xPTransaction == null)
            {
                return HttpNotFound();
            }
            return View(xPTransaction);
        }

        // GET: XPTransactions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: XPTransactions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Description,Timestamp")] XPTransaction xPTransaction)
        {
            if (ModelState.IsValid)
            {
                xPTransaction.Id = Guid.NewGuid();
                db.XPTransactions.Add(xPTransaction);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(xPTransaction);
        }

        // GET: XPTransactions/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            XPTransaction xPTransaction = db.XPTransactions.Find(id);
            if (xPTransaction == null)
            {
                return HttpNotFound();
            }
            return View(xPTransaction);
        }

        // POST: XPTransactions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Description,Timestamp")] XPTransaction xPTransaction)
        {
            if (ModelState.IsValid)
            {
                db.Entry(xPTransaction).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(xPTransaction);
        }

        // GET: XPTransactions/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            XPTransaction xPTransaction = db.XPTransactions.Find(id);
            if (xPTransaction == null)
            {
                return HttpNotFound();
            }
            return View(xPTransaction);
        }

        // POST: XPTransactions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            XPTransaction xPTransaction = db.XPTransactions.Find(id);
            db.XPTransactions.Remove(xPTransaction);
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
