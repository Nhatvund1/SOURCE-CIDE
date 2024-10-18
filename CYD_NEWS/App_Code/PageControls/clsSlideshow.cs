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
    public class clsSlideshow : UserControl
    {
        public byte location { get; set; }

        public clsSlideshow()
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
                List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
                clsNewsZZ newsz = new clsNewsZZ();
                lstNews = newsz.selectNewsByCatID(cat.catID, true, cat.newsNumber);
                int index_node = 0;
                bool first_node = true;
                bool first_img = true;
                html.AppendLine("<div id=\"carousel-example-generic\" class=\"carousel slide\" data-ride=\"carousel\">");
                html.AppendLine("<ol class=\"carousel-indicators\">");
                foreach (dtoNewsCategory item in lstNews)
                {
                    html.AppendLine(string.Format("<li data-target=\"#carousel-example-generic\" data-slide-to=\"{0}\" {1}></li>", index_node, first_node == true ? "class=\"active\"" : ""));
                    index_node++;
                    first_node = false;
                }
                html.AppendLine("</ol>");
                html.AppendLine("<div class=\"carousel-inner\" role=\"listbox\">");
                foreach (dtoNewsCategory item in lstNews)
                {
                    if (item.url != "")
                        html.AppendLine(string.Format("<a href=\"{0}\" class=\"item{1}\">", item.url, first_img == true ? " active" : ""));
                    else
                        html.AppendLine(string.Format("<div class=\"item{0}\">", first_img == true ? " active" : ""));
                    html.AppendLine(string.Format("<img src=\"{0}\" alt=\"{1}\">", item.avatar, item.title == "" ? "..." : item.title));
                    if (item.title != "" || item.description != "")
                    {
                        html.AppendLine("<div class=\"carousel-caption\">");
                        html.AppendLine(string.Format("<h3>{0}</h3>", item.title));
                        html.AppendLine(string.Format("<p>{0}</p>", item.description));
                        html.AppendLine("</div>");
                    }
                    if (item.url != "")
                        html.AppendLine("</a>");
                    else
                        html.AppendLine("</div>");
                    first_img = false;
                }
                html.AppendLine("</div>");
                html.AppendLine("<a class=\"left carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"prev\">");
                html.AppendLine("<span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>");
                html.AppendLine("<span class=\"sr-only\">Previous</span>");
                html.AppendLine("</a>");
                html.AppendLine("<a class=\"right carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"next\">");
                html.AppendLine("<span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>");
                html.AppendLine("<span class=\"sr-only\">Next</span>");
                html.AppendLine("</a>");
                html.AppendLine("</div>");

            }

            writer.Write(html.ToString());
        }
    }
}