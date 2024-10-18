using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            init();
        }
    }

    private void init()
    {
        object obj_parent = "1";
        object obj_news_id = "0";
        if (RouteData.Values["CatID"] != null)
        {
            obj_parent = RouteData.Values["CatID"];
        }
        if (RouteData.Values["NewsID"] != null)
        {
            obj_news_id = RouteData.Values["NewsID"];
        }
        int iparent_id = Convert.ToInt32(obj_parent);
        int news_id = Convert.ToInt32(obj_news_id);
        clsCategory clsCat = new clsCategory();
        if (news_id == 0)
        {
            dtoCategory cat = clsCat.selectCategoryByCatID(iparent_id);
            if (cat != null)
            {
                string pageStyle = cat.pageStyle;
                myControls ctrl = (myControls)Page.LoadControl(string.Format("~/PageStyles/{0}/default.ascx", pageStyle));
                ctrl.cat_id = cat.catID;
                ctrl.news_id = news_id;
                Home.Controls.Clear();
                Home.Controls.Add(ctrl);
            }
        }
        else
        {
            dtoCategory cat = new dtoCategory();
            cat = clsCat.selectCategoryByCatID(iparent_id);
            if (cat.catName != "")
            {
                myControls ctrl = new myControls();
                switch (cat.pageStyle)
                {
                    case "MessagePage":
                        ctrl = (myControls)Page.LoadControl("~/PageStyles/ThongBaoPage/default.ascx");
                        break;
                    case "ColumnPage":
                        ctrl = (myControls)Page.LoadControl("~/PageStyles/ColumnPage/default.ascx");
                        break;
                    case "ImagePage":
                        ctrl = (myControls)Page.LoadControl("~/PageStyles/ImageDetail/default.ascx");
                        break;
                    default:
                        ctrl = (myControls)Page.LoadControl("~/PageStyles/NewsDetailPage/default.ascx");
                        break;
                }

                ctrl.cat_id = cat.catID;
                ctrl.news_id = news_id;
                Home.Controls.Clear();
                Home.Controls.Add(ctrl);
            }
        }
    }
}