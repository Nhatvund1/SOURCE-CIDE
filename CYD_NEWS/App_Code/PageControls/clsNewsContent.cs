using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Text;
using System.Globalization;

namespace FillData
{
    public class clsNewsContent : UserControl
    {
        public clsNewsContent()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            int news_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["NewsID"]);
            StringBuilder html = new StringBuilder("");
            dtoNewsCategory news = new dtoNewsCategory();
            clsNewsZZ newsz = new clsNewsZZ();
            news = newsz.selectNewsByNewsID(news_id);
            newsz.updateView(news_id);
            if (news.newsID != 0)
            {
                html.AppendLine(string.Format("<h3 class=\"cat-tit\"><span>{0}</span></h3>", news.catName));
                html.AppendLine(string.Format("<h4>{0}</h4>", news.title));
                html.AppendLine(string.Format("<p class=\"sub-title\"><i class=\"fa fa-fw fa-calendar\"></i>{0} <i class=\"fa fa-fw fa-clock-o\"></i>{1}</p>",
                    Convert.ToDateTime(news.createdDate).ToString("D", new CultureInfo("vi-vn")),
                    Convert.ToDateTime(news.createdDate).ToString("hh:mm tt", new CultureInfo("vi-vn"))));
                html.AppendLine("<div id=\"cat-detail-content\">");
                html.AppendLine(news.detail);
                html.AppendLine("</div>");
            }
            writer.Write(html.ToString());
        }
    }
}