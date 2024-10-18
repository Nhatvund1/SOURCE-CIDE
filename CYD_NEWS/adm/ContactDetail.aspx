<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactDetail.aspx.cs" Inherits="adm_ContactDetail" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="NOINDEX, NOFOLLOW" />
    <title></title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/css/jquery-ui.min.css" rel="stylesheet" />
    <link href="/css/bootstrap-select.min.css" rel="stylesheet" />
    <link href="/css/admin-style.css" rel="stylesheet" />
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.ui.datepicker-vi-VN.js"></script>
    <script src="/ckfinder/ckfinder.js"></script>
    <script src="/ckeditor/ckeditor.js"></script>
    <script src="/js/bootstrap-select.min.js"></script>
</head>
<body style="background: none;">
<form id="form1" runat="server">
        <div id="contact-detail">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12">
                        <asp:Literal ID="liContactDetail" runat="server"></asp:Literal>
                    </div>
                    <div class="col-xs-12 text-center">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnSave" runat="server" Text="Đã xem" CssClass="btn btn-sm btn-success btn-save" OnClick="btnSave_Click" />
                                <input type="button" value="Bỏ qua" class="btn btn-sm btn-default btn-cancel" onclick="parent.close_contact_detail()" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
