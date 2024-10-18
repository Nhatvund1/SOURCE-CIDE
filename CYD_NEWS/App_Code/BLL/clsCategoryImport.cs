using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class clsCategoryImport
{
    public clsCategoryImport()
    {

    }

    public DataTable selectCategoryImportByCatID(int catID)
    {
        DataTable dt = new DataTable();
        string sql = "sp_ad_CategoryImport_Select_By_CatID";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@CatID", catID);
        dt = db.getDataTable(sql, par);
        return dt;
    }

    public string insertCategoryImport(int catID, int catIDLink, byte newsNumber)
    {
        string result = "";
        string sql = "sp_ad_CategoryImport_Insert";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[3];
        par[0] = new SqlParameter("@CatID", catID);
        par[1] = new SqlParameter("@CatIDLink", catIDLink);
        par[2] = new SqlParameter("@NewsNumber", newsNumber);
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

    public string deleteCategoryImport(int catID, int catIDLink)
    {
        string result = "";
        string sql = "sp_CategoryImport_Delete";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[2];
        par[0] = new SqlParameter("@CatID", catID);
        par[1] = new SqlParameter("@CatIDLink", catIDLink);
        try
        {
            db.excuteNonQuery(sql, par); ;
            result = "1";
        }
        catch (Exception ex)
        {
            result = ex.Message;
        }
        return result;
    }
}