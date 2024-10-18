using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

public partial class adm_FolderEdit : System.Web.UI.Page
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

            load_page_styles();
            load_folder_detail();
        }
    }

    private void load_page_styles()
    {
        DirectoryInfo di = new DirectoryInfo(MapPath("~\\PageStyles"));
        foreach (DirectoryInfo item in di.GetDirectories())
        {
            cboPageStyle.Items.Add(new ListItem(item.Name, item.Name));
        }

    }

    private void load_folder_detail()
    {
        int cat_id = 0;
        int.TryParse(Request.QueryString["FolderID"], out cat_id);
        clsCategory cat = new clsCategory();
        dtoCategory detail = new dtoCategory();
        detail = cat.selectCategoryByCatID(cat_id);
        if (detail.catID != 0)
        {
            txtCatName.Text = detail.catName;
            txtAvatar.Text = detail.avatar;
            txtDescription.Text = detail.description;
            txtDetail.Text = detail.detail;
            txtLocation1.Text = detail.location1.ToString();
            txtLocation2.Text = detail.location2.ToString();
            txtLocation3.Text = detail.location3.ToString();
            chkNewTab.Checked = (bool)detail.newTab;
            txtIcon.Text = detail.fontIcon;
            txtUrl.Text = detail.url;
            txtSort.Text = detail.sort.ToString();
            txtNewsNumber.Text = detail.newsNumber.ToString();
            chkNewsCreate.Checked = (bool)detail.newsCreate;
            cboPageStyle.SelectedValue = detail.pageStyle;
            chkDiscontinued.Checked = (bool)detail.discontinued;
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "", "close_me()", true);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int cat_id = Convert.ToInt32(Request.QueryString["FolderID"]);
        clsCategory cat = new clsCategory();
        dtoCategory updateCat = new dtoCategory()
        {
            catName = txtCatName.Text.Trim(),
            avatar = txtAvatar.Text.Trim(),
            description = txtDescription.Text.Trim(),
            detail = txtDetail.Text,
            location1 = Convert.ToByte(txtLocation1.Text.Trim()),
            location2 = Convert.ToByte(txtLocation2.Text.Trim()),
            location3 = Convert.ToByte(txtLocation3.Text.Trim()),
            newTab = chkNewTab.Checked,
            fontIcon = txtIcon.Text.Trim(),
            url = txtUrl.Text.Trim(),
            sort = Convert.ToInt32(txtSort.Text.Trim()),
            newsNumber = Convert.ToByte(txtNewsNumber.Text.Trim()),
            newsCreate = chkNewsCreate.Checked,
            pageStyle = cboPageStyle.SelectedValue,
            discontinued = chkDiscontinued.Checked,
            catID = cat_id,
        };
        string result = "";
        result = cat.updateCategory(updateCat);
        if (result != "1")
        {
            string msg = string.Format("show_msg('{0}')", result);
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Sửa thư mục thành công.'); parent.load_tree(), close_me()", true);
        }
    }
}