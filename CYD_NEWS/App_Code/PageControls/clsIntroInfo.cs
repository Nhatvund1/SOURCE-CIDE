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
    public class clsIntroInfo : System.Web.UI.UserControl
    {
        public clsIntroInfo()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            int cat_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["CatID"]);
            dtoCategory cat = new dtoCategory();
            clsCategoryZZ catz = new clsCategoryZZ();
            cat = catz.selectCategoryByCatID(cat_id);
            if (cat != null)
            {
                html.AppendLine(string.Format("<p class=\"intro-ava\" style=\"background-image: url('{0}')\"></p>", cat.avatar != "" ? cat.avatar : "/images/no-img.jpg"));
                html.AppendLine("<div class=\"intro-detail\">");
                html.AppendLine(cat.detail);
                html.AppendLine("</div>");
            }
            writer.Write(html.ToString());
        }
    }
}