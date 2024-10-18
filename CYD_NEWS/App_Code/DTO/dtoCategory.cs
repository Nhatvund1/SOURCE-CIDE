using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class dtoCategory
{
    public int catID { get; set; }
    public string catName { get; set; }
    public string description { get; set; }
    public string detail { get; set; }
    public string url { get; set; }
    public byte location1 { get; set; }
    public byte location2 { get; set; }
    public byte location3 { get; set; }
    public int sort { get; set; }
    public bool newTab { get; set; }
    public string avatar { get; set; }
    public string fontIcon { get; set; }
    public int hitCounter { get; set; }
    public byte newsNumber { get; set; }
    public bool newsCreate { get; set; }
    public int parentID { get; set; }
    public string pageStyle { get; set; }
    public DateTime createdDate { get; set; }
    public DateTime updatedDate { get; set; }
    public bool discontinued { get; set; }

    public dtoCategory()
    {
        catID = 0;
        catName = "";
        description = "";
        detail = "";
        url = "";
        location1 = 0;
        location2 = 0;
        location3 = 0;
        sort = 0;
        newTab = false;
        avatar = "";
        fontIcon = "";
        hitCounter = 0;
        newsNumber = 0;
        newsCreate = false;
        parentID = 0;
        pageStyle = "";
        createdDate = DateTime.Now;
        updatedDate = DateTime.Now;
        discontinued = false;
    }

    public dtoCategory(SqlDataReader reader)
    {
        if (reader != null && !reader.IsClosed)
        {
            catID = reader.GetInt32(0);
            if (!reader.IsDBNull(1)) catName = reader.GetString(1);
            if (!reader.IsDBNull(2)) description = reader.GetString(2);
            if (!reader.IsDBNull(3)) detail = reader.GetString(3);
            if (!reader.IsDBNull(4)) url = reader.GetString(4);
            if (!reader.IsDBNull(5)) location1 = reader.GetByte(5);
            if (!reader.IsDBNull(6)) location2 = reader.GetByte(6);
            if (!reader.IsDBNull(7)) location3 = reader.GetByte(7);
            if (!reader.IsDBNull(8)) sort = reader.GetInt32(8);
            if (!reader.IsDBNull(9)) newTab = reader.GetBoolean(9);
            if (!reader.IsDBNull(10)) avatar = reader.GetString(10);
            if (!reader.IsDBNull(11)) fontIcon = reader.GetString(11);
            if (!reader.IsDBNull(12)) hitCounter = reader.GetInt32(12);
            if (!reader.IsDBNull(13)) newsNumber = reader.GetByte(13);
            if (!reader.IsDBNull(14)) newsCreate = reader.GetBoolean(14);
            if (!reader.IsDBNull(15)) parentID = reader.GetInt32(15);
            if (!reader.IsDBNull(16)) pageStyle = reader.GetString(16);
            if (!reader.IsDBNull(17)) createdDate = reader.GetDateTime(17);
            if (!reader.IsDBNull(18)) updatedDate = reader.GetDateTime(18);
            if (!reader.IsDBNull(19)) discontinued = reader.GetBoolean(19);
        }
    }
}