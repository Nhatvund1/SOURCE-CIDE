using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class clsNews
{
    public clsNews()
    {

    }

    public DataTable selectNewsSearch(int folder_id, string title, bool discontinued, DateTime date_from, DateTime date_to)
    {
        DataTable dt = new DataTable();
        string sql = "sp_ad_News_Search";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[5];
        par[0] = new SqlParameter("@CatID", folder_id);
        par[1] = new SqlParameter("@Title", title);
        par[2] = new SqlParameter("@Discontinued", discontinued);
        par[3] = new SqlParameter("@FromDate", date_from);
        par[4] = new SqlParameter("@ToDate", date_to);
        dt = db.getDataTable(sql, par);
        return dt;
    }

    public string deleteNews(int newsID)
    {
        string result = "";
        string sql = "sp_ad_News_Delete";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@NewsID", newsID);
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

    public string upNews(int newsID, int catID)
    {
        string result = "";
        string sql = "sp_ad_News_Up";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[2];
        par[0] = new SqlParameter("@NewsID", newsID);
        par[1] = new SqlParameter("@CatID", catID);
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

    public string downNews(int newsID, int catID)
    {
        string result = "";
        string sql = "sp_ad_News_Down";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[2];
        par[0] = new SqlParameter("@NewsID", newsID);
        par[1] = new SqlParameter("@CatID", catID);
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

    public string moveNews(int newsID, int folderID)
    {
        string result = "";
        string sql = "sp_ad_News_Move";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[2];
        par[0] = new SqlParameter("@NewsID", newsID);
        par[1] = new SqlParameter("@FolderID", folderID);
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

    public string insertNews(dtoNews input)
    {
        string result = "";
        string sql = "sp_ad_News_Insert";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[8];
        par[0] = new SqlParameter("@Title", input.title);
        par[1] = new SqlParameter("@Avatar", input.avatar);
        par[2] = new SqlParameter("@Description", input.description);
        par[3] = new SqlParameter("@Discontinued", input.discontinued);
        par[4] = new SqlParameter("@Detail", input.detail);
        par[5] = new SqlParameter("@CatID", input.catID);
        par[6] = new SqlParameter("@Keyword", input.title);
        par[7] = new SqlParameter("@Url", input.url);
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

    public dtoNews selectNewsDetail(int newsID)
    {
        dtoNews result = new dtoNews();
        string sql = "sp_ad_News_Select_By_NewsID";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@NewsID", newsID);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                result = new dtoNews(reader);
            }
        }
        return result;
    }

    public string updateNews(dtoNews input)
    {
        string result = "";
        string sql = "sp_ad_News_Update";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[8];
        par[0] = new SqlParameter("@Title", input.title);
        par[1] = new SqlParameter("@Avatar", input.avatar);
        par[2] = new SqlParameter("@Description", input.description);
        par[3] = new SqlParameter("@Discontinued", input.discontinued);
        par[4] = new SqlParameter("@Detail", input.detail);
        par[5] = new SqlParameter("@Keyword", input.keyWord);
        par[6] = new SqlParameter("@Url", input.url);
        par[7] = new SqlParameter("@NewsID", input.newsID);
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

    public string copyNews(int newsID, int folderID)
    {
        string result = "";
        string sql = "sp_ad_News_Copy";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[2];
        par[0] = new SqlParameter("@NewsID", newsID);
        par[1] = new SqlParameter("@FolderID", folderID);
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
}