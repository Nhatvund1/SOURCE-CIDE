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
    public class clsMessage : UserControl
    {
        public byte location { get; set; }

        public clsMessage()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            List<dtoCategory> lstCat = new List<dtoCategory>();
            clsCategoryZZ catz = new clsCategoryZZ();
            lstCat = catz.selectCategoryByParentLocation(1, location, true, 0);
            if (lstCat.Count != 0)
            {
                dtoCategory cat = lstCat[0];
                string cat_url = string.Format("/{0}-{1}",
                    clsUrl.Convert(cat.catName),
                    cat.catID);
                html.AppendLine(string.Format("<h3 class=\"cat-tit\"><span>{0}</span><a href=\"{1}\"{2}class=\"pull-right all\">Tất cả<i class=\"fa fa-fw fa-angle-double-right\"></i></a></h3>", cat.catName, cat_url, cat.newTab != true ? "" : " target=\"_blank\" "));
                html.AppendLine("<div class=\"msg-box\">");
                List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
                clsNewsZZ newsz = new clsNewsZZ();
                lstNews = newsz.selectNewsByCatID(cat.catID, true, cat.newsNumber);
                foreach (dtoNewsCategory item in lstNews)
                {
                    string news_url = string.Format("/{0}-{1}/{2}-{3}",
                          clsUrl.Convert(item.catName),
                          item.catID,
                          clsUrl.Convert(item.title), item.newsID);
                    html.AppendLine("<div class=\"msg-item\">");
                    html.AppendLine(string.Format("<a href=\"{0}\" class=\"msg-left\">", news_url));
                    html.AppendLine(string.Format("<p>{0}</p>", item.createdDate.Day));
                    html.AppendLine(string.Format("<p>Tháng {0}</p>", item.createdDate.Month));
                    html.AppendLine("</a>");
                    html.AppendLine("<div class=\"msg-right\">");
                    html.AppendLine(string.Format("<h5><a href=\"{0}\">{1}</a></h5>", news_url, item.title));
                    html.AppendLine("</div>");
                    html.AppendLine("</div>");
                }
                html.AppendLine("</div>");
            }
            writer.Write(html.ToString());
        }
    }
}