<%@ Page Title="" Language="C#" MasterPageFile="~/adm/Admin.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="adm_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Ad" Runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                <div class="main-left">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <i class="fa fa-fw fa-sitemap icon-2x"></i>Thư mục tin
                        </div>
                        <div class="panel-body tree-body mCustomScrollbar" data-mcs-theme="inset-2-dark">
                            <asp:updatepanel id="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TreeView ID="tvCat" EnableViewState="true" runat="server" ShowLines="True" OnSelectedNodeChanged="tvCat_SelectedNodeChanged">
                                        <HoverNodeStyle CssClass="hover" />
                                        <NodeStyle ImageUrl="~/images/Folder.png" CssClass="node" />
                                        <ParentNodeStyle ImageUrl="~/images/Folder-open.png" />
                                        <RootNodeStyle ImageUrl="~/images/Folder-open.png" />
                                        <SelectedNodeStyle CssClass="selected" />
                                    </asp:TreeView>
                                </ContentTemplate>
                            </asp:updatepanel>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                <div class="main-right">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    Quản lý tin tức
                                </div>
                                <div class="col-xs-6">
                                    <asp:updatepanel id="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="btnSearch" OnClientClick="show_waiting()" runat="server" Text="Xem tin" CssClass="btn btn-xs btn-cmd" OnClick="btnSearch_Click" />
                                            <asp:Button ID="btnAdd" runat="server" Text="Thêm mới" CssClass="btn btn-xs btn-cmd" OnClick="btnAdd_Click" />
                                        </ContentTemplate>
                                    </asp:updatepanel>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="form-horizontal">
                                <div class="form-group form-group-sm">
                                    <label for="Ad_txtTitle" class="control-label col-sm-2">Tiêu đề</label>
                                    <div class="col-sm-5">
                                        <asp:textbox id="txtTitle" runat="server" cssclass="form-control" placeholder="Tiêu đề"></asp:textbox>
                                    </div>
                                    <label for="Ad_txtTitle" class="control-label col-sm-2">Trạng thái</label>
                                    <div class="col-sm-3 checkbox">
                                        <label>
                                            <asp:checkbox id="chkDiscontinued" runat="server" />
                                            Tin bị ẩn</label>
                                    </div>
                                </div>
                                <div class="form-group form-group-sm bot">
                                    <label for="Ad_txtFrom" class="control-label col-sm-2">Từ ngày</label>
                                    <div class="col-sm-5">
                                        <asp:textbox id="txtFrom" runat="server" cssclass="form-control datepicker" placeholder="Từ ngày"></asp:textbox>
                                    </div>
                                    <label for="Ad_txtTo" class="control-label col-sm-2">Đến ngày</label>
                                    <div class="col-sm-3">
                                        <asp:textbox id="txtTo" runat="server" cssclass="form-control datepicker" placeholder="Đến ngày"></asp:textbox>
                                    </div>
                                </div>
                                <div class="my_line"></div>
                                <div id="news" class="mCustomScrollbar" data-mcs-theme="inset-2-dark">
                                    <asp:updatepanel id="UpdatePanel3" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <asp:Repeater ID="rptNews" runat="server" OnItemCommand="rptNews_ItemCommand">
                                                <ItemTemplate>
                                                    <div class="news-item">
                                                        <div class="n-item-left">
                                                            <a onclick='open_edit_news(<%#Eval("NewsID")%>)'>
                                                                <p style="background-image: url('<%#Eval("Avatar")==""?"/images/no-img.jpg":Eval("Avatar") %>')"></p>
                                                            </a>
                                                        </div>
                                                        <div class="n-item-right">
                                                            <a onclick='open_edit_news(<%#Eval("NewsID") %>)'>
                                                                <p><%#Eval("Title") %></p>
                                                            </a>
                                                            <p class="text-muted"><i class="fa fa-fw fa-key icon"></i>ID: <%#Eval("NewsID") %> | <i class="fa fa-fw fa-calendar icon"></i>Ngày tạo: <%#Eval("CreatedDate") %> | <i class="fa fa-fw fa-calendar-check-o icon"></i>Ngày sửa: <%# Eval("UpdatedDate") %></p>
                                                        </div>
                                                        <div class="n-item-cmd">
                                                            <a onclick='open_edit_news(<%#Eval("NewsID") %>)' title="Sửa tin"><i class="fa fa-fw fa-edit"></i></a>
                                                            <a onclick='confirm_delete_news(<%#Eval("NewsID") %>)' title="Xóa tin này"><i class="fa fa-fw fa-remove"></i></a>
                                                            <asp:LinkButton CommandArgument='<%#Eval("NewsID") %>' CommandName="Up" ID="btnUp" ClientIDMode="AutoID" runat="server" ToolTip="Chuyển lên trên"><i class="fa fa-fw fa-arrow-up"></i></asp:LinkButton>
                                                            <asp:LinkButton CommandArgument='<%#Eval("NewsID") %>' CommandName="Down" ID="btnDown" ClientIDMode="AutoID" runat="server" ToolTip="Chuyển xuống dưới"><i class="fa fa-fw fa-arrow-down"></i></asp:LinkButton>
                                                            <asp:LinkButton CommandArgument='<%#Eval("NewsID") %>' CommandName="Move" ID="btnMove" ClientIDMode="AutoID" runat="server" ToolTip="Di chuyển đến thư mục chọn"><i class="fa fa-fw fa-arrows"></i></asp:LinkButton>
                                                            <asp:LinkButton CommandArgument='<%#Eval("NewsID") %>' CommandName="Copy" ID="btnCopy" ClientIDMode="AutoID" runat="server" ToolTip="Copy đến thư mục chọn"><i class="fa fa-fw fa-copy"></i></asp:LinkButton>

                                                            <asp:Button CommandArgument='<%#Eval("NewsID") %>' CommandName="Delete" myid='<%#"btn_del_"+Eval("NewsID") %>' runat="server" Text="Delete" CssClass="btn btn-xs btn-warning sr-only" />
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ContentTemplate>
                                    </asp:updatepanel>
                                </div>

                                <%--<asp:Repeater ID="rptNews" runat="server" OnItemCommand="rptNews_ItemCommand">
                                                <ItemTemplate>
                                                    <div class="news-item">
                                                        <div class="n-item-left">
                                                            <a href="/admin/NewsEdit.aspx?NewsID=<%#Eval("NewsID") %>">
                                                                <p style="background-image: url('<%#Eval("Avatar") %>')"></p>
                                                            </a>
                                                        </div>
                                                        <div class="n-item-right">
                                                            <a href="/admin/NewsEdit.aspx?NewsID=<%#Eval("NewsID") %>">
                                                                <p><%#Eval("Title") %></p>
                                                            </a>
                                                            <p class="text-muted"><i class="fa fa-fw fa-key icon"></i>ID: <%#Eval("NewsID") %> | <i class="fa fa-fw fa-calendar icon"></i>Ngày tạo: <%#Eval("CreatedDate") %> | <i class="fa fa-fw fa-calendar-check-o icon"></i>Ngày sửa: <%# Eval("UpdatedDate") %></p>
                                                        </div>
                                                        <div class="n-item-cmd">
                                                            <a href="/admin/NewsEdit.aspx?NewsID=<%#Eval("NewsID") %>" title="Sửa tin"><i class="fa fa-fw fa-edit"></i></a>
                                                            <asp:LinkButton CommandArgument='<%#Eval("NewsID") %>' CommandName="Delete" OnClientClick="return confirm_delete_news()" ID="btnDelete" runat="server" ToolTip="Xóa tin"><i class="fa fa-fw fa-remove"></i></asp:LinkButton>
                                                            <asp:LinkButton CommandArgument='<%#Eval("NewsID") %>' CommandName="Up" ID="btnUp" runat="server" ToolTip="Chuyển lên trên"><i class="fa fa-fw fa-arrow-up"></i></asp:LinkButton>
                                                            <asp:LinkButton CommandArgument='<%#Eval("NewsID") %>' CommandName="Down" ID="btnDown" runat="server" ToolTip="Chuyển xuống dưới"><i class="fa fa-fw fa-arrow-down"></i></asp:LinkButton>
                                                            <asp:LinkButton CommandArgument='<%#Eval("NewsID") %>' CommandName="Move" ID="btnMove" runat="server" ToolTip="Di chuyển đến thư mục chọn"><i class="fa fa-fw fa-arrows"></i></asp:LinkButton>
                                                            <asp:LinkButton CommandArgument='<%#Eval("NewsID") %>' CommandName="Copy" ID="btnCopy" runat="server" ToolTip="Copy đến thư mục chọn"><i class="fa fa-fw fa-copy"></i></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>--%>
                                <%--<div class="my_line"></div>--%>
                                <%--<iframe id="ifNews" style="border: none; min-width: 100%;" class="mCustomScrollbar" data-mcs-theme="inset-2-dark"></iframe>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <%--End main-right--%>
            </div>
        </div>
    </div>
    <%--Add News--%>
    <div id="add_news" class="add-form">
        <iframe id="ifcontent"></iframe>
    </div>
    <script>
        jQuery(document).ready(function () {
            var h = jQuery(window).height();
            jQuery('#news').height(h - 237);
            jQuery('.tree-body').height(h - 141);
        });

        $(".mCustomScrollbar").mCustomScrollbar();

        //(function ($) {
        //    $(window).on("load", function () {
        //        $(".mCustomScrollbar").mCustomScrollbar();
        //    });
        //})(jQuery);

        function open_add_news(folder_id, tit) {
            $('#ifcontent').attr('src', folder_id);
            document.getElementById('ifcontent').src += '';
            var h = jQuery(window).height();
            var w = jQuery(window).width();
            $('#add_news').dialog({
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

        function open_edit_news(id) {
            var folder_id = '/adm/NewsEdit.aspx?NewsID=' + id;
            $('#ifcontent').attr('src', folder_id);
            document.getElementById('ifcontent').src += '';
            var h = jQuery(window).height();
            var w = jQuery(window).width();
            $('#add_news').dialog({
                modal: true,
                title: 'Sửa tin',
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

        //function view_news(url) {
        //    $('#ifNews').attr('src', url);
        //    document.getElementById('ifNews').src += '';
        //};

        function close_add_news() {
            $('#add_news').dialog('close');
        };

        function close_edit_news() {
            jQuery('#add_news').dialog('close');
        }

        function reload_news() {
            jQuery('#Ad_btnSearch').click();
        }

        function confirm_delete_news(id) {
            $('#dialog-confirm-content').html('Bạn có chắc chắn muốn xóa tin này không?');
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
                        var btn = 'input[myid="btn_del_' + id + '"]';
                        jQuery(btn).click();
                        $(this).dialog("close");
                    },
                    'Bỏ qua': function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        $(function () {
            $(".datepicker").datepicker({
                inline: true,
                showOtherMonths: true,
                dateFormat: 'dd/mm/yy'
            })
			.datepicker('widget').wrap('<div class="ll-skin-cangas"/>');
        });

        //jQuery('.bot').on('focusin', '.datepicker', function () {
        //    jQuery(this).datepicker({ dateFormat: 'dd/mm/yy' });
        //})

        //jQuery('.bot').on('focusin', '.datepicker', function () {
        //    jQuery(this).datepicker({ dateFormat: 'dd/mm/yy' });
        //})
    </script>
</asp:Content>

