using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adm_PasswordChange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["login"] == null || ((dtoLogin)Session["login"]).accName == "")
            {
                Response.Redirect("~/ad");
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string mat_khau_cu = "";
        string mat_khau_moi = "";
        string nhap_lai_mk = "";
        mat_khau_cu = txtPassword.Text;
        mat_khau_moi = txtNewPass.Text;
        nhap_lai_mk = txtNewPass_re.Text;
        if (mat_khau_cu == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Vui lòng nhập mật khẩu cũ.')", true);
            return;
        }
        if (mat_khau_moi == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Vui lòng nhập mật khẩu mới.')", true);
            return;
        }
        if (nhap_lai_mk == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Vui lòng nhập lại mật khẩu mới.')", true);
            return;
        }
        if (mat_khau_moi != nhap_lai_mk)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Nhập lại mật khẩu không chính xác, vui lòng kiểm tra lại.')", true);
            return;
        }
        clsAccount acc = new clsAccount();
        string result = "";
        string accName = ((dtoLogin)Session["login"]).accName;
        result = acc.changePassword(accName, mat_khau_cu, mat_khau_moi);
        if (result != "1")
        {
            string msg = string.Format("parent.close_pass_change(); parent.show_msg('{0}')", result);
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.close_pass_change(); parent.show_msg('Thay đổi mật khẩu thành công.')", true);
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.close_pass_change()", true);
    }

    private void clear()
    {
        txtPassword.Text = "";
        txtNewPass.Text = "";
        txtNewPass_re.Text = "";
    }
}