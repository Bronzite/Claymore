using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Claymore.Models
{
    public partial class BattleMech
    {
        private ClaymoreDataModelContainer db = new ClaymoreDataModelContainer();

        public BattleMechBattleForceStatus LatestStatus
        {
            get
            {
                if (BattleMechBattleForceStatus.Count == 0)
                {
                    return null;
                }
                else
                {
                    List<BattleMechBattleForceStatus> list = new List<Models.BattleMechBattleForceStatus>(BattleMechBattleForceStatus);
                    list.Sort((a, b) => { return a.Timestamp.CompareTo(b.Timestamp); });
                    return list.First();
                }
                
            }
        }

        
    }
    public partial class BattleforceStats
    {
        public string MovementTypesString
        {
            get
            {
                string retval = "";
                foreach(MovementAbility moveAbility in MovementAbilities)
                {
                    retval = string.Format("{2}{0}{1}/", moveAbility.Amount.ToString(), moveAbility.MovementType.Suffix,retval);
                }
                return retval.Substring(0, retval.Length - 1);
            }
        }
    }

    public partial class BattleforceStatsSpecialAbility
    {
        public string RangeCode (int i)
        {
            if (i == 0) return "-"; else return i.ToString();
        }

        public override string ToString()
        {
            string retval = "";
            if (!Parameter.HasValue && !ShortRange.HasValue )
                retval = SpecialAbility.Code;
            else
            {
                if(Parameter == null)
                    retval = string.Format("{0} {1}/{2}/{3}", SpecialAbility.Code,RangeCode(ShortRange.Value),RangeCode(MediumRange.Value),RangeCode(LongRange.Value));
                else
                    retval = string.Format("{0}{1}", SpecialAbility.Code, Parameter);
            }
                return retval;
        }
    }

    public partial class BattleMechBattleForceStatus
    {
        private ClaymoreDataModelContainer db = new ClaymoreDataModelContainer();

        public int CriticalHits
        {
            get
            {
                return MPHits + WeaponsHits + FireControlHits + EngineHits;
            }
        }



    }
}