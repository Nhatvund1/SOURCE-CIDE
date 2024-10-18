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
    public class clsCatTitle : UserControl
    {
        public byte location { get; set; }
        public clsCatTitle()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            string html = "";
            int cat_id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["CatID"]);
            dtoCategory cat = new dtoCategory();
            clsCategoryZZ catz = new clsCategoryZZ();
            cat = catz.selectCategoryByCatID(cat_id);
            if (cat.catID != 0)
            {
                html = string.Format("<h3 class=\"cat-tit\"><span>{0}</span></h3>", cat.catName);
            }
            writer.Write(html);
        }
    }
}