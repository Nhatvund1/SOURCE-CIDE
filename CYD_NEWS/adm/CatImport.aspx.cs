using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Web.Services;

public partial class adm_CatImport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            create_tree();
            loadCatImport();
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
        loadCatImport();
    }

    private void loadCatImport()
    {
        TreeNode selectNode = null;
        selectNode = tvCat.SelectedNode;
        if (selectNode != null)
        {
            int catID = Convert.ToInt32(tvCat.SelectedNode.Value);
            DataTable dt = new DataTable();
            clsCategoryImport catimp = new clsCategoryImport();
            dt = catimp.selectCategoryImportByCatID(catID);
            rptCatImport.DataSource = dt;
            rptCatImport.DataBind();
        }
    }

    protected void btnReloadCatImport_Click(object sender, EventArgs e)
    {
        loadCatImport();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        TreeNode selectNode = null;
        selectNode = tvCat.SelectedNode;
        if (selectNode != null)
        {
            int cat_id = Convert.ToInt32(tvCat.SelectedValue);
            string cmd = string.Format("show_cat_import('/adm/CatImportAdd.aspx?CatID={0}')", cat_id);
            ScriptManager.RegisterStartupScript(this, GetType(), "", cmd, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "show_msg('Vui lòng chọn thư mục muốn tổng hợp tin.')", true);
        }
    }

    [WebMethod(EnableSession = true)]
    public static string deleteCatImport(int catID, int catIDLink)
    {
        string result = "";
        int iCatID = catID;
        int iCatIDLink = catIDLink;
        clsCategoryImport catImp = new clsCategoryImport();
        result = catImp.deleteCategoryImport(iCatID, iCatIDLink);
        return result;
    }
}