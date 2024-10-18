﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;

public partial class adm_FolderAdd : System.Web.UI.Page
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
        }
    }

    private void load_page_styles()
    {
        DirectoryInfo di = new DirectoryInfo(MapPath("~\\PageStyles"));
        foreach (DirectoryInfo item in di.GetDirectories())
        {
            cboPageStyle.Items.Add(new ListItem(item.Name, item.Name));
        }
        cboPageStyle.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtCatName.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Vui lòng nhập tên thư mục.');", true);
            return;
        }
        int parent_id = Convert.ToInt32(Request.QueryString["FolderID"]);
        dtoCategory newCat = new dtoCategory()
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
            parentID = parent_id,
        };
        string result = "";
        clsCategory cat = new clsCategory();
        result = cat.insertCategory(newCat);
        if (result != "1")
        {
            string msg = string.Format("parent.show_msg('{0}')", result);
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Thêm thư mục thành công.'); parent.load_tree(); close_me()", true);
        }
    }
}