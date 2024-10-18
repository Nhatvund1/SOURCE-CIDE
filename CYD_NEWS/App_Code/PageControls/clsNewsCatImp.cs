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
    public class clsNewsCatImp : UserControl
    {
        public byte location { get; set; }
        public clsNewsCatImp()
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
                html.AppendLine(string.Format("<h3 class=\"cat-tit\"><span>{0}</span></h3>", cat.catName));
                html.AppendLine("<div class=\"msg-box\">");
                List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
                clsNewsZZ newsz = new clsNewsZZ();
                lstNews = newsz.selectNewsByCatImport(cat.catID);
                foreach (dtoNewsCategory item in lstNews)
                {
                    string news_url = string.Format("/{0}-{1}/{2}-{3}",
                        clsUrl.Convert(item.catName.ToString()),
                        item.catID.ToString(),
                        clsUrl.Convert(item.title), item.newsID.ToString());
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