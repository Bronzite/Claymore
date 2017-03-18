using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;

namespace Claymore.Models
{
    public partial class XPAsset
    {
        public virtual int XPToUpgrade { get { return 1; } }

        public static void RefreshAllXPAssets ()
        {
            ClaymoreDataModelContainer db = new ClaymoreDataModelContainer();
            DbCommand cmdRefresh = db.Database.Connection.CreateCommand();
            cmdRefresh.CommandText = "UPDATE XPAssets SET XPAssets.AllocatedXP = (SELECT SUM(Amount) FROM XPChanges WHERE XPChanges.XPAssetId = XPAssets.Id)";
            db.Database.Connection.Open();
            cmdRefresh.ExecuteNonQuery();
            db.Database.Connection.Close();

        }
    }

    public partial class EdgePoints
    {
        public override int XPToUpgrade
        {
            get
            {
                Attribute attrEdge = this.Character.XPAssets.Where(x => x.Name == "EDG").First() as Attribute;

                if (AllocatedXP < attrEdge.AllocatedXP * 0.2)
                    return 20;
                else
                    return int.MaxValue;
                
            }
        }
    }

    public partial class Trait
    {
        public override int XPToUpgrade
        {
            get
            {
                return 100;
            }
        }
    }

    public partial class Attribute
    {
        public override int XPToUpgrade
        {
            get
            {
                return 100;
            }
        }
    }

    public partial class Skill
    {
        public override int XPToUpgrade
        {
            get
            {
                int[] iStandard = { 20, 30, 50, 80, 120, 170, 230, 300, 380, 470, 570 };
                int retval = 0;
                double dModifier = 1.0D;
                if (this.Character.XPAssets.Where(x => x.Name == "Fast Learner").Count() > 0)
                {
                    dModifier = 0.8D;
                }

                if (this.Character.XPAssets.Where(x => x.Name == "Slow Learner").Count() > 0)
                {
                    dModifier = 1.2D;
                }

                int iBaseSkillBonus = this.Character.BaseSkillBonus(this);
                if (iBaseSkillBonus < iStandard.Length)
                {
                    if (iBaseSkillBonus > 0)
                        return (int)((iStandard[iBaseSkillBonus + 1] - iStandard[iBaseSkillBonus]) * dModifier);
                    else
                        return (int)(iStandard[iBaseSkillBonus] * dModifier);
                }
                else
                    return int.MaxValue;
            }
        }
    }
}