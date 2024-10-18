<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CatImportAdd.aspx.cs" Inherits="adm_CatImportAdd" %>

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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="col-xs-12">
            <div class="row" style="margin-bottom: 15px;">
                <div class="col-xs-6">
                    <div class="input-group">
                        <span class="input-group-addon">Số tin</span>
                        <asp:TextBox ID="txtNewsNumber" runat="server" CssClass="form-control number_int" placeholder="Số tin" Text="1"></asp:TextBox>
                    </div>
                </div>
                <div class="col-xs-3">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="btn btn-sm btn-success form-control btn-save" OnClick="btnSave_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="col-xs-3">
                    <input type="button" value="Bỏ qua" class="btn btn-sm btn-default form-control btn-cancel" onclick="parent.close_cat_import()" />
                </div>
            </div>
        </div>
        <div class="col-xs-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-fw fa-sitemap icon-2x"></i>Thư mục tin
                </div>
                <div class="panel-body tree-body mCustomScrollbar" data-mcs-theme="inset-2-dark">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:TreeView ID="tvCat" runat="server" ShowLines="True">
                                <HoverNodeStyle CssClass="hover" />
                                <NodeStyle ImageUrl="~/images/Folder.png" CssClass="node" />
                                <ParentNodeStyle ImageUrl="~/images/Folder-open.png" />
                                <RootNodeStyle ImageUrl="~/images/Folder-open.png" />
                                <SelectedNodeStyle CssClass="selected" />
                            </asp:TreeView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</body>
<script>
    jQuery(".number_int").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13]) !== -1 ||
            // Allow: Ctrl+A, Command+A
            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
            // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
</script>
</html>
