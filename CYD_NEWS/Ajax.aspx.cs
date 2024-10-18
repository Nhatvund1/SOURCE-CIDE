using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;
using System.Globalization;
using System.Web.Services;

public partial class Ajax : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("~/");
    }

    private const int MAX_MSG_RECORDS = 10;
    private const int MAX_NEWS_RECORDS = 5;

    [WebMethod(EnableSession = true)]
    public static string load_message(int cat_id, int page_index)
    {
        StringBuilder html = new StringBuilder("");
        int iCatID = cat_id;
        int iPageIndex = page_index;
        List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
        clsNewsZZ newsz = new clsNewsZZ();
        lstNews = newsz.selectNewsByCatIDPagination(iCatID, iPageIndex, MAX_MSG_RECORDS);
        foreach (dtoNewsCategory item in lstNews)
        {
            string url = "";
            if (item.url.ToString() != "")
            {
                url = item.url;
            }
            else
            {
                url = string.Format("/{0}-{1}/{2}-{3}", clsUrl.Convert(item.catName), item.catID, clsUrl.Convert(item.title), item.newsID);
            }
            html.AppendLine("<div class=\"doc-item\">");
            html.AppendLine(string.Format("<h4><a href=\"{0}\">{1}</a></h4>", url, item.title));
            html.AppendLine(string.Format("<p class=\"doc-des\">{0}</p>", item.description));
            html.AppendLine(string.Format("<p class=\"sub-title\"><i class=\"fa fa-fw fa-calendar\"></i>{0} <i class=\"fa fa-fw fa-clock-o\"></i>{1} <i class=\"fa fa-fw fa-eye\"></i>Lượt xem {2}</p>",
                Convert.ToDateTime(item.createdDate).ToString("D", new CultureInfo("vi-vn")),
                Convert.ToDateTime(item.createdDate).ToString("hh:mm tt", new CultureInfo("vi-vn")),
                Convert.ToInt32(item.hitCounter).ToString("N0", new CultureInfo("vi-vn"))));
            html.AppendLine("</div>");
        }
        return html.ToString();
    }

    [WebMethod(EnableSession = true)]
    public static string load_news(int cat_id, int page_index)
    {
        StringBuilder html = new StringBuilder("");
        int iCatID = cat_id;
        int iPageIndex = page_index;
        List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
        clsNewsZZ newsz = new clsNewsZZ();
        lstNews = newsz.selectNewsByCatIDPagination(iCatID, iPageIndex, MAX_NEWS_RECORDS);
        foreach (dtoNewsCategory item in lstNews)
        {
            string url = "";
            if (item.url != "")
            {
                url = item.url;
            }
            else
            {
                url = string.Format("/{0}-{1}/{2}-{3}",
                clsUrl.Convert(item.catName),
                item.catID,
                clsUrl.Convert(item.title),
                item.newsID);
            }
            html.AppendLine("<div class=\"cat-item\">");
            html.AppendLine(string.Format("<h4><a href=\"{0}\">{1}</a></h4>", url, item.title));
            html.AppendLine("<div class=\"row\">");
            html.AppendLine("<div class=\"col-xs-12 col-sm-4 cat-left\">");
            html.AppendLine(string.Format("<a href=\"{0}\">", url));
            html.AppendLine(string.Format("<p style=\"background-image: url('{0}')\"></p>", item.avatar != "" ? item.avatar : "/images/no-img.jpg"));
            html.AppendLine("</a>");
            html.AppendLine("</div>");
            html.AppendLine("<div class=\"col-xs-12 col-sm-8 cat-right\">");
            html.AppendLine(string.Format("<p>{0}</p>", item.description));
            html.AppendLine(string.Format("<p class=\"cat-date\"><i class=\"fa fa-fw fa-calendar icon\"></i>{0} | <i class=\"fa fa-fw fa-clock-o icon\"></i>{1}</p>",
                Convert.ToDateTime(item.createdDate).ToString("dd/MM/yyyy"),
                Convert.ToDateTime(item.createdDate).ToString("hh:mm tt")));
            html.AppendLine("</div>");
            html.AppendLine("</div>");
            html.AppendLine(string.Format("<a class=\"cat-more text-muted\" href=\"{0}\">Chi tiết<i class=\"fa fa-fw fa-angle-double-right\"></i></a>", url));
            html.AppendLine("</div>");
        }
        return html.ToString();
    }

    [WebMethod(EnableSession = true)]
    public static string load_images(int cat_id, int page_index)
    {
        StringBuilder html = new StringBuilder("");
        int iCatID = cat_id;
        int iPageIndex = page_index;
        dtoCategory cat = new dtoCategory();
        clsCategoryZZ catz = new clsCategoryZZ();
        cat = catz.selectCategoryByCatID(iCatID);
        if (cat.catID != 0)
        {
            int max_record = (int)cat.newsNumber;
            List<dtoNewsCategory> lstNews = new List<dtoNewsCategory>();
            clsNewsZZ newsz = new clsNewsZZ();
            lstNews = newsz.selectNewsByCatIDPagination(iCatID, iPageIndex, max_record);
            int i = 0;
            foreach (dtoNewsCategory item in lstNews)
            {
                string url = "";
                if (item.url != "")
                {
                    url = item.url;
                }
                else
                {
                    url = string.Format("/{0}-{1}/{2}-{3}",
                    clsUrl.Convert(item.catName),
                    item.catID,
                    clsUrl.Convert(item.title),
                    item.newsID);
                }
                html.Append("<div class=\"col-xs-12 col-sm-4 col-md-3\"><div class=\"img-g-item\">");
                html.AppendLine(string.Format("<a href=\"{0}\"><p style=\"background-image: url('{1}')\"></p></a>", url, item.avatar));
                html.AppendLine(string.Format("<a href=\"{0}\">{1}</a></div></div>", url, item.title));
                i += 1;
                if (i % 3 == 0)
                {
                    html.AppendLine("<div class=\"clearfix visible-sm\"></div>");
                }
                if (i % 4 == 0)
                {
                    html.AppendLine("<div class=\"clearfix visible-md visible-lg\"></div>");
                }
            }
        }
        return html.ToString();
    }

    [WebMethod(EnableSession = true)]
    public static string insertContact(string fullName, string email, string phone, string subject, string content)
    {
        string result = "";
        dtoContact newContact = new dtoContact()
        {
            contactName = fullName,
            email = email,
            phone = phone,
            subject = subject,
            description = content
        };
        clsContactZZ conz = new clsContactZZ();
        result = conz.insertContact(newContact);
        return result;
    }
}