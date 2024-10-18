using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adm_NewsAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["login"] == null || ((dtoLogin)Session["login"]).accName == "")
            {
                Response.Redirect("~/ad");
            }

            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "/ckfinder/";
            _FileBrowser.SetupCKEditor(txtDetail);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text.Trim();
        string img = txtAvatar.Text.Trim();
        string description = txtDescription.Text.Trim();
        bool discontinued = Convert.ToBoolean(chkDiscontinued.Checked);
        string detail = txtDetail.Text;
        int cat_id = Convert.ToInt32(Request.QueryString["FolderID"]);
        string keyword = txtKeyword.Text.Trim();
        string url = txtUrl.Text.Trim();
        string result = "";
        clsNews news = new clsNews();
        dtoNews insertNews = new dtoNews()
        {
            title = title,
            avatar = img,
            description = description,
            discontinued = discontinued,
            detail = detail,
            catID = cat_id,
            keyWord = keyword,
            url = url
        };
        result = news.insertNews(insertNews);
        if (result != "1")
        {
            string msg = string.Format("parent.show_msg('{0}')", result);
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Thêm tin mới thành công.'); reload_news(); close_me()", true);
        }
    }
}