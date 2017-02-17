using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Claymore.Models
{
    public class CharacterDetailViewModel
    {
        public CharacterDetailViewModel(Character c)
        {
            ClaymoreDataModelContainer db = new ClaymoreDataModelContainer();
            Character = c;
            lstXPTransactions = new List<XPTransaction>();
            foreach(XPAsset curAsset in  c.XPAssets)
            {
                foreach(XPChange curChange in curAsset.XPChanges)
                {
                    if(!lstXPTransactions.Contains( curChange.Transaction))
                    {
                        lstXPTransactions.Add(curChange.Transaction);
                    }
                }
            }
            foreach(XPTransaction curTransaction in lstXPTransactions)
            {
                List<XPChange> lstCharacterRelevantChanges = new List<XPChange>(curTransaction.Changes.Where(x => x.XPAsset.CharacterId == c.Id));
                lstCharacterRelevantChanges.Sort(XPChange.Compare);
                curTransaction.Changes = lstCharacterRelevantChanges; 
            }

            lstXPTransactions.Sort(XPTransaction.Compare);
        }
        public Character Character { get; set; }
        public List<XPTransaction> lstXPTransactions { get; set; }
    }
}