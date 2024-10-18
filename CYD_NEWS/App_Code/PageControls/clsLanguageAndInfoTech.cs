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
    public class clsLanguageAndInfoTech : System.Web.UI.UserControl
    {
        public byte location { get; set; }

        public clsLanguageAndInfoTech()
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
                string cat_url = string.Format("/{0}-{1}", clsUrl.Convert(cat.catName), cat.catID);
                html.AppendLine(string.Format("<h3 class=\"cat-tit\"><span>{0}</span><a href=\"{1}\" class=\"pull-right all\">Tất cả<i class=\"fa fa-fw fa-angle-double-right\"></i></a></h3>", cat.catName, cat_url));
                html.AppendLine("<div class=\"row\">");
                List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
                clsNewsZZ newz = new clsNewsZZ();
                lstNews = newz.selectNewsByCatID(cat.catID, true, cat.newsNumber);
                int i = 0;
                foreach (dtoNewsCategory item in lstNews)
                {
                    i++;
                    string url = string.Format("/{0}-{1}/{2}-{3}", clsUrl.Convert(cat.catName), cat.catID, clsUrl.Convert(item.title), item.newsID);
                    html.AppendLine("<div class=\"col-xs-12 col-sm-4\"><div class=\"f-item\">");
                    html.AppendLine(string.Format("<a href=\"{0}\"><p style=\"background-image: url('{1}')\"></p></a>", url, item.avatar));
                    html.AppendLine(string.Format("<a href=\"{0}\">{1}</a>", url, item.title));
                    html.AppendLine("</div></div>");
                    if (i % 3 == 0)
                    {
                        html.AppendLine("<div class=\"clearfix\"></div>");
                    }
                }
            }
            html.AppendLine("</div>");
            writer.Write(html.ToString());
        }
    }
}