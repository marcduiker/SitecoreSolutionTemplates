using Sitecore.Data;
using Sitecore.Data.Items;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SitecoreSolution.SitecoreLayer
{
    public static class ItemHelper
    {
        public static Item GetItem(ID itemId)
        {
            return Sitecore.Context.Database.GetItem(itemId);
        }
    }
}
