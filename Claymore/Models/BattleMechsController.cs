using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Claymore.Models
{
    public class BattleMechsController : Controller
    {
        ClaymoreDataModelContainer db = new ClaymoreDataModelContainer();
        // GET: BattleMechs
        public ActionResult Index()
        {
            IEnumerable<Equipment> ieEquipment = db.Equipments;
            List<BattleMech> retval = new List<BattleMech>();

            foreach(Equipment eBM in ieEquipment)
            {
                BattleMech BM = eBM as BattleMech;
                if (BM!=null) retval.Add(BM);
            }


            return View(retval);
        }

        public ActionResult AddBattleMech()
        {
            return View(new List<BattleMechModel>(db.BattleMechModels));
        }

        [HttpPost]
        public ActionResult AddBattleMech(Guid battlemechId, Guid ownerId,string mechName)
        {
            BattleMech bm = new BattleMech();
            
            bm.Model = db.BattleMechModels.Find(battlemechId);
            bm.Id = Guid.NewGuid();
            if (ownerId == Guid.Empty)
            {
                bm.Owner = null;
            }
            else
            {
                bm.Owner = db.Characters.Find(ownerId);
            }
            bm.Quantity = 1;
            bm.Name = mechName;
            BattleMechBattleForceStatus bmbfs = new BattleMechBattleForceStatus();
            bmbfs.Id = Guid.NewGuid();
            bmbfs.Armor = bm.Model.BattleforceStat.Armor;
            bmbfs.Structure = bm.Model.BattleforceStat.Structure;
            bmbfs.EngineHits = 0;
            bmbfs.FireControlHits = 0;
            bmbfs.MPHits = 0;
            bmbfs.Timestamp = DateTime.Now;
            bmbfs.WeaponsHits = 0;
            bm.BattleMechBattleForceStatus.Add(bmbfs);
            db.BattleMechBattleForceStatus.Add(bmbfs);
            db.Equipments.Add(bm);
            db.SaveChanges();
            return Redirect("~/BattleMechs/Index");
        }

        [Route("BattleMechs/Details/{idBattleMech}")]
        public ActionResult Details(Guid idBattleMech)
        {
            BattleMech retval = db.Equipments.Find(idBattleMech) as BattleMech;
            return View(retval);
        }
    }
}