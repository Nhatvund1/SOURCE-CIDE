using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class clsAccount
{
    public clsAccount()
    {

    }

    public string changePassword(string accName, string accPass, string newPass)
    {
        string result = "";
        string sql = "sp_ad_Account_Password_Change";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[3];
        par[0] = new SqlParameter("@AccName", accName);
        par[1] = new SqlParameter("@AccPass", clsMD5.GetMd5Hash(accPass));
        par[2] = new SqlParameter("@NewPass", clsMD5.GetMd5Hash(newPass));
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

    public dtoLogin signIn(string accName, string accPass)
    {
        dtoLogin login = new dtoLogin();
        string sql = "sp_ad_Account_SignIn";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[2];
        par[0] = new SqlParameter("@AccName", accName);
        par[1] = new SqlParameter("@AccPass", clsMD5.GetMd5Hash(accPass));
        using (SqlDataReader reader = db.getDataReader(sql, par))
        {
            while (reader.Read())
            {
                login = new dtoLogin(reader);
            }
        }
        return login;
    }
}