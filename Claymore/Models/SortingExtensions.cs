using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Claymore.Models
{
    public partial class Session
    {
        public static int Compare(object a, object b)
        {
            Session sA = a as Session;
            Session sB = b as Session;

            if (sA == null || sB == null) return 0;
            return sA.SessionDate.CompareTo(sB.SessionDate);
        }
    }

    public partial class XPTransaction
    {
        public static int Compare(object a, object b)
        {
            XPTransaction sA = a as XPTransaction;
            XPTransaction sB = b as XPTransaction;

            if (sA == null || sB == null) return 0;
            if (!sA.Timestamp.HasValue || !sB.Timestamp.HasValue) return 0;
            return sA.Timestamp.Value.CompareTo(sB.Timestamp.Value);
        }
    }

    public partial class XPChange
    {
        public static int Compare (object a, object b)
        {
            XPChange xpcA = a as XPChange;
            XPChange xpcB = b as XPChange;

            if (xpcA == null || xpcB == null) return 0;

            return XPAsset.Compare(xpcA.XPAsset, xpcB.XPAsset);
        }
    }
   
    public partial class XPAsset
    {
        public static int Compare(object a, object b)
        {
            XPAsset xpA = a as XPAsset;
            XPAsset xpB = b as XPAsset;

            if (xpA == null || xpB == null) return 0;
            string[] sDisplayOrder = { "STR", "BOD", "RFL", "DEX", "INT", "WIL", "CHA", "EDG" };

            int iAOrdinal = Array.IndexOf(sDisplayOrder, xpA.Name);
            int iBOrdinal = Array.IndexOf(sDisplayOrder, xpB.Name);

            if (iAOrdinal > -1 && iBOrdinal > -1) return iAOrdinal - iBOrdinal;

            if (iAOrdinal > -1) return -1;
            if (iBOrdinal > -1) return 1;

            return xpA.Name.CompareTo(xpB.Name); 


            
        }
    }


}