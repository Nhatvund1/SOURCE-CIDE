<%@ Page Title="" Language="C#" MasterPageFile="~/adm/Admin.master" AutoEventWireup="true" CodeFile="Folder.aspx.cs" Inherits="adm_Folder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Ad" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                <div class="folder-left">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-fw fa-sitemap icon-2x"></i>Thư mục tin
                        </div>
                        <div class="panel-body tree-body mCustomScrollbar" data-mcs-theme="inset-2-dark">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:TreeView ID="tvCat" runat="server" ShowLines="True" OnSelectedNodeChanged="tvCat_SelectedNodeChanged">
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
            </div>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                <div class="folder-right">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnLoadTree" runat="server" Text="Load tree" OnClick="btnLoadTree_Click" Style="display: none;" />
                                    <asp:Button ID="btnAdd" runat="server" Text="Thêm" CssClass="btn btn-xs btn-cmd" OnClick="btnAdd_Click" />
                                    <asp:Button ID="btnEdit" runat="server" Text="Sửa" CssClass="btn btn-xs btn-cmd" OnClick="btnEdit_Click" />
                                    <asp:Button Style="display: none;" ID="btnDelete" runat="server" Text="Xóa" OnClick="btnDelete_Click" />
                                    <button class="btn btn-xs btn-cmd" onclick="confirm_dialog('Bạn có chắc chắn muốn xóa thư mục này không?')">Xóa</button>
                                    <%--<button class="btn btn-xs btn-cmd" onclick="show_cat_import()">Tổng hợp tin</button>--%>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive table-folder mCustomScrollbar" data-mcs-theme="inset-2-dark">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tvCat" EventName="SelectedNodeChanged" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <table class="table table-bordered table-striped grid">
                                            <thead>
                                                <tr>
                                                    <th>Tên thư mục</th>
                                                    <th>PageStyle</th>
                                                    <th>Tab mới</th>
                                                    <th>Url</th>
                                                    <th>Khóa</th>
                                                    <th>Sort</th>
                                                    <th>Vị trí</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rptCatList" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%#Eval("CatName") %></td>
                                                            <td><%# Eval("PageStyle") %></td>
                                                            <td class="text-center td-check"><%#((bool)Eval("NewTab") == true ? "<i class=\"fa fa-fw fa-check text-primary\"></i>" : "") %></td>
                                                            <td><%#Eval("Url") %></td>
                                                            <td class="text-center td-check"><%#((bool)Eval("Discontinued") == true ? "<i class=\"fa fa-fw fa-remove text-danger\"></i>" : "") %></td>
                                                            <td class="text-center td-check"><%#Eval("Sort") %></td>
                                                            <td class="text-center td-check"><%# string.Format("{0}-{1}-{2}",Eval("Location1"), Eval("Location2"), Eval("Location3")) %></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <%--<asp:UpdatePanel ID="upCatList" runat="server" UpdateMode="Always">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tvCat" EventName="SelectedNodeChanged" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <table class="table table-bordered table-striped grid">
                                            <thead>
                                                <tr>
                                                    <th>Tên thư mục</th>
                                                    <th>PageStyle</th>
                                                    <th>Url</th>
                                                    <th>Ẩn</th>
                                                    <th>Sort</th>
                                                    <th>Vị trí</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rptCatList" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%#Eval("CatName") %></td>
                                                            <td><%# Eval("PageStyle") %></td>
                                                            <td><%#Eval("Url") %></td>
                                                            <td class="text-center"><%#((bool)Eval("Discontinued") == true ? "<i class=\"fa fa-fw fa-remove text-danger\"></i>" : "") %></td>
                                                            <td class="text-center"><%#Eval("Sort") %></td>
                                                            <td class="text-center"><%#Eval("Location") %></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>--%>
                                <%--<iframe id="ifFolders" style="border: none; min-width: 100%; height: 99%;"></iframe>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <%--End main-right--%>
            </div>
        </div>
    </div>

    <%--Add folder--%>
    <div id="add_folder" class="add-form">
        <iframe id="ifcontent"></iframe>
    </div>

    <%--Cat import--%>
    <div id="cat_import" class="add-form">
        <iframe id="ifCatImport"></iframe>
    </div>

    <script>
        jQuery(document).ready(function () {
            var h = jQuery(window).height() - 141;
            jQuery('.table-folder').height(h);
            jQuery('.tree-body').height(h);
        });

        $(".mCustomScrollbar").mCustomScrollbar();

        function open_add_folder(folder_id, tit) {
            $('#ifcontent').attr('src', folder_id);
            document.getElementById('ifcontent').src += '';
            var h = jQuery(window).height();
            var w = jQuery(window).width();
            $('#add_folder').dialog({
                modal: true,
                title: tit,
                width: w,
                height: h,
                resizable: false,
                draggable: false,
                show: {
                    effect: "fade",
                    duration: 300
                },
                hide: {
                    effect: "fade",
                    duration: 300
                }
            });
        };

        function confirm_dialog(confirm_content) {
            $('#dialog-confirm-content').html(confirm_content);
            $("#dialog-confirm").dialog({
                resizable: false,
                height: "auto",
                width: 400,
                resizable: false,
                draggable: false,
                modal: true,
                show: {
                    effect: "fade",
                    duration: 300
                },
                hide: {
                    effect: "fade",
                    duration: 300
                },
                buttons: {
                    "Đồng ý": function () {
                        $("[id*=Ad_btnDelete]").click();
                        $(this).dialog("close");
                    },
                    'Bỏ qua': function () {
                        $(this).dialog("close");
                    }
                }
            });
        };

        function close_add_folder() {
            $('#add_folder').dialog('close');
        };

        function load_tree() {
            $("[id*=Ad_btnLoadTree]").click();
            return false;
        }
    </script>
</asp:Content>
