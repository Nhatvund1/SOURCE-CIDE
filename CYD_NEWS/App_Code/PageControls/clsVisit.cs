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
    public class clsVisit : System.Web.UI.UserControl
    {
        public clsVisit()
        {

        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
            StringBuilder html = new StringBuilder("");
            html.AppendLine(string.Format("<li><i class=\"fa fa-fw fa-spinner fa-pulse icon-2x\"></i>Đang online<span class=\"badge\">{0}</span></li>", Application["Online"].ToString()));
            html.AppendLine(string.Format("<li><i class=\"fa fa-fw fa-user icon-2x\"></i>Hôm nay<span class=\"badge\">{0}</span></li>", Application["Today"].ToString()));
            html.AppendLine(string.Format("<li><i class=\"fa fa-fw fa-calendar icon-2x\"></i>Hôm qua<span class=\"badge\">{0}</span></li>", Application["Yesterday"].ToString()));
            html.AppendLine(string.Format("<li><i class=\"fa fa-fw fa-bar-chart icon-2x\"></i>Tất cả<span class=\"badge\">{0}</span></li>", Application["All"].ToString()));
            writer.Write(html.ToString());
        }
    }
}