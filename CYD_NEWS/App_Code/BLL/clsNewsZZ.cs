using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class clsNewsZZ
{
    public clsNewsZZ()
    {

    }

    public dtoNewsCategory selectNewsByNewsID(int newsID)
    {
        dtoNewsCategory news = new dtoNewsCategory();
        string sql = "sp_zz_News_Select_By_NewsID";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@NewsID", newsID);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                news = new dtoNewsCategory(reader);
            }
        }
        return news;
    }

    public List<dtoNewsCategory> selectNewsByCatID(int catID, bool desc, byte take)
    {
        List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
        string sql = "sp_zz_News_Select_By_CatID";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[3];
        par[0] = new SqlParameter("@CatID", catID);
        par[1] = new SqlParameter("@DESC", desc);
        par[2] = new SqlParameter("@Take", take);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                lstNews.Add(new dtoNewsCategory(reader));
            }
        }
        return lstNews;
    }

    public string updateView(int newsID)
    {
        string result = "";
        string sql = "sp_zz_News_Update_View";
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

    public List<dtoNewsCategory> selectNewsByCatIDPagination(int catID, int pageIndex, int maxRecord)
    {
        List<dtoNewsCategory> lstCat = new List<dtoNewsCategory>();
        string sql = "sp_zz_News_Select_By_CatID_Pagination";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[3];
        par[0] = new SqlParameter("@CatID", catID);
        par[1] = new SqlParameter("@PageIndex", pageIndex);
        par[2] = new SqlParameter("@MaxRecord", maxRecord);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                lstCat.Add(new dtoNewsCategory(reader));
            }
        }
        return lstCat;
    }

    public List<dtoNewsCategory> selectNewsByCatImport(int rootID)
    {
        List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
        string sql = "sp_zz_News_Select_By_Cat_Import";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@RootCat", rootID);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                lstNews.Add(new dtoNewsCategory(reader));
            }
        }
        return lstNews;
    }
}