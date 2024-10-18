using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Globalization;

public partial class adm_News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            create_tree();
            load_date();
        }
    }

    private void load_date()
    {
        DateTime date = DateTime.Now;
        txtFrom.Text = date.AddMonths(-1).ToString("dd/MM/yyyy");
        txtTo.Text = date.ToString("dd/MM/yyyy");
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
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        TreeNode select_node = null;
        select_node = tvCat.SelectedNode;
        if (select_node != null)
        {
            int cat_id = Convert.ToInt32(select_node.Value);
            clsCategory cat = new clsCategory();
            dtoCategory dtoCat = new dtoCategory();
            dtoCat = cat.selectCategoryByCatID(cat_id);
            if (dtoCat.newsCreate != true)
            {
                string msg = "show_msg('Thư mục này không cho phép thêm tin.')";
                ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
                return;
            }
            string parent_id = tvCat.SelectedNode.Value;
            string folder = string.Format("open_add_news('/adm/NewsAdd.aspx?FolderID={0}', 'Thêm tin')", parent_id);
            ScriptManager.RegisterStartupScript(this, GetType(), "", folder, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "show_msg('Chưa chọn thư mục muốn thêm tin.')", true);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        search_news();
    }

    private void search_news()
    {
        TreeNode select_node = null;
        select_node = tvCat.SelectedNode;
        if (txtFrom.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "close_waiting(); show_msg('Vui lòng chọn từ ngày.');", true);
            return;
        }
        if (txtTo.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "close_waiting(); show_msg('Vui lòng chọn đến ngày.');", true);
            return;
        }
        if (select_node != null)
        {
            int folder_id = Convert.ToInt32(select_node.Value);
            DateTime date_from = Convert.ToDateTime(txtFrom.Text.Trim(), new CultureInfo("vi-vn"));
            DateTime date_to = Convert.ToDateTime(txtTo.Text.Trim(), new CultureInfo("vi-vn"));
            string title = txtTitle.Text.Trim();
            bool discontinued = chkDiscontinued.Checked;
            clsNews news = new clsNews();
            DataTable dt = new DataTable();
            dt = news.selectNewsSearch(folder_id, title, discontinued, date_from, date_to);
            if (dt.Rows.Count != 0)
            {
                rptNews.DataSource = dt;
                rptNews.DataBind();
                ScriptManager.RegisterStartupScript(this, GetType(), "", "close_waiting()", true);
            }
            else
            {
                rptNews.DataSource = null;
                rptNews.DataBind();
                string msg = "close_waiting(); show_msg('Không tìm thấy tin nào.');";
                ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "close_waiting(); show_msg('Chưa chọn thư mục muốn xem tin.');", true);
        }
    }

    protected void rptNews_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string cmd = e.CommandName;
        int id = Convert.ToInt32(e.CommandArgument);
        clsNews news = new clsNews();
        switch (cmd)
        {
            case "Delete":
                string result_delete = "";
                result_delete = news.deleteNews(id);
                if (result_delete != "1")
                {
                    string msg = string.Format("show_msg('{0}')", result_delete);
                    ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
                }
                else
                {
                    search_news();
                }
                break;
            case "Up":
                int up_selected_folder = Convert.ToInt32(tvCat.SelectedNode.Value);
                string result_up = "";
                result_up = news.upNews(id, up_selected_folder);
                if (result_up != "1")
                {
                    string msg = string.Format("show_msg('{0}')", result_up);
                    ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
                }
                else
                {
                    search_news();
                }
                break;
            case "Down":
                int down_selected_folder = Convert.ToInt32(tvCat.SelectedNode.Value);
                string result_down = "";
                result_down = news.downNews(id, down_selected_folder);
                if (result_down != "1")
                {
                    string msg = string.Format("show_msg('{0}')", result_down);
                    ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
                }
                else
                {
                    search_news();
                }
                break;
            case "Move":
                int m_selected_folder = Convert.ToInt32(tvCat.SelectedNode.Value);
                string result_move = "";
                result_move = news.moveNews(id, m_selected_folder);
                if (result_move != "1")
                {
                    string msg = string.Format("show_msg('{0}')", result_move);
                    ScriptManager.RegisterStartupScript(this, GetType(), "msg", msg, true);
                }
                else
                {
                    search_news();
                }
                break;
            case "Copy":
                int selected_folder = Convert.ToInt32(tvCat.SelectedNode.Value);
                string result_copy = "";
                result_copy = news.copyNews(id, selected_folder);
                if (result_copy != "1")
                {
                    string msg = string.Format("show_msg('{0}')", result_copy);
                    ScriptManager.RegisterStartupScript(this, GetType(), "msg", msg, true);
                }
                else
                {
                    search_news();
                }
                break;
        }
    }
}