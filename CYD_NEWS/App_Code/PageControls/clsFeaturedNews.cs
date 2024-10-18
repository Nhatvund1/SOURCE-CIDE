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
    public class clsFeaturedNews : UserControl
    {
        public byte location { get; set; }

        public clsFeaturedNews()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder();
            List<dtoCategory> lstCat = new List<dtoCategory>();
            clsCategoryZZ catz = new clsCategoryZZ();
            lstCat = catz.selectCategoryByParentLocation(1, location, false, 1);
            if (lstCat.Count != 0)
            {
                dtoCategory cat = lstCat[0];
                html.AppendLine(string.Format("<h3 class=\"cat-tit\"><span>{2}</span><a href=\"/{0}-{1}\" class=\"pull-right all\">Tất cả<i class=\"fa fa-fw fa-angle-double-right\"></i></a></h3>", clsUrl.Convert(cat.catName), cat.catID, cat.catName));
                List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
                clsNewsZZ newz = new clsNewsZZ();
                lstNews = newz.selectNewsByCatID(cat.catID, true, cat.newsNumber);
                if (lstNews.Count != 0)
                {
                    string url = "";
                    if (lstNews.ElementAt(0).url != "")
                    {
                        url = lstNews.ElementAt(0).url;
                    }
                    else
                    {
                        url = string.Format("/{0}-{1}/{2}-{3}",
                            clsUrl.Convert(lstNews[0].catName),
                            lstNews[0].catID,
                            clsUrl.Convert(lstNews[0].title),
                            lstNews[0].newsID);
                    }
                    html.AppendLine("<div class=\"row\">");
                    html.AppendLine("<div class=\"col-xs-12 col-sm-5\">");
                    html.AppendLine("<div class=\"news-first\">");
                    html.AppendLine(string.Format("<a href=\"{0}\">", url));
                    html.AppendLine(string.Format("<p class=\"news-avatar\" style=\"background-image: url('{0}')\"></p>", lstNews[0].avatar));
                    html.AppendLine("</a>");
                    html.AppendLine(string.Format("<h4><a href=\"{0}\">{1}</a></h4>", url, lstNews[0].title));
                    html.AppendLine(string.Format("<p class=\"date\"><i class=\"fa fa-fw fa-calendar icon\"></i>{0}</p>", Convert.ToDateTime(lstNews[0].createdDate).ToString("dd/MM/yyyy")));
                    html.AppendLine(string.Format("<p class=\"text-muted\">{0}</p>", lstNews[0].description));
                    html.AppendLine("</div>");
                    html.AppendLine("</div>");
                    html.AppendLine("<div class=\"col-xs-12 col-sm-7\">");
                    html.AppendLine("<div class=\"news-lst\">");
                    for (int i = 1; i < lstNews.Count; i++)
                    {
                        string news_url = "";
                        if (lstNews.ElementAt(i).url != "")
                        {
                            news_url = lstNews.ElementAt(i).url;
                        }
                        else
                        {
                            news_url = string.Format("/{0}-{1}/{2}-{3}", clsUrl.Convert(lstNews[i].catName),
                                lstNews[i].catID,
                                clsUrl.Convert(lstNews[i].title), lstNews[i].newsID);
                        }
                        html.AppendLine("<div class=\"lst-item\">");
                        html.AppendLine("<div class=\"n-left\">");
                        html.AppendLine(string.Format("<a href=\"{0}\">", news_url));
                        html.AppendLine(string.Format("<p style=\"background-image: url('{0}')\"></p>", lstNews[i].avatar));
                        html.AppendLine("</a>");
                        html.AppendLine("</div>");
                        html.AppendLine("<div class=\"n-right\">");
                        html.AppendLine(string.Format("<h5><a href=\"{0}\">{1}</a></h5>", news_url, lstNews[i].title));
                        html.AppendLine(string.Format("<p class=\"date\"><i class=\"fa fa-fw fa-calendar icon\"></i>{0}</p>", Convert.ToDateTime(lstNews[i].createdDate).ToString("dd/MM/yyyy")));
                        html.AppendLine("</div>");
                        html.AppendLine("</div>");
                    }
                    html.AppendLine("</div>");
                    html.AppendLine("</div>");
                    html.AppendLine("</div>");
                }
            }
            writer.Write(html.ToString());
        }
    }
}