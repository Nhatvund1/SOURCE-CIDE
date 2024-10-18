using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

public class dtoNews
{
    public int newsID { get; set; }
    public string title { get; set; }
    public string description { get; set; }
    public string detail { get; set; }
    public string avatar { get; set; }
    public DateTime createdDate { get; set; }
    public DateTime updatedDate { get; set; }
    public bool discontinued { get; set; }
    public int hitCounter { get; set; }
    public int sort { get; set; }
    public int catID { get; set; }
    public string url { get; set; }
    public string keyWord { get; set; }

    public dtoNews()
    {
        newsID = 0;
        title = "";
        description = "";
        detail = "";
        avatar = "";
        createdDate = DateTime.Now;
        updatedDate = DateTime.Now;
        discontinued = false;
        hitCounter = 0;
        sort = 0;
        catID = 0;
        url = "";
        keyWord = "";
    }

    public dtoNews(SqlDataReader reader)
    {
        if (reader != null && !reader.IsClosed)
        {
            newsID = reader.GetInt32(0);
            if (!reader.IsDBNull(1)) title = reader.GetString(1);
            if (!reader.IsDBNull(2)) description = reader.GetString(2);
            if (!reader.IsDBNull(3)) detail = reader.GetString(3);
            if (!reader.IsDBNull(4)) avatar = reader.GetString(4);
            if (!reader.IsDBNull(5)) createdDate = reader.GetDateTime(5);
            if (!reader.IsDBNull(6)) updatedDate = reader.GetDateTime(6);
            if (!reader.IsDBNull(7)) discontinued = reader.GetBoolean(7);
            if (!reader.IsDBNull(8)) hitCounter = reader.GetInt32(8);
            if (!reader.IsDBNull(9)) sort = reader.GetInt32(9);
            if (!reader.IsDBNull(10)) catID = reader.GetInt32(10);
            if (!reader.IsDBNull(11)) url = reader.GetString(11);
            if (!reader.IsDBNull(12)) keyWord = reader.GetString(12);
        }
    }
}