using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class clsContact
{
    public clsContact()
    {

    }

    public List<dtoContact> selectContact(int number, bool discontinued)
    {
        List<dtoContact> lstContact = new List<dtoContact>();
        string sql = "sp_ad_Contact_Select";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[2];
        par[0] = new SqlParameter("@NumberContact", number);
        par[1] = new SqlParameter("@Discontinued", discontinued);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                lstContact.Add(new dtoContact(reader));
            }
        }
        return lstContact;
    }

    public string deleteContact(int contactID)
    {
        string result = "";
        string sql = "sp_ad_Contact_Delete";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@ContactID", contactID);
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

    public dtoContact selectContactByContactID(int contactID)
    {
        dtoContact result = new dtoContact();
        string sql = "sp_ad_Contact_Select_By_ContactID";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@ContactID", contactID);
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                result = new dtoContact(reader);
            }
        }
        return result;
    }

    public string updateContactDiscontinued(int contactID)
    {
        string result = "";
        string sql = "sp_ad_Contact_Update_Discontinued";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@ConactID", contactID);
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

    public DataTable selectCategoryByIDArray(string idArray)
    {
        DataTable dt = new DataTable();
        string sql = "sp_ad_Contact_Select_By_ID_Array";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@IDArr", idArray);
        dt = db.getDataTable(sql, par);
        return dt;
    }

    public string updateDiscontinuedByIDArray(string idArray)
    {
        string result = "";
        string sql = "sp_ad_Contact_Update_Discontinued_By_ID_Array";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[1];
        par[0] = new SqlParameter("@IDArr", idArray);
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
