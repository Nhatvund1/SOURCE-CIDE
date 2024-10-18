<%@ Page Title="" Language="C#" MasterPageFile="~/adm/Admin.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="adm_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Ad" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Quản lý liên hệ
                    </div>
                    <div class="panel-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label for="Ad_chkDiscontinued" class="col-sm-2 control-label">Trạng thái</label>
                                <div class="col-sm-2 checkbox">
                                    <label>
                                        <asp:CheckBox ID="chkDiscontinued" runat="server" />Đã xem</label>
                                </div>
                                <label for="Ad_txtContactNumber" class="col-sm-2 control-label">Số tin</label>
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control number_int" Text="100"></asp:TextBox>
                                </div>
                                <div class="col-sm-4">
                                    <asp:Button ID="btnSearch" runat="server" Text="Tra cứu" CssClass="btn btn-sm btn-success btn-save" OnClick="btnSearch_Click" />
                                    <asp:Button ID="btnExport" runat="server" Text="Xuất Excel" CssClass="btn btn-sm btn-success btn-save" OnClick="btnExport_Click" />
                                    <asp:Button ID="btnMark" runat="server" Text="Đã xem" OnClick="btnMark_Click" CssClass="sr-only" />
                                    <input type="button" value="Đã xem" class="btn btn-sm btn-success btn-save" onclick="confirm_dis()" />
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                                    <asp:PostBackTrigger ControlID="btnExport" />
                                    <asp:AsyncPostBackTrigger ControlID="btnMark" EventName="Click" />
                                </Triggers>
                                <ContentTemplate>
                                    <table class="table table-bordered table-striped grid" style="margin-bottom: 0px;" id="tbl-contact">
                                        <thead>
                                            <tr>
                                                <th class="check">
                                                    <asp:CheckBox ID="chkHeader" runat="server" OnClientClick="check_all()" />
                                                </th>
                                                <th>Người gửi</th>
                                                <th>Điện thoại</th>
                                                <th>Chủ đề</th>
                                                <th>Ngày tạo</th>
                                                <th class="cmd">Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rptContact" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center">
                                                            <asp:CheckBox ID="chkRow" runat="server" />
                                                            <asp:HiddenField ID="chkID" runat="server" Value='<%#Eval("ContactID") %>' />
                                                        </td>
                                                        <td><%#Eval("ContactName") %></td>
                                                        <td><%#Eval("Phone") %></td>
                                                        <td><%#Eval("Subject") %></td>
                                                        <td><%#Eval("CreatedDate","{0:dd/MM/yyyy}") %></td>
                                                        <td class="text-center">
                                                            <a class="cmd-e"><i class="fa fa-fw fa-eye" onclick="open_view_contact('<%#Eval("ContactID") %>', 'Chi tiết thông tin liên hệ')"></i></a>
                                                            <a class="cmd-d"><i class="fa fa-fw fa-close" onclick="confirm_delete_contact(<%#Eval("ContactID") %>)"></i></a>
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
        </div>
    </div>
    <%--Add Contact--%>
    <div id="view_contact" class="view-form">
        <iframe id="ifcontent"></iframe>
    </div>
    <script>
        function open_view_contact(contact_id, tit) {
            var url = '/adm/ContactDetail.aspx?ContactID=' + contact_id;
            $('#ifcontent').attr('src', url);
            document.getElementById('ifcontent').src += '';
            var h = jQuery(window).height();
            $('#view_contact').dialog({
                modal: true,
                title: tit,
                width: 500,
                height: h - 50,
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

        function close_contact_detail() {
            jQuery('#view_contact').dialog('close');
        }

        function refresh_contact() {
            jQuery('#Ad_btnSearch').click();
        }

        function confirm_delete_contact(id) {
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
                        jQuery.ajax({
                            type: 'POST',
                            url: '/adm/Contact.aspx/delete_contact',
                            data: '{"contact_id":"' + id + '"}',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (data) {
                                if (data.d === "1") {
                                    jQuery('#Ad_btnSearch').click();
                                }
                                else {
                                    show_msg(data.d);
                                }
                            }
                        });
                        $(this).dialog("close");
                    },
                    'Bỏ qua': function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        $('body').on('click', '[id*=chkHeader]', function () {
            if ($(this).is(":checked")) {
                $('body [name*=chkRow]').prop('checked', true);
            } else {
                $('body [name*=chkRow]').prop('checked', false);
            }
        })

        $('body').on('click', '[id*=chkRow]', function () {
            if ($("#tbl-contact [id*=chkRow]").length == $("#tbl-contact [id*=chkRow]:checked").length) {
                $('#tbl-contact [id*=chkHeader]').prop('checked', true);
            } else {
                $('#tbl-contact [id*=chkHeader]').prop('checked', false);
            }
        })

        function confirm_dis() {
            $('#dialog-confirm-content').html('Bạn có chắc chắn muốn đánh dấu đã xem những liên hệ này?');
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
                        $("[id*=btnMark]").click();
                        $(this).dialog("close");
                    },
                    'Bỏ qua': function () {
                        $(this).dialog("close");
                    }
                }
            });
        }
    </script>
</asp:Content>

