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
    public class clsLink : UserControl
    {
        public byte location { get; set; }

        public clsLink()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            List<dtoCategory> lstCat = new List<dtoCategory>();
            clsCategoryZZ catz = new clsCategoryZZ();
            lstCat = catz.selectCategoryByParentLocation(1, location, false, 0);
            if (lstCat.Count != 0)
            {
                dtoCategory cat = lstCat[0];
                List<dtoCategory> lstLink = new List<dtoCategory>();
                lstLink = catz.selectCategoryByParent(cat.catID, false, 0);
                html.AppendLine(string.Format("<h3 class=\"cat-tit-3\"><span>{0}</span></h3>", cat.catName));
                html.AppendLine("<ul class=\"list-unstyled lst\">");
                foreach (dtoCategory item in lstLink)
                {
                    html.AppendLine(string.Format("<li><a href=\"{0}\" {1}>{2}</a></li>",
                        item.url != "" ? item.url : string.Format("/{0}-{1}", clsUrl.Convert(item.catName), item.catID),
                        item.newTab == true ? "target=\"_blank\"" : "",
                        item.catName));
                }
                html.AppendLine("</ul>");
            }
            writer.Write(html.ToString());
        }
    }
}