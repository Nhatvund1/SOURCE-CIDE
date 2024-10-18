using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;
using System.Globalization;

public partial class adm_ContactDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["login"] == null || ((dtoLogin)Session["login"]).accName == "")
            {
                Response.Redirect("~/ad");
            }

            loadContactDetail();
        }
    }

    private void loadContactDetail()
    {
        clsContact cont = new clsContact();
        int contactID = Convert.ToInt32(Request.QueryString["ContactID"]);
        dtoContact detail = new dtoContact();
        detail = cont.selectContactByContactID(contactID);
        StringBuilder html = new StringBuilder("");
        if (detail != null)
        {
            html.AppendLine("<h4>Họ tên:</h4>");
            html.AppendLine(string.Format("<p>{0}</p>", detail.contactName));
            html.AppendLine("<h4>Email:</h4>");
            html.AppendLine(string.Format("<p>{0}</p>", detail.email));
            html.AppendLine("<h4>Điện thoại:</h4>");
            html.AppendLine(string.Format("<p>{0}</p>", detail.phone));
            html.AppendLine("<h4>Ngày gửi:</h4>");
            html.AppendLine(string.Format("<p>{0}</p>", Convert.ToDateTime(detail.createdDate).ToString("dd/MM/yyyy - hh:mm:ss tt", new CultureInfo("vi-vn"))));
            html.AppendLine("<h4>Chủ đề:</h4>");
            html.AppendLine(string.Format("<p>{0}</p>", detail.subject));
            html.AppendLine("<h4>Nội dung:</h4>");
            html.AppendLine(string.Format("<p>{0}</p>", detail.description));
        }
        liContactDetail.Text = html.ToString();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        clsContact cont = new clsContact();
        int contactID = Convert.ToInt32(Request.QueryString["ContactID"]);
        string result = "";
        result = cont.updateContactDiscontinued(contactID);
        if (result != "1")
        {

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.refresh_contact(); parent.close_contact_detail()", true);
        }
    }
}