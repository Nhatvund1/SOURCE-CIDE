using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class dtoContact
{
    public int contactID { get; set; }
    public string contactName { get; set; }
    public string email { get; set; }
    public string phone { get; set; }
    public string subject { get; set; }
    public bool discontinued { get; set; }
    public string description { get; set; }
    public DateTime createdDate { get; set; }

    public dtoContact()
    {
        contactID = 0;
        contactName = "";
        email = "";
        phone = "";
        subject = "";
        discontinued = false;
        description = "";
        createdDate = DateTime.Now;
    }

    public dtoContact(SqlDataReader reader)
    {
        if (reader != null && !reader.IsClosed)
        {
            contactID = reader.GetInt32(0);
            if (!reader.IsDBNull(1)) contactName = reader.GetString(1);
            if (!reader.IsDBNull(2)) email = reader.GetString(2);
            if (!reader.IsDBNull(3)) phone = reader.GetString(3);
            if (!reader.IsDBNull(4)) subject = reader.GetString(4);
            if (!reader.IsDBNull(5)) discontinued = reader.GetBoolean(5);
            if (!reader.IsDBNull(6)) description = reader.GetString(6);
            if (!reader.IsDBNull(7)) createdDate = reader.GetDateTime(7);
        }
    }
}