using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adm_NewsEdit : System.Web.UI.Page
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

            load_detail();
        }
    }

    private void load_detail()
    {
        int news_id = 0;
        int.TryParse(Request.QueryString["NewsID"], out news_id);
        clsNews news = new clsNews();
        dtoNews detail = new dtoNews();
        detail = news.selectNewsDetail(news_id);
        if (detail.title != "")
        {
            txtTitle.Text = detail.title;
            txtAvatar.Text = detail.avatar;
            txtDescription.Text = detail.description;
            chkDiscontinued.Checked = detail.discontinued;
            txtDetail.Text = detail.detail;
            txtKeyword.Text = detail.keyWord;
            txtUrl.Text = detail.url;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.close_edit_news()", true);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int news_id = Convert.ToInt32(Request.QueryString["NewsID"]);
        dtoNews updateNews = new dtoNews()
        {
            newsID = news_id,
            title = txtTitle.Text.Trim(),
            avatar = txtAvatar.Text.Trim(),
            description = txtDescription.Text.Trim(),
            discontinued = chkDiscontinued.Checked,
            detail = txtDetail.Text,
            keyWord = txtKeyword.Text.Trim(),
            url = txtUrl.Text.Trim()
        };
        string result = "";
        clsNews news = new clsNews();
        result = news.updateNews(updateNews);
        if (result != "1")
        {
            string msg = string.Format("alert('{0}')", result);
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Sửa tin thành công.'); reload_news(); close_me()", true);
        }
    }
}