using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class adm_Folder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            create_tree();
            load_sub_cat();
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
        if (Session["cur"] != null)
        {
            if (root.Value == Session["cur"].ToString())
            {
                root.Selected = true;
            }
        }
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
            if (Session["cur"] != null)
            {
                if (node.Value == Session["cur"].ToString())
                {
                    node.Selected = true;
                }
            }
            add_node(cat, ref node);
            root.ChildNodes.Add(node);
        }
    }

    protected void tvCat_SelectedNodeChanged(object sender, EventArgs e)
    {
        Session["cur"] = tvCat.SelectedNode.Value;
        load_sub_cat();
    }

    private void load_sub_cat()
    {
        TreeNode selectNode = null;
        selectNode = tvCat.SelectedNode;
        if (selectNode != null)
        {
            int iParentID = Convert.ToInt32(tvCat.SelectedNode.Value);
            clsCategory cat = new clsCategory();
            DataTable dt = new DataTable();
            dt = cat.selectByParentID(iParentID);
            rptCatList.DataSource = dt;
            rptCatList.DataBind();
        }
        else
        {
            rptCatList.DataSource = null;
            rptCatList.DataBind();
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        TreeNode node = null;
        node = tvCat.SelectedNode;
        if (node != null)
        {
            string parent_id = tvCat.SelectedNode.Value;
            string folder = string.Format("open_add_folder('/adm/FolderEdit.aspx?FolderID={0}', 'Sửa thư mục')", parent_id);
            ScriptManager.RegisterStartupScript(this, GetType(), "", folder, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "show_msg('Vui lòng chọn thư muốn sửa.')", true);
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        TreeNode node = null;
        node = tvCat.SelectedNode;
        if (node != null)
        {
            string parent_id = tvCat.SelectedNode.Value;
            string folder = string.Format("open_add_folder('/adm/FolderAdd.aspx?FolderID={0}', 'Thêm thư mục')", parent_id);
            ScriptManager.RegisterStartupScript(this, GetType(), "", folder, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "show_msg('Vui lòng chọn thư mục cha.')", true);
        }
    }

    protected void btnLoadTree_Click(object sender, EventArgs e)
    {
        create_tree();
        load_sub_cat();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string result = "";
        clsCategory cat = new clsCategory();
        int cat_id = Convert.ToInt32(tvCat.SelectedValue);
        result = cat.deleteCategory(cat_id);
        if (result != "1")
        {
            string msg = string.Format("show_msg('{0}')", result);
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
        }
        else
        {
            create_tree();
        }
    }
}