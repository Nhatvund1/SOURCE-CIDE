using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Services;
using ClosedXML.Excel;
using System.Data;
using System.IO;

public partial class adm_Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        search_contact();
    }

    private void search_contact()
    {
        chkHeader.Checked = false;
        int number_contact = 100;
        int.TryParse(txtContactNumber.Text.Trim(), out number_contact);
        bool discontinued = chkDiscontinued.Checked;
        clsContact cont = new clsContact();
        List<dtoContact> lstContact = new List<dtoContact>();
        lstContact = cont.selectContact(number_contact, discontinued);
        rptContact.DataSource = lstContact;
        rptContact.DataBind();
    }

    [WebMethod(EnableSession = true)]
    public static string delete_contact(int contact_id)
    {
        string result = "";
        clsContact cont = new clsContact();
        result = cont.deleteContact(contact_id);
        return result;
    }

    protected void btnMark_Click(object sender, EventArgs e)
    {
        string id = "";
        foreach (RepeaterItem item in rptContact.Items)
        {
            CheckBox chkItem = (CheckBox)item.FindControl("chkRow");
            if (chkItem.Checked)
            {
                HiddenField hfItem = (HiddenField)item.FindControl("chkID");
                id += hfItem.Value + "|";
            }
        }
        if (id != "")
        {
            id = id.Remove(id.Length - 1, 1);
        }
        else
        {
            string msg = "show_msg('Chưa chọn danh sách, vui lòng kiểm tra lại.')";
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
            return;
        }
        string result = "";
        clsContact contact = new clsContact();
        result = contact.updateDiscontinuedByIDArray(id);
        if (result != "1")
        {
            string msg = string.Format("show_msg('{0}')", result);
            ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
        }
        else
        {
            search_contact();
            chkHeader.Checked = false;
        }
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
            string id = "";
            foreach (RepeaterItem item in rptContact.Items)
            {
                CheckBox chkItem = (CheckBox)item.FindControl("chkRow");
                if (chkItem.Checked)
                {
                    HiddenField hfItem = (HiddenField)item.FindControl("chkID");
                    id += hfItem.Value + "|";
                }
            }
            if (id != "")
            {
                id = id.Remove(id.Length - 1, 1);
            }
            else
            {
                string msg = "show_msg('Chưa chọn danh sách, vui lòng kiểm tra lại.')";
                ScriptManager.RegisterStartupScript(this, GetType(), "", msg, true);
                return;
            }
            DataTable dt = new DataTable();
            clsContact contact = new clsContact();
            dt = contact.selectCategoryByIDArray(id);
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.RowHeight = 22;
                wb.ShowGridLines = true;
                wb.Style.Font.FontName = "Times New Roman";
                wb.Style.Font.FontSize = 13;
                wb.Style.Alignment.Vertical = XLAlignmentVerticalValues.Center;
                wb.Worksheets.Add(dt, "Contacts");
                MemoryStream stream = GetStream(wb);
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition",
                "attachment; filename=Contacts.xlsx");
                Response.ContentType = "application/vnd.ms-excel";
                Response.BinaryWrite(stream.ToArray());
                Response.End();
            }
    }

    public MemoryStream GetStream(XLWorkbook excelWorkbook)
    {
        MemoryStream fs = new MemoryStream();
        excelWorkbook.SaveAs(fs);
        fs.Position = 0;
        return fs;
    }
}