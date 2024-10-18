﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="default.ascx.cs" Inherits="PageStyles_MessagePage_default" %>

<%@ Register TagPrefix="FillData" Namespace="FillData" %>
<header>
    <div id="top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 top-left">
                    <ul class="list-inline">
                        <FillData:clsTopMenu location="1" runat="server" />
                        <%--<li><a href="/">Trang chủ</a></li>
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="#">Liên hệ</a></li>--%>
                    </ul>
                </div>
                <%--<div class="col-xs-12 col-sm-6 top-right hidden-xs hidden-sm">
                    <input type="text" placeholder="Bạn muốn tìm gì..." id="txt-search" />
                    <a id="btn-search"><i class="fa fa-search"></i></a>
                </div>--%>
            </div>
        </div>
    </div>
    <!--End top-->
    <div id="banner">
        <div class="container">
            	<div class="hidden-xs hidden-sm" id="fSearch">
                    <input type="text" placeholder="Bạn muốn tìm gì..." id="txt-search" />
                    <a id="btn-search"><i class="fa fa-search"></i></a>
                </div>
		<div class="row">
                <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="logo">
                    <a href="/">
                        <img src="images/logo.png" alt="Nội san Khoa học trường Đại học Công nghệ Đồng Nai" />
                    </a>
                </div>
                <!--End logo-->
                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 hidden-xs hidden-sm" id="menu-pc">
                    <div id="navigation">
                        <nav class="navbar navbar-default" role="navigation" id="main-nav">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="collapse navbar-collapse navbar-ex1-collapse">
                                <ul class="nav navbar-nav">
                                    <FillData:clsTopMenu location="2" runat="server" />
                                    <%--<li><a href="#">Tin tức</a></li>
                                    <li><a href="#">Thông báo</a></li>
                                    <li><a href="#">Phòng ban</a></li>
                                    <li><a href="#">Khoa</a></li>
                                    <li><a href="#">Tuyển sinh</a></li>
                                    <li><a href="#">Đào tạo</a></li>--%>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                <!--End navigation-->
            </div>
        </div>
    </div>
    <!--End banner-->
    <div id="mobile-menu" class="visible-xs visible-sm">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="header">
                        <a href="#menu"></a>
                        <div id="search-box-mm">
                            <input type="text" placeholder="Bạn muốn tìm gì..." id="txt-search_mm" />
                            <a id="btn-search_mm"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End mm menu-->
</header>
<div class="hidden-xs hidden-sm" id="line-after-header"></div>
<div id="main-cat">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-8">
                <div class="msg-wrap">
                <FillData:clsCatTitle runat="server" />
                <%--<h3 class="cat-tit"><span>Thông báo</span></h3>--%>
                <div id="document">
                    <%--<div class="doc-item">
                        <h4><a href="#">Giáo trình SpeakOut</a></h4>
                        <p class="doc-des">Giáo trình dùng trong giảng dạy tiếng Anh giao tiếp và Speaking Giáo trình dùng trong giảng dạy tiếng Anh giao tiếp và Speaking</p>
                        <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54 <i class="fa fa-fw fa-eye"></i>Lượt xem 2.532</p>
                    </div>
                    <div class="doc-item">
                        <h4><a href="#">Tiếng Anh giao tiếp 1</a></h4>
                        <p class="doc-des">Giáo trình sử dụng trong học tiếng Anh giao tiếp</p>
                        <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54 <i class="fa fa-fw fa-eye"></i>Lượt xem 250</p>
                    </div>
                    <div class="doc-item">
                        <h4><a href="#">Tiếng Anh chuyên ngành Quản trị Kinh doanh</a></h4>
                        <p class="doc-des">Giáo trình rất hữu hiệu cho sinh viên ngành Quản trị muốn nâng cao năng lực sử dụng tiếng Anh</p>
                        <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54 <i class="fa fa-fw fa-eye"></i>Lượt xem 250</p>
                    </div>
                    <div class="doc-item">
                        <h4><a href="#">Giáo trình Target TOEIC</a></h4>
                        <p class="doc-des">Giáo trình ôn thi Chứng chit tiếng Anh </p>
                        <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54 <i class="fa fa-fw fa-eye"></i>Lượt xem 250</p>
                    </div>
                    <div class="doc-item">
                        <h4><a href="#">Only for use on empty elements</a></h4>
                        <p class="doc-des">Icon classes should only be used on elements that contain no text content and have no child elements.</p>
                        <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54 <i class="fa fa-fw fa-eye"></i>Lượt xem 250</p>
                    </div>
                    <div class="doc-item">
                        <h4><a href="#">Tiếng Anh giao tiếp 1</a></h4>
                        <p class="doc-des">Giáo trình sử dụng trong học tiếng Anh giao tiếp</p>
                        <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54 <i class="fa fa-fw fa-eye"></i>Lượt xem 250</p>
                    </div>
                    <div class="doc-item">
                        <h4><a href="#">Tiếng Anh chuyên ngành Quản trị Kinh doanh</a></h4>
                        <p class="doc-des">Giáo trình rất hữu hiệu cho sinh viên ngành Quản trị muốn nâng cao năng lực sử dụng tiếng Anh</p>
                        <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54 <i class="fa fa-fw fa-eye"></i>Lượt xem 250</p>
                    </div>
                    <div class="doc-item">
                        <h4><a href="#">Giáo trình Target TOEIC</a></h4>
                        <p class="doc-des">Giáo trình ôn thi Chứng chit tiếng Anh </p>
                        <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54 <i class="fa fa-fw fa-eye"></i>Lượt xem 250</p>
                    </div>
                    <div class="doc-item">
                        <h4><a href="#">Giáo trình Target TOEIC</a></h4>
                        <p class="doc-des">Giáo trình ôn thi Chứng chit tiếng Anh </p>
                        <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54 <i class="fa fa-fw fa-eye"></i>Lượt xem 250</p>
                    </div>--%>
                </div>
                <div id="loading">
                    <img src="/images/ajax-loader.gif" alt="Loading" />
                </div>
                <div id="loading-box">
                    <%--<button id="btn-msg-more" class="btn btn-sm btn-default pull-right btn-more"><i class="fa fa-angle-double-down" onclick="return load_message()"></i>Xem thêm</button>--%>
                    <input type="button" value="Xem thêm" class="btn btn-sm btn-default pull-right btn-more" onclick="load_message()" />
                </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <div id="home-msg">
                    <%--<FillData:clsTopNews location="5" runat="server" />--%>
                    <FillData:clsNewsCatImp location="5" runat="server" />
                </div>

                <%--<div class="top-news">
                    <FillData:clsTopNews location="5" runat="server" />
                </div>--%>

                <%--<FillData:clsMessage location="5" runat="server" />--%>
                <%--<h3 class="cat-tit"><span>Thông báo</span><a href="/thong-bao" class="pull-right all">Tất cả<i class="fa fa-fw fa-angle-double-right"></i></a></h3>
                <div class="msg-box">
                    <div class="msg-item">
                        <a href="#" class="msg-left">
                            <p>26</p>
                            <p>Tháng 8</p>
                        </a>
                        <div class="msg-right">
                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó? Nó đến từ đâu? Làm thế nào để có nó?</a></h5>
                        </div>
                    </div>
                    <div class="msg-item">
                        <a href="#" class="msg-left">
                            <p>25</p>
                            <p>Tháng 12</p>
                        </a>
                        <div class="msg-right">
                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó?</a></h5>
                        </div>
                    </div>
                    <div class="msg-item">
                        <a href="#" class="msg-left">
                            <p>24</p>
                            <p>Tháng 8</p>
                        </a>
                        <div class="msg-right">
                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó?</a></h5>
                        </div>
                    </div>
                    <div class="msg-item">
                        <a href="#" class="msg-left">
                            <p>23</p>
                            <p>Tháng 10</p>
                        </a>
                        <div class="msg-right">
                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó?</a></h5>
                        </div>
                    </div>
                    <div class="msg-item">
                        <a href="#" class="msg-left">
                            <p>22</p>
                            <p>Tháng 8</p>
                        </a>
                        <div class="msg-right">
                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó?</a></h5>
                        </div>
                    </div>
                    <div class="msg-item">
                        <a href="#" class="msg-left">
                            <p>23</p>
                            <p>Tháng 10</p>
                        </a>
                        <div class="msg-right">
                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó?</a></h5>
                        </div>
                    </div>
                </div>--%>
                <!--End msg-box-->
                <FillData:clsLink location="8" runat="server" />
                <%--                <h3 class="cat-tit-3"><span>Liên kết</span></h3>
                <ul class="list-unstyled lst">
                    <li><a href="#">Trang chủ DNTU</a></li>
                    <li><a href="#">Thông tin - Thư viện</a></li>
                    <li><a href="#">Phòng Đào tạo</a></li>
                    <li><a href="#">Ký túc xác</a></li>
                </ul>--%>
                <!--End link-->
                <FillData:clsVideo location="7" runat="server" />
                <%--<h3 class="cat-tit-2"><span>Video</span></h3>
                <div class="embed-responsive embed-responsive-16by9" style="margin-bottom: 15px;">
                    <iframe src="https://www.youtube.com/embed/499xiwmTu74?list=PLyfEWMZU8iNbBLcp7lf5LaToGRjz6n7BB"></iframe>
                </div>--%>
                <!--End video-->
                <div style="margin-bottom: 15px;"></div>
                <h3 class="cat-tit-4"><span>Truy cập</span></h3>
                <ul class="list-unstyled visit">
                    <FillData:clsVisit runat="server" />
                    <%--<li><i class="fa fa-fw fa-spinner fa-pulse icon-2x"></i>
                        Đang online<span class="badge">1</span></li>
                    <li><i class="fa fa-fw fa-user icon-2x"></i>
                        Hôm nay<span class="badge">1</span></li>
                    <li><i class="fa fa-fw fa-calendar icon-2x"></i>
                        Hôm qua<span class="badge">4</span></li>
                    <li><i class="fa fa-fw fa-bar-chart icon-2x"></i>
                        Tất cả<span class="badge">239</span></li>--%>
                </ul>
                <!--End visit-->
            </div>
        </div>
    </div>
</div>
<div id="link">
    <div class="container">
        <div class="row">
            <FillData:clsConnect location="13" runat="server" />
            <%--<div class="col-xs-12">
                <p class="link-title">Kết nối</p>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <a href="#">
                    <h3>Đoàn thanh niên</h3>
                </a>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <a href="#">
                    <h3>Quy chế tuyển sinh</h3>
                </a>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <a href="#">
                    <h3>Công nhận tốt nghiệp</h3>
                </a>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <a href="#">
                    <h3>Tuyển dụng</h3>
                </a>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <a href="#">
                    <h3>Kết quả tuyển sinh</h3>
                </a>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <a href="#">
                    <h3>Công khai giáo dục</h3>
                </a>
            </div>--%>
        </div>
    </div>
</div>
<%--<div id="connect">
    <FillData:clsEnterprise location="9" runat="server" />
    <%--<div id="mm-connect" class="visible-xs visible-sm">
        <span><i class="fa fa-fw fa-gg icon"></i>Đối tác liên kết</span>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-2 hidden-xs hidden-sm">
                <div class="connect-left">
                    <span><i class="fa fa-fw fa-gg icon"></i>Đối tác liên kết</span>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-10">
                <div class="connect-right" id="owl-connect">
                    <div class="item">
                        <a href="#">
                            <img src="images/logo_1.jpg" alt="Golf long thành" />
                            <p>Golf Long Thành</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="images/logo_3.jpg" alt="Siêu thị coopmart" />
                            <p>Siêu thị coopmart</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="images/logo_4.jpg" alt="Viettel" />
                            <p>Viettel</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="images/logo_5.jpg" alt="Mobifone" />
                            <p>Mobifone</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="images/logo_6.jpg" alt="Kinh Đô" />
                            <p>Kinh đô</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="images/logo_7.jpg" alt="Vietcombank" />
                            <p>Vietcombank</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="images/logo_8.jpg" alt="Doanh nhân trẻ" />
                            <p>Doanh nhân trẻ</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="images/logo_9.jpg" alt="Tân Hiệp Phát" />
                            <p>Tân hiệp Phát</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="images/logo_10.jpg" alt="KIDO'S" />
                            <p>KIDO'S</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>
<!--End connect-->
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 footer-left">
                <span>Copyright © 2016 trường Cao đẳng Y tế Đồng Nai</span>
            </div>
            <div class="col-xs-12 col-sm-6 footer-right">
                <span>Điện thoại: (0251) 3.881.390 / (0251) 22.11.154 - Email: info@cyd.edu.vn</span>
            </div>
        </div>
    </div>
</footer>
<!--End footer-->
<nav id="menu">
    <ul>
        <FillData:clsTopMenu location="2" runat="server" />
        <%--<li><a href="#">Tin tức</a></li>
        <li><a href="#">Thông báo</a></li>
        <li><a href="#">Phòng ban</a></li>
        <li><a href="#">Khoa</a></li>
        <li><a href="#">Tuyển sinh</a></li>
        <li><a href="#">Đào tạo</a></li>--%>
    </ul>
</nav>
<!--End mobile menu-->
<a href="#0" class="cd-top">Top</a>

<script src="/PageStyles/MessagePage/js/message-js.js"></script>