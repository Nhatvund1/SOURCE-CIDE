<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordChange.aspx.cs" Inherits="adm_PasswordChange" %>

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
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="form-group form-group-sm">
                        <label for="txtPassword">Mật khẩu cũ</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control p-s" TextMode="Password" AutoCompleteType="None"></asp:TextBox>
                    </div>
                    <div class="form-group form-group-sm">
                        <label for="txtNewPass">Mật khẩu mới</label>
                        <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control p-s" TextMode="Password" AutoCompleteType="None"></asp:TextBox>
                    </div>
                    <div class="form-group form-group-sm">
                        <label for="txtNewPass_re">Nhập lại mật khẩu</label>
                        <asp:TextBox ID="txtNewPass_re" runat="server" CssClass="form-control p-s" TextMode="Password" AutoCompleteType="None"></asp:TextBox>
                    </div>
                    <div class="form-group form-group-sm text-right">
                        <asp:Button ID="btnSave" runat="server" Text="Thay đổi" CssClass="btn btn-sm btn-success" OnClick="btnSave_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Nhập lại" CssClass="btn btn-sm btn-warning" OnClick="btnClear_Click" />
                        <asp:Button ID="btnClose" runat="server" Text="Bỏ qua" CssClass="btn btn-sm btn-default" OnClick="btnClose_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </form>
</body>
<script src="/js/ad_js.js"></script>
</html>
