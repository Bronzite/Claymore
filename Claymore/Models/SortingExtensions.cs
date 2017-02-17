using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Claymore.Models
{
    public partial class Session
    {
        public static int Compare (object a, object b)
        {
            Session sA = a as Session;
            Session sB = b as Session;

            if (sA == null || sB == null) return 0;
            return sA.SessionDate.CompareTo(sB.SessionDate);
        }
    }
}