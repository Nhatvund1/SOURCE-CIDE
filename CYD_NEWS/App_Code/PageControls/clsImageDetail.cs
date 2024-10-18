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
    public class clsImageDetail : UserControl
    {
        public clsImageDetail()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            int cat_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["CatID"]);
            int news_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["NewsID"]);
            dtoNewsCategory news = new dtoNewsCategory();
            clsNewsZZ newz = new clsNewsZZ();
            news = newz.selectNewsByNewsID(news_id);
            if (news.newsID != 0)
            {
                if (news.detail != "")
                {
                    HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                    doc.LoadHtml(news.detail);
                    foreach (HtmlAgilityPack.HtmlNode item in doc.DocumentNode.SelectNodes("//img"))
                    {
                        try
                        {
                            string src = item.Attributes["src"].Value;
                            html.Append("<div>");
                            html.AppendLine(string.Format("<img data-u=\"image\" src=\"{0}\" />", src));
                            html.AppendLine(string.Format("<img data-u=\"thumb\" src=\"{0}\" />", src));
                            html.AppendLine("</div>");
                        }
                        catch { }
                    }
                }
            }
            writer.Write(html.ToString());
        }
    }
}