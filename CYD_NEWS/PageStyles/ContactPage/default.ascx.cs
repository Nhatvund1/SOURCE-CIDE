using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageStyles_ContactPage_default : myControls
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadPageTitle();
        }
    }

    private void loadPageTitle()
    {
        dtoCategory cat = new dtoCategory();
        clsCategoryZZ catz = new clsCategoryZZ();
        cat = catz.selectCategoryByCatID(cat_id);
        Page.Title = cat.catName;
        Page.MetaDescription = cat.description;
    }

    //protected void btnSend_Click(object sender, EventArgs e)
    //{
    //    string fullName = txtFullName.Text.Trim();
    //    string email = txtEmail.Text.Trim();
    //    string phone = txtPhone.Text.Trim();
    //    string subject = txtSubject.Text.Trim();
    //    string content = txtContent.Text.Trim();
    //    if (fullName == "")
    //    {
    //        lblMsg.Text = "Vui lòng nhập họ tên người liên hệ.";
    //        txtFullName.Focus();
    //        return;
    //    }
    //    if (subject == "")
    //    {
    //        lblMsg.Text = "Vui lòng nhập chủ đề.";
    //        txtSubject.Focus();
    //        return;
    //    }
    //    if (content == "")
    //    {
    //        lblMsg.Text = "Vui lòng nhập nội dung liên hệ.";
    //        txtContent.Focus();
    //        return;
    //    }
    //    dtoContact con = new dtoContact()
    //    {
    //        contactName = fullName,
    //        email = email,
    //        phone = phone,
    //        subject = subject,
    //        description = content,
    //    };
    //    clsContactZZ conz = new clsContactZZ();
    //    string result = "";
    //    result = conz.insertContact(con);
    //    if (result != "1")
    //    {
    //        lblMsg.Text = "Gửi thông tin liên hệ không thành công.";
    //    }
    //    else
    //    {
    //        lblMsg.Text = "Gửi thông tin liên hệ thành công.";
    //        clear_form();
    //    }
    //}

    //protected void btnClear_Click(object sender, EventArgs e)
    //{
    //    clear_form();
    //}

    //private void clear_form()
    //{
    //    txtFullName.Text = "";
    //    txtEmail.Text = "";
    //    txtPhone.Text = "";
    //    txtSubject.Text = "";
    //    txtContent.Text = "";
    //    txtFullName.Focus();
    //}
}