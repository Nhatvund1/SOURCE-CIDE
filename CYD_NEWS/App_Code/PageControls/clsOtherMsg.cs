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
    public class clsOtherMsg : System.Web.UI.UserControl
    {
        public clsOtherMsg()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            int cat_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["CatID"]);
            int news_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["NewsID"]);
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
                    string msg_url = string.Format("/{0}-{1}/{2}-{3}",
                          clsUrl.Convert(cat.catName),
                          cat.catID,
                          clsUrl.Convert(item.title), item.newsID);
                    html.AppendLine(string.Format("<li><a href=\"{0}\"><p class=\"msg-tit\">{1}</p></a><p class=\"msg-date\">{2}</p></li>", msg_url, item.title, Convert.ToDateTime(item.createdDate).ToString("dd/MM/yyyy")));
                }
            }
            writer.Write(html.ToString());
        }
    }
}