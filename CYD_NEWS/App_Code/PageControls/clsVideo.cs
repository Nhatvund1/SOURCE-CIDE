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
    public class clsVideo : UserControl
    {
        public byte location { get; set; }

        public clsVideo()
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
                if (cat != null)
                {
                    html.AppendLine(string.Format("<h3 class=\"cat-tit-2\"><span>{0}</span></h3>", cat.catName));
                    html.AppendLine("<div class=\"embed-responsive embed-responsive-16by9\" style=\"padding-bottom: 56.25%!important;\">");
                    html.AppendLine(string.Format("<iframe src=\"{0}\"></iframe>", cat.url));
                    html.AppendLine("</div>");
                }
            }
            writer.Write(html.ToString());
        }
    }
}