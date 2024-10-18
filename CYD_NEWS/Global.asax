<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Data" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RegisterRoutes();
        Application["Today"] = 0;
        Application["Yesterday"] = 0;
        Application["All"] = 0;
        Application["Online"] = 0;
    }

    private void RegisterRoutes()
    {
        RouteTable.Routes.MapPageRoute("Home", "", "~/Default.aspx");
        RouteTable.Routes.MapPageRoute("Cat", "{CatName}-{CatID}", "~/Default.aspx");
        RouteTable.Routes.MapPageRoute("News", "{CatName}-{CatID}/{Title}-{NewsID}", "~/Default.aspx");

        RouteTable.Routes.MapPageRoute("Admin_Folder", "ad/thu-muc", "~/adm/Folder.aspx");
        RouteTable.Routes.MapPageRoute("Admin_News", "ad/tin-tuc", "~/adm/News.aspx");
        RouteTable.Routes.MapPageRoute("Admin_Login", "ad", "~/adm/Default.aspx");
        RouteTable.Routes.MapPageRoute("Contact", "ad/lien-he", "~/adm/Contact.aspx");
        RouteTable.Routes.MapPageRoute("Admin_CatImport", "ad/tong-hop-tin", "~/adm/CatImport.aspx");
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        Application.Lock();
        Application["Online"] = Convert.ToInt32(Application["Online"]) + 1;
        Application.UnLock();
        try
        {
            clsConnection db = new clsConnection();
            DataTable dt = db.getDataTable("sp_zz_Visit", System.Data.CommandType.StoredProcedure);
            if (dt.Rows.Count != 0)
            {
                if (dt.Rows[0]["Today"].ToString() == "0")
                {
                    Application["Today"] = 0;
                }
                else
                {
                    Application["Today"] = Convert.ToInt32(dt.Rows[0]["Today"]).ToString("N0", new CultureInfo("vi-vn"));
                }
                if (dt.Rows[0]["Yesterday"].ToString() == "0")
                {
                    Application["Yesterday"] = 0;
                }
                else
                {
                    Application["Yesterday"] = Convert.ToInt32(dt.Rows[0]["Yesterday"]).ToString("N0", new CultureInfo("vi-vn"));
                }
                if (dt.Rows[0]["All"].ToString() == "0")
                {
                    Application["All"] = 0;
                }
                else
                {
                    Application["All"] = Convert.ToInt32(dt.Rows[0]["All"]).ToString("N0", new CultureInfo("vi-vn"));
                }
            }
        }
        catch { }
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        int i = Convert.ToInt32(Application["Online"]);
        if (i > 1)
        {
            Application.Lock();
            Application["Online"] = i - 1;
            Application.UnLock();
        }
    }

</script>
