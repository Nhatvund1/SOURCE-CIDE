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
    public class clsService : UserControl
    {
        public byte location { get; set; }

        public clsService()
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
                html.AppendLine(string.Format("<h3 class=\"cat-tit\"><span>Hệ thống sinh viên</span></h3>", cat.catName));
                List<dtoCategory> lstCatChild = new List<dtoCategory>();
                lstCatChild = catz.selectCategoryByParent(cat.catID, false, 0);
                html.AppendLine("<ul class=\"lst-service\">");
                foreach (dtoCategory item in lstCatChild)
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
                    html.AppendLine(string.Format("<li><a href=\"{0}\"{1}>{2}{3}</a></li>", url, item.newTab == true ? " target=\"_blank\"" : "", string.Format("<i class=\"fa fa-fw {0} icon-2x\"></i>", item.fontIcon), item.catName));
                }
                html.AppendLine("</ul>");
            }
            writer.Write(html.ToString());
        }
    }
}