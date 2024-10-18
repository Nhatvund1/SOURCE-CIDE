using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Text;

namespace FillData
{
    public class clsConnect : UserControl
    {
        public byte location { get; set; }

        public clsConnect()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            List<dtoCategory> lstCat = new List<dtoCategory>();
            clsCategoryZZ catz = new clsCategoryZZ();
            lstCat = catz.selectCategoryByParentLocation(1, location, false, 1);
            if (lstCat.Count != 0)
            {
                dtoCategory cat = lstCat[0];
                html.AppendLine(string.Format("<div class=\"col-xs-12\"><h3 class=\"link-title\">{0}</h3></div>", cat.catName));
                List<dtoCategory> lst_cat_child = new List<dtoCategory>();
                lst_cat_child = catz.selectCategoryByParent(cat.catID, true, 0);
                foreach (dtoCategory item in lst_cat_child)
                {
                    string url = "";
                    if (item.url != "")
                    {
                        url = item.url;
                    }
                    else
                    {
                        url = string.Format("/{0}-{1}", clsUrl.Convert(item.catName), item.catID);
                    }
                    html.AppendLine(string.Format("<div class=\"col-xs-12 col-sm-6 col-md-3\"><a href=\"{0}\"{1}><p>{2}</p></a></div>", url, item.newTab == true ? "target=\"_blank\"" : "", item.catName));
                }
            }
            writer.Write(html.ToString());
        }
    }
}