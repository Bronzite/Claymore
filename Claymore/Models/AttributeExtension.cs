using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Claymore.Models
{
    public partial class Attribute
    {
        public int AttributeLevel {
            get {
                return (int)(Math.Floor((double)AllocatedXP / 100D));
            }
        }
    }
}