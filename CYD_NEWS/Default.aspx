<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="INDEX, FOLLOW" />
    <title>Cao đẳng Y tế Đồng Nai</title>
    <meta name="description" content="Cao đẳng Y tế Đồng Nai" />
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/owl-carousel/owl.carousel.css" rel="stylesheet" />
    <link href="/owl-carousel/owl.theme.css" rel="stylesheet" />
    <link href="/owl-carousel/owl.transitions.css" rel="stylesheet" />
    <link href="/css/jquery.mmenu.all.css" rel="stylesheet" />
    <link href="/css/style.css" rel="stylesheet" />

    <script src="/js/jquery.min.js"></script>
    <%--<script src="https://uhchat.net/code.php?f=e4b93e"></script>--%>
    <script src="/js/touchswipe.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/owl-carousel/owl.carousel.min.js"></script>
    <script src="/js/jquery.mmenu.all.min.js"></script>
    <script src="/js/table-res.js"></script>
    <script src="/js/pdfobject.min.js"></script>
    <script src="/js/jssor.slider-23.1.5.min.js"></script>
    <script>
        $(function () {
            $('nav#menu').mmenu();
        });
    </script>
</head>
<body>
    <div>
        <gcse:searchresults></gcse:searchresults>
        <div class="sr-only">
            <gcse:searchbox></gcse:searchbox>
        </div>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"></asp:ScriptManager>
            <div>
                <asp:PlaceHolder ID="Home" runat="server"></asp:PlaceHolder>
            </div>
        </form>
    </div>
</body>
<script src="/js/home.js"></script>
</html>
