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
    public class clsIntroContent : UserControl
    {
        public clsIntroContent()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            int cat_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["CatID"]);
            dtoCategory parent_cat = new dtoCategory();
            clsCategoryZZ catz = new clsCategoryZZ();
            parent_cat = catz.selectCategoryByCatID(cat_id);
            if (parent_cat.catID != 0)
            {
                html.AppendLine(string.Format("<p>{0}</p>", parent_cat.description));
            }
            html.AppendLine("<div class=\"row\">");
            List<dtoCategory> lstCat = new List<dtoCategory>();
            lstCat = catz.selectCategoryByParent(cat_id, false, 0);
            foreach (dtoCategory cat in lstCat)
            {
                html.AppendLine("<div class=\"intro-item\">");
                html.AppendLine("<div class=\"col-xs-4 col-sm-5 col-md-3\">");
                html.AppendLine(string.Format("<p class=\"intro-item-img\" style=\"background-image: url('{0}')\"></p>", cat.avatar));
                html.AppendLine("<div class=\"intro-line\"></div>");
                html.AppendLine("</div>");
                html.AppendLine("<div class=\"col-xs-8 col-sm-7 col-md-9\">");
                html.AppendLine(string.Format("<a href=\"/{0}-{1}\">", clsUrl.Convert(cat.catName), cat.catID));
                html.AppendLine(string.Format("<h3 class=\"intro-item-title\">{0}</h3>", cat.catName));
                html.AppendLine("</a>");
                html.AppendLine(string.Format("<p>{0}</p>", cat.description));
                List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
                clsNewsZZ newsz = new clsNewsZZ();
                lstNews = newsz.selectNewsByCatID(cat.catID, true, cat.newsNumber);
                if (lstNews.Count != 0)
                {
                    html.AppendLine("<ul class=\"intro-list\">");
                    foreach (dtoNewsCategory item in lstNews)
                    {
                        string url = "";
                        if (item.url != "")
                        {
                            url = item.url;
                        }
                        else
                        {
                            url = string.Format("/{0}-{1}/{2}-{3}", clsUrl.Convert(cat.catName), cat.catID, clsUrl.Convert(item.title), item.newsID);
                        }
                        html.AppendLine(string.Format("<li><a href=\"{0}\">", url));
                        html.AppendLine(string.Format("<p>{0}</p>", item.title));
                        html.AppendLine("</a></li>");
                    }
                    html.AppendLine("</ul>");
                }
                html.AppendLine("</div>");
                html.AppendLine("</div>");
                html.AppendLine("<div class=\"clearfix\"></div>");
            }
            html.AppendLine("</div>");
            writer.Write(html.ToString());
        }
    }
}