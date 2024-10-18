using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class adm_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["login"] != null && ((dtoLogin)Session["login"]).accName != "")
            {
                Response.Redirect("~/ad/tin-tuc");
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string user = txtUser.Text.Trim();
        string password = txtPassword.Text;
        if (user == "")
        {
            string msg = "alert('Vui lòng nhập tên tài khoản.')";
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
            return;
        }
        if (password == "")
        {
            string msg = "alert('Vui lòng nhập mật khẩu.')";
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
            return;
        }
        clsAccount acc = new clsAccount();
        dtoLogin login = new dtoLogin();
        login = acc.signIn(user, password);
        if (login.accName != "")
        {
            Session["login"] = login;
            Response.Redirect("~/ad/tin-tuc");
        }
        else
        {
            string msg = "alert('Tài khoản hoặc mật khẩu không đúng, vui lòng kiểm tra lại.')";
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
        }
    }
}