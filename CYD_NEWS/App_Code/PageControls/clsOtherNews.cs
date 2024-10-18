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
    public class clsOtherNews : UserControl
    {
        public clsOtherNews()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            int cat_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["CatID"]);
            int news_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["NewsID"]);
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            dtoCategory cat = new dtoCategory();
            clsCategoryZZ catz = new clsCategoryZZ();
            cat = catz.selectCategoryByCatID(cat_id);
            if (cat.catID != 0)
            {
                List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
                clsNewsZZ newsz = new clsNewsZZ();
                lstNews = newsz.selectNewsByCatID(cat.catID, true, 10);
                foreach (dtoNewsCategory item in lstNews)
                {
                    string news_url = string.Format("/{0}-{1}/{2}-{3}",
                          clsUrl.Convert(cat.catName),
                          cat.catID,
                          clsUrl.Convert(item.title), item.newsID);
                    html.AppendLine("<div class=\"col-xs-12 col-sm-12 col-md-12\">");
                    html.AppendLine(string.Format("<a href=\"{0}\" class=\"cat-lst-item\">", news_url));
                    html.AppendLine("<div class=\"lst-it-left\">");
                    html.AppendLine(string.Format("<p style=\"background-image: url('{0}')\"></p>", item.avatar == "" ? "/images/no-img.jpg" : item.avatar));
                    html.AppendLine("</div>");
                    html.AppendLine("<div class=\"lst-it-right\">");
                    html.AppendLine(string.Format("<p>{0}</p>", item.title));
                    html.AppendLine("</div>");
                    html.AppendLine("</a>");
                    html.AppendLine("</div>");
                }
            }
            writer.Write(html.ToString());
        }
    }
}