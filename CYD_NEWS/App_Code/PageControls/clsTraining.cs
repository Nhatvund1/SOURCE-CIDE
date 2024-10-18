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
    public class clsTraining : System.Web.UI.UserControl
    {
        public byte location { get; set; }

        public clsTraining()
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
                if (cat != null)
                {
                    html.AppendLine(string.Format("<h3 class=\"cat-tit\"><span>{0}</span></h3>", cat.catName));
                    html.AppendLine("<div class=\"row\">");
                    List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
                    clsNewsZZ newsz = new clsNewsZZ();
                    lstNews = newsz.selectNewsByCatID(cat.catID, true, cat.newsNumber);
                    int i = 0;
                    foreach (dtoNewsCategory item in lstNews)
                    {
                        string url = string.Format("/{0}-{1}/{2}-{3}", clsUrl.Convert(cat.catName), cat.catID, clsUrl.Convert(item.title), item.newsID);
                        html.AppendLine("<div class=\"col-xs-12 col-sm-3\">");
                        html.AppendLine("<div class=\"f-item\">");
                        html.Append(string.Format("<a href=\"{0}\">", url));
                        html.AppendLine(string.Format("<p style=\"background-image: url('{0}')\"></p>", item.avatar));
                        html.AppendLine("</a>");
                        html.AppendLine(string.Format("<a href=\"{0}\">{1}</a>", url, item.title));
                        html.AppendLine("</div>");
                        html.AppendLine("</div>");
                        i++;
                        if (i == 4 || i == 8)
                        {
                            html.AppendLine("<div class=\"clearfix\"></div>");
                        }
                    }
                    html.AppendLine("</div>");
                }
            }
            writer.Write(html.ToString());
        }
    }
}