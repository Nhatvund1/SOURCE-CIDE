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
    public class clsTopMenu : UserControl
    {
        public byte location { get; set; }

        public clsTopMenu()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            List<dtoCategory> lstCat = new List<dtoCategory>();
            clsCategoryZZ catz = new clsCategoryZZ();
            lstCat = catz.selectCategoryByParentLocation(1, location, false, 0);
            foreach (dtoCategory item in lstCat)
            {
                html.AppendLine(string.Format("<li><a href=\"{0}\" {1}>{2}</a></li>",
                    item.url != "" ? item.url : string.Format("/{0}-{1}", clsUrl.Convert(item.catName), item.catID),
                    item.newTab == true ? "target=\"_blank\"" : "",
                    item.catName));
            }
            writer.Write(html.ToString());
        }
    }
}