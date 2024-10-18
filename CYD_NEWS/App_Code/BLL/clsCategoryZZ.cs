using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class clsCategoryZZ
{
    public clsCategoryZZ()
    {

    }

    public dtoCategory selectCategoryByCatID(int catID)
    {
        dtoCategory result = new dtoCategory();
        string sql = "sp_zz_Category_Select_By_CatID";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@CatID", catID);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                result = new dtoCategory(reader);
            }
        }
        return result;
    }

    public List<dtoCategory> selectCategoryByParentLocation(int parentID, byte location, bool desc, byte take)
    {
        List<dtoCategory> lstCat = new List<dtoCategory>();
        string sql = "sp_zz_Category_Select_By_Parent_Location";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[4];
        par[0] = new SqlParameter("@ParentID", parentID);
        par[1] = new SqlParameter("@Location", location);
        par[2] = new SqlParameter("@DESC", desc);
        par[3] = new SqlParameter("@Take", take);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                lstCat.Add(new dtoCategory(reader));
            }
        }
        return lstCat;
    }

    public List<dtoCategory> selectCategoryByParent(int parentID, bool desc, byte take)
    {
        List<dtoCategory> lstCat = new List<dtoCategory>();
        string sql = "sp_zz_Category_Select_By_Parent";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[3];
        par[0] = new SqlParameter("@ParentID", parentID);
        par[1] = new SqlParameter("@DESC", desc);
        par[2] = new SqlParameter("@Take", take);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                lstCat.Add(new dtoCategory(reader));
            }
        }
        return lstCat;
    }
}