using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Claymore.Models
{
    public partial class Character
    {
        public int BaseSkillBonus (Skill s)
        {          
                int[] iStandard = { 20, 30, 50, 80, 120, 170, 230, 300, 380, 470, 570 };
                int retval = 0;
                double dModifier = 1.0D;
                if(XPAssets.Where(x=>x.Name=="Fast Learner").Count()>0)
                {
                    dModifier = 0.8D;
                }
                
                while(iStandard[retval] * dModifier < s.AllocatedXP )
                {
                    retval++;
                }
                return retval;
        }

        public int FinalSkillBonus (Skill s)
        {
            int iBase = BaseSkillBonus(s);
            Claymore.Models.Attribute a = XPAssets.Where(x => x.Name == s.PrimaryLinkAttribute).First() as Claymore.Models.Attribute;
            Claymore.Models.Attribute b = null;
            if (s.SecondaryLinkAttribute!=null && s.SecondaryLinkAttribute != "")
                 b = XPAssets.Where(x => x.Name == s.PrimaryLinkAttribute).First() as Claymore.Models.Attribute;

            if (a != null) iBase += a.LinkBonus;
            if (b != null) iBase += b.LinkBonus;
            return iBase;
        }
    }
}