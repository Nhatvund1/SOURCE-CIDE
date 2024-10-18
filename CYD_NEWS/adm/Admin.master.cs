using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adm_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["login"] == null || ((dtoLogin)Session["login"]).accName == "")
            {
                Response.Redirect("~/ad");
            }
            else
            {
                liFullName.Text = ((dtoLogin)Session["login"]).fullName;
            }
        }
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/ad");
    }
}
