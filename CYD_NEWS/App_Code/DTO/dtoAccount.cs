using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class dtoAccount
{
    public int accID { get; set; }
    public string accName { get; set; }
    public string accPass { get; set; }
    public string fullName { get; set; }
    public string email { get; set; }
    public string phone { get; set; }
    public string address { get; set; }
    public DateTime createdDate { get; set; }
    public DateTime updatedDate { get; set; }

    public dtoAccount()
    {

    }
}