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
    public class clsColumnDetail : UserControl
    {
        public clsColumnDetail()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            int catID = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["CatID"]);
            int NewsID = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["NewsID"]);
            if (NewsID != 0)
            {
                dtoNewsCategory news = new dtoNewsCategory();
                clsNewsZZ newsz = new clsNewsZZ();
                news = newsz.selectNewsByNewsID(NewsID);
                if (news.newsID != 0)
                {
                    html.AppendLine(string.Format("<h3 class=\"column-ntitle\">{0}</h3>", news.title));
                    html.AppendLine("<div class=\"column-content\">");
                    html.AppendLine(news.detail);
                    html.AppendLine("</div>");
                }
            }
            else
            {
                List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
                clsNewsZZ newsz = new clsNewsZZ();
                lstNews = newsz.selectNewsByCatID(catID, true, 1);
                if (lstNews.Count != 0)
                {
                    dtoNewsCategory news = lstNews[0];
                    html.AppendLine(string.Format("<h3 class=\"column-ntitle\">{0}</h3>", news.title));
                    html.AppendLine("<div class=\"column-content\">");
                    html.AppendLine(news.detail);
                    html.AppendLine("</div>");
                }
            }
            writer.Write(html.ToString());
        }
    }
}