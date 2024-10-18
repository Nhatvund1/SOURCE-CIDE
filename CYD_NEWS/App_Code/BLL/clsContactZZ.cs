using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class clsContactZZ
{
    public clsContactZZ()
    {

    }

    public string insertContact(dtoContact input)
    {
        string result = "";
        string sql = "sp_zz_Contact_Insert";
        clsConnection db = new clsConnection();
        SqlParameter[] par = new SqlParameter[5];
        par[0] = new SqlParameter("@ContactName", input.contactName);
        par[1] = new SqlParameter("@Email", input.email);
        par[2] = new SqlParameter("@Phone", input.phone);
        par[3] = new SqlParameter("@Subject", input.subject);
        par[4] = new SqlParameter("@Description", input.description);
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