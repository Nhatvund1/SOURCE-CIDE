<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FolderAdd.aspx.cs" Inherits="adm_FolderAdd" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

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
        <div class="col-sm-5">
            <div class="form-group form-group-sm">
                <label for="Ad_txtCatName">Tên thư mục</label>
                <asp:TextBox ID="txtCatName" runat="server" CssClass="form-control" placeholder="Tiêu đề"></asp:TextBox>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group form-group-sm">
                <label for="Ad_txtAvatar">Avatar</label>
                <div class="input-group">
                    <asp:TextBox ID="txtAvatar" runat="server" class="form-control" placeholder="Avatar"></asp:TextBox>
                    <span class="input-group-btn">
                        <button onclick="BrowseServer('Images:/images/', 'txtAvatar');" class="btn btn-sm btn-default" type="button"><i class="fa fa-folder-open text-primary"></i></button>
                    </span>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group form-group-sm">
                <label style="color: transparent;">A</label><br />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnSave" runat="server" Text="Lưu thư mục" CssClass="btn btn-sm btn-success btn-save" OnClick="btnSave_Click" />
                        <button onclick="close_me()" class="btn btn-sm btn-default btn-cancel">Bỏ qua</button>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="form-group">
                <label for="Ad_txtDescription">Mô tả ngắn</label>
                <asp:TextBox ID="txtDescription" TextMode="MultiLine" Rows="2" runat="server" CssClass="form-control" placeholder="Mô tả"></asp:TextBox>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="form-group">
                <ckeditor:ckeditorcontrol id="txtDetail" skin="moonocolor" height="250" runat="server"></ckeditor:ckeditorcontrol>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group form-group-sm">
                <label for="Ad_txtLocation">Vị trí</label>
                <div class="row">
                    <div class="col-xs-4">
                        <asp:TextBox ID="txtLocation1" runat="server" CssClass="form-control number_int">0</asp:TextBox>
                    </div>
                    <div class="col-xs-4">
                        <asp:TextBox ID="txtLocation2" runat="server" CssClass="form-control number_int">0</asp:TextBox>
                    </div>
                    <div class="col-xs-4">
                        <asp:TextBox ID="txtLocation3" runat="server" CssClass="form-control number_into">0</asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group form-group-sm">
                <label for="Ad_chkNewTab">Mở tab mới</label>
                <div class="checkbox">
                    <label>
                        <asp:CheckBox ID="chkNewTab" runat="server" />Cho phép mở tab mới</label>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group form-group-sm">
                <label for="Ad_txtIcon">Icon</label>
                <asp:TextBox ID="txtIcon" runat="server" CssClass="form-control" placeholder="Font icon"></asp:TextBox>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group form-group-sm">
                <label for="Ad_txtUrl">Url</label>
                <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control" placeholder="Url"></asp:TextBox>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group form-group-sm">
                <label for="Ad_txtSort">Sort</label>
                <asp:TextBox ID="txtSort" runat="server" CssClass="form-control number_int" placeholder="Sort">0</asp:TextBox>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group form-group-sm">
                <label for="txtNewsNumber">Số tin</label>
                <asp:TextBox ID="txtNewsNumber" runat="server" CssClass="form-control number_int" placeholder="Số tin">5</asp:TextBox>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group form-group-sm">
                <label for="Ad_chkNewsCreate">Thêm tin</label>
                <div class="checkbox">
                    <label>
                        <asp:CheckBox ID="chkNewsCreate" runat="server" />Cho phép thêm tin</label>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group form-group-sm">
                <label for="Ad_cboPageStyle">Kiểu trang</label>
                <asp:DropDownList ID="cboPageStyle" data-live-search="true" runat="server" CssClass="form-control selectpicker"></asp:DropDownList>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group form-group-sm">
                <label for="Ad_chkDiscontinued">Trạng thái</label>
                <div class="checkbox">
                    <label>
                        <asp:CheckBox ID="chkDiscontinued" runat="server" />Khóa thư mục</label>
                </div>
            </div>
        </div>
    </form>
</body>
<script src="/js/ad_js.js"></script>
<script>
    function close_me() {
        parent.close_add_folder();
    }
</script>
</html>
