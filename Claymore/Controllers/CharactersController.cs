using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Claymore.Models;
using Microsoft.AspNet.Identity;

namespace Claymore.Controllers
{
    public class CharactersController : Controller
    {
        private ClaymoreDataModelContainer db = new ClaymoreDataModelContainer();

        // GET: Characters
        public ActionResult Index()
        {
            return View(db.Characters.ToList());
        }

        // GET: Characters/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Character character = db.Characters.Find(id);
            if (character == null)
            {
                return HttpNotFound();
            }

            CharacterDetailViewModel retval = new CharacterDetailViewModel(character);
            foreach(CharacterOwnership co in character.CharacterOwnerships)
            {
                if (co.UserId.ToString() == User.Identity.GetUserId())
                {
                    retval.ChangesPermitted = true;
                }
            }

            return View(retval);
        }

        // GET: Characters/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Characters/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Birthdate")] Character character)
        {
            if (ModelState.IsValid)
            {
                character.Id = Guid.NewGuid();
                db.Characters.Add(character);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(character);
        }

        // GET: Characters/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Character character = db.Characters.Find(id);
            if (character == null)
            {
                return HttpNotFound();
            }
            return View(character);
        }

        // POST: Characters/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Birthdate")] Character character)
        {
            if (ModelState.IsValid)
            {
                db.Entry(character).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(character);
        }

        // GET: Characters/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Character character = db.Characters.Find(id);
            if (character == null)
            {
                return HttpNotFound();
            }
            return View(character);
        }

        // POST: Characters/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Character character = db.Characters.Find(id);
            db.Characters.Remove(character);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [Route("Characters/UpgradeXPAsset/{idCharacter}/{idSkill}")]
        public ActionResult UpgradeXPAsset(Guid idCharacter, Guid idSkill)
        {
            Character c = db.Characters.Find(idCharacter);
            XPAsset asset = db.XPAssets.Find(idSkill);

            if (c != null && asset !=null)
            {
                XPAsset XPPool = c.XPAssets.Where(x => x.Name == "XP Pool").First();
                int iPoints = XPPool.AllocatedXP.Value;
                if (asset.XPToUpgrade <= iPoints)
                {
                    XPTransaction newTransaction = new XPTransaction();
                    newTransaction.Id = Guid.NewGuid();
                    newTransaction.Description = "XP Spend";
                    newTransaction.Timestamp = DateTime.Now;
                    XPChange chgAddToAsset = new XPChange();
                    chgAddToAsset.Id = Guid.NewGuid();
                    chgAddToAsset.Transaction = newTransaction;
                    chgAddToAsset.XPAsset = asset;
                    chgAddToAsset.Amount = asset.XPToUpgrade;
                    XPChange chgDeductFromPool = new XPChange();
                    chgDeductFromPool.Id = Guid.NewGuid();
                    chgDeductFromPool.Transaction = newTransaction;
                    chgDeductFromPool.XPAsset = XPPool;
                    chgDeductFromPool.Amount = -asset.XPToUpgrade;
                    newTransaction.Changes.Add(chgAddToAsset);
                    newTransaction.Changes.Add(chgDeductFromPool);
                    db.XPTransactions.Add(newTransaction);
                    db.XPChanges.Add(chgAddToAsset);
                    db.XPChanges.Add(chgDeductFromPool);
                    db.SaveChanges();
                    XPAsset.RefreshAllXPAssets();
                }
            }
            if (Request != null)
            {
                return new RedirectResult(Request.UrlReferrer.AbsoluteUri);
            }
            else
            {
                return RedirectToAction("Details", idCharacter);
            }
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
