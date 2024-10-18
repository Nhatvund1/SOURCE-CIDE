using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class adm_CatImportAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["login"] == null || ((dtoLogin)Session["login"]).accName == "")
            {
                Response.Redirect("~/ad");
            }
            create_tree();
        }
    }

    private void create_tree()
    {
        tvCat.Nodes.Clear();
        clsCategory cat = new clsCategory();
        DataTable dt = new DataTable();
        dt = cat.selectTree();
        DataRow roots;
        roots = dt.AsEnumerable().Where(n => n.Field<int>("ParentID") == 0).FirstOrDefault();
        TreeNode root = new TreeNode();
        root.Value = roots["CatID"].ToString();
        root.Text = roots["CatName"].ToString();
        add_node(dt, ref root);
        tvCat.Nodes.Add(root);
        tvCat.DataBind();
    }

    private void add_node(DataTable cat, ref TreeNode root)
    {
        int parent_id = Convert.ToInt32(root.Value);
        DataTable childs = new DataTable();
        childs = cat.AsEnumerable().Where(n => n.Field<int>("ParentID") == parent_id).OrderBy(n => n.Field<string>("CatName")).AsDataView().ToTable();
        foreach (DataRow item in childs.Rows)
        {
            TreeNode node = new TreeNode();
            node.Value = item["CatID"].ToString();
            node.Text = item["CatName"].ToString();
            if (Convert.ToBoolean(item["Discontinued"]) != false)
            {
                node.Text = string.Format("{0} <i class=\"fa fa-fw fa-remove text-danger\"></i>", item["CatName"].ToString());
            }
            else
            {
                node.Text = item["CatName"].ToString();
            }
            add_node(cat, ref node);
            root.ChildNodes.Add(node);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        TreeNode selectNode = null;
        selectNode = tvCat.SelectedNode;
        if (selectNode != null)
        {
            byte newsNumber = 0;
            if (byte.TryParse(txtNewsNumber.Text.Trim(), out newsNumber))
            {
                int catID = Convert.ToInt32(Request.QueryString["CatID"]);
                string result = "";
                clsCategoryImport catImp = new clsCategoryImport();
                int catIDLink = Convert.ToInt32(tvCat.SelectedValue);
                result = catImp.insertCategoryImport(catID, catIDLink, newsNumber);
                if (result != "1")
                {
                    string msg = string.Format("parent.show_msg('{0}')", result);
                    ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.close_cat_import(); parent.reload_cat_import()", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Số tin không hợp lệ, vui lòng kiểm tra lại.')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "parent.show_msg('Vui lòng chọn thư mục tin.')", true);
        }
    }
}