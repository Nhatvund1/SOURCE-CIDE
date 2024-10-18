<%@ Page Title="" Language="C#" MasterPageFile="~/adm/Admin.master" AutoEventWireup="true" CodeFile="CatImport.aspx.cs" Inherits="adm_CatImport" %>

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
                                    <asp:Button ID="btnReloadCatImport" runat="server" Text="Reload cat import" CssClass="sr-only" OnClick="btnReloadCatImport_Click" />
                                    <asp:Button ID="btnAdd" runat="server" Text="Thêm" CssClass="btn btn-xs btn-cmd" OnClick="btnAdd_Click" />
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
                                                    <th>Thư mục được chọn</th>
                                                    <th class="cmd">Số tin</th>
                                                    <th class="cmd">Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rptCatImport" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# Eval("CatName") %></td>
                                                            <td class="text-center cmd"><%# Eval("NewsNumber") %></td>
                                                            <td class="text-center cmd">
                                                                <i class="fa fa-fw fa-remove text-danger btn-a" onclick="confirm_Delete_cat_imp(<%# Eval("CatID") %>, <%# Eval("CatIDLink") %>)"></i>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
                <%--End main-right--%>
            </div>
        </div>
    </div>

    <%--Show cat import--%>
    <div id="cat_import" class="add-form">
        <iframe id="ifCatImport"></iframe>
    </div>

    <%--Confirm delete cat import--%>
    <div id="confirm_cat_mp" title="Xác nhận?">
        <span id="confirm_cat_imp_content"></span>
    </div>

    <script>
        jQuery(document).ready(function () {
            var h = jQuery(window).height() - 141;
            jQuery('.table-folder').height(h);
            jQuery('.tree-body').height(h);
        });

        $(".mCustomScrollbar").mCustomScrollbar();

        function show_cat_import(url) {
            $('#ifCatImport').attr('src', url);
            document.getElementById('ifCatImport').src += '';
            var h = jQuery(window).height();
            var w = 600;
            $('#cat_import').dialog({
                modal: true,
                title: 'Tổng hợp tin',
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
        }

        function close_cat_import() {
            $('#cat_import').dialog('close');
        };

        function reload_cat_import() {
            $('#Ad_btnReloadCatImport').click();
        }

        function confirm_Delete_cat_imp(cat_id, cat_id_link) {
            $('#confirm_cat_imp_content').html('Bạn có chắc chăn muốn xoá thư mục này không?');
            $("#confirm_cat_mp").dialog({
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
                        delete_cat_imp(cat_id, cat_id_link);
                        $(this).dialog("close");
                    },
                    'Bỏ qua': function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        function delete_cat_imp(cat_id, cat_id_link) {
            jQuery.ajax({
                type: "POST",
                url: "/adm/CatImport.aspx/deleteCatImport",
                data: '{"catID":"' + cat_id + '","catIDLink":"' + cat_id_link + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != '1') {
                        show_msg(data.d);
                    }
                    else {
                        parent.reload_cat_import();
                    }
                }
            });
        }
    </script>
</asp:Content>

