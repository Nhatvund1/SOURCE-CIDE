using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class dtoLogin
{
    public int accID { get; set; }
    public string accName { get; set; }
    public string fullName { get; set; }

    public dtoLogin()
    {
        accID = 0;
        accName = "";
        fullName = "";
    }

    public dtoLogin(SqlDataReader reader)
    {
        if (reader != null && !reader.IsClosed)
        {
            accID = reader.GetInt32(0);
            if (!reader.IsDBNull(1)) accName = reader.GetString(1);
            if (!reader.IsDBNull(2)) fullName = reader.GetString(2);
        }
    }
}