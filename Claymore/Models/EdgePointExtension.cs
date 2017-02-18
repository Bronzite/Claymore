using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Claymore.Models
{
    public partial class EdgePoints
    {
        public int AvailablePoints
        {
            get { if (AllocatedXP.HasValue)
                    return (int)(Math.Floor((double)(AllocatedXP.Value / 20)));
                else
                    return 0;
            }
        }
    }
}