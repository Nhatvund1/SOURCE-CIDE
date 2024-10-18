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
    public class clsColumnList : UserControl
    {
        public byte location { get; set; }
        public clsColumnList()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            int catID = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["CatID"]);
            int NewsID = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["NewsID"]);
            bool first = true;
            StringBuilder html = new StringBuilder("");
            List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
            clsNewsZZ newz = new clsNewsZZ();
            lstNews = newz.selectNewsByCatID(catID, true, 0);
            if (lstNews.Count != 0)
            {
                html.AppendLine("<ul class=\"column-lst\">");
                foreach (dtoNewsCategory item in lstNews)
                {
                    string url = "";
                    if (item.url != "")
                    {
                        url = item.url;
                    }
                    else
                    {
                        url = string.Format("/{0}-{1}/{2}-{3}", clsUrl.Convert(item.catName),
                        item.catID,
                        clsUrl.Convert(item.title),
                        item.newsID);
                    }
                    if (NewsID == 0 && first == true)
                    {
                        html.AppendLine(string.Format("<li><a href=\"{0}\" class=\"selected\">{1}</a></li>", url, item.title));
                        first = false;
                    }
                    else
                    {
                        html.AppendLine(string.Format("<li><a href=\"{0}\"{1}>{2}</a></li>", url, NewsID == item.newsID ? " class=\"selected\"" : "", item.title));
                    }
                }
                html.AppendLine("</ul>");
            }
            writer.Write(html.ToString());
        }
    }
}