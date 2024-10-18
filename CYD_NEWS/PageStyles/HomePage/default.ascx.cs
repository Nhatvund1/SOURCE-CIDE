using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageStyles_HomePage_default : myControls
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadPageTitle();
        }
    }

    private void loadPageTitle()
    {
        dtoCategory cat = new dtoCategory();
        clsCategoryZZ catz = new clsCategoryZZ();
        cat = catz.selectCategoryByCatID(cat_id);
        Page.Title = cat.catName;
        Page.MetaDescription = cat.description;
    }
}