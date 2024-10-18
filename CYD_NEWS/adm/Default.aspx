<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="adm_Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="NOINDEX, NOFOLLOW" />
    <title>Đăng nhập hệ thống</title>
    <link href="/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/login-style.css">
</head>
<body>
<form id="form1" runat="server">
        <div class="box">
            <div id="header">
                <div id="cont-lock"><i class="fa fa-fw fa-lock lock"></i></div>
                <div id="bottom-head">
                    <h1 id="logintoregister">Đăng nhập</h1>
                </div>
            </div>
            <div>
                <div class="group">
                    <asp:TextBox ID="txtUser" runat="server" CssClass="inputMaterial" required></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Tài khoản</label>
                </div>
                <div class="group">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="inputMaterial" TextMode="Password" required></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Mật khẩu</label>
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="footer-box">
                <p class="footer-text">Developed by: Snow Castle</p>
            </div>
        </div>
    </form>
</body>
</html>
