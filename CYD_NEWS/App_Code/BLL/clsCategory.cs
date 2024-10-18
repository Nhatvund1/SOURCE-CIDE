using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class clsCategory
{
    public clsCategory()
    {

    }

    public DataTable selectTree()
    {
        DataTable dt = new DataTable();
        string sql = "sp_ad_Category_Select_Tree";
        clsConnection db = new clsConnection();
        dt = db.getDataTable(sql);
        return dt;
    }

    public DataTable selectByParentID(int parentID)
    {
        DataTable dt = new DataTable();
        string sql = "sp_ad_Category_Select_By_ParentID";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@ParentID", parentID);
        dt = db.getDataTable(sql, par);
        return dt;
    }

    public string deleteCategory(int catID)
    {
        string result = "";
        string sql = "sp_ad_Category_Delete";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@CatID", catID);
        try
        {
            db.excuteNonQuery(sql, par);
            result = "1";
        }
        catch (Exception ex)
        {
            result = ex.Message;
        }
        return result;
    }

    public string insertCategory(dtoCategory input)
    {
        string result = "";
        string sql = "sp_ad_Category_Insert";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[16];
        par[0] = new SqlParameter("@CatName", input.catName);
        par[1] = new SqlParameter("@Avatar", input.avatar);
        par[2] = new SqlParameter("@Description", input.description);
        par[3] = new SqlParameter("@Detail", input.detail);
        par[4] = new SqlParameter("@Location1", input.location1);
        par[5] = new SqlParameter("@Location2", input.location2);
        par[6] = new SqlParameter("@Location3", input.location3);
        par[7] = new SqlParameter("@NewTab", input.newTab);
        par[8] = new SqlParameter("@FontIcon", input.fontIcon);
        par[9] = new SqlParameter("@Url", input.url);
        par[10] = new SqlParameter("@Sort", input.sort);
        par[11] = new SqlParameter("@NewsNumber", input.newsNumber);
        par[12] = new SqlParameter("@NewsCreate", input.newsCreate);
        par[13] = new SqlParameter("@PageStyle", input.pageStyle);
        par[14] = new SqlParameter("@Discontinued", input.discontinued);
        par[15] = new SqlParameter("@ParentID", input.parentID);
        try
        {
            db.excuteNonQuery(sql, par);
            result = "1";
        }
        catch (Exception ex)
        {
            result = ex.Message;
        }
        return result;
    }

    public string updateCategory(dtoCategory input)
    {
        string result = "";
        string sql = "sp_ad_Category_Update";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[16];
        par[0] = new SqlParameter("@CatName", input.catName);
        par[1] = new SqlParameter("@Avatar", input.avatar);
        par[2] = new SqlParameter("@Description", input.description);
        par[3] = new SqlParameter("@Detail", input.detail);
        par[4] = new SqlParameter("@Location1", input.location1);
        par[5] = new SqlParameter("@Location2", input.location2);
        par[6] = new SqlParameter("@Location3", input.location3);
        par[7] = new SqlParameter("@NewTab", input.newTab);
        par[8] = new SqlParameter("@FontIcon", input.fontIcon);
        par[9] = new SqlParameter("@Url", input.url);
        par[10] = new SqlParameter("@Sort", input.sort);
        par[11] = new SqlParameter("@NewsNumber", input.newsNumber);
        par[12] = new SqlParameter("@NewsCreate", input.newsCreate);
        par[13] = new SqlParameter("@PageStyle", input.pageStyle);
        par[14] = new SqlParameter("@Discontinued", input.discontinued);
        par[15] = new SqlParameter("@CatID", input.catID);
        try
        {
            db.excuteNonQuery(sql, par);
            result = "1";
        }
        catch (Exception ex)
        {
            result = ex.Message;
        }
        return result;
    }

    public dtoCategory selectCategoryByCatID(int catID)
    {
        dtoCategory dtoCat = new dtoCategory();
        string sql = "sp_ad_Category_Select_By_CatID";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@CatID", catID);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                dtoCat = new dtoCategory(reader);
            }
        }
        return dtoCat;
    }
}