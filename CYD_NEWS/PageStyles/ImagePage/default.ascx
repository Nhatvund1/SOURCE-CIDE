<%@ Control Language="C#" AutoEventWireup="true" CodeFile="default.ascx.cs" Inherits="PageStyles_ImagePage_default" %>

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
            <div class="row">
		<div class="hidden-xs hidden-sm" id="fSearch">
                    <input type="text" placeholder="Bạn muốn tìm gì..." id="txt-search" />
                    <a id="btn-search"><i class="fa fa-search"></i></a>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" id="logo">
                    <a href="/">
                        <img src="/images/logo.png" alt="Trường Cao đẳng Y tế Đồng Nai" />
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
                                    <%--                                    <li><a href="#">Tin tức</a></li>
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
<div id="img-gallery">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <FillData:clsCatTitle runat="server" />
                <%--<h3 class="cat-tit"><span>Giới thiệu</span></h3>--%>
            </div>
            <div id="img-list">
                <%--<div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="img-g-item">
                        <a href="#">
                            <p style="background-image: url('/images/news1.jpg')"></p>
                        </a>
                        <a href="#">Khám từ thiện</a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="img-g-item">
                        <a href="#">
                            <p style="background-image: url('/images/news1.jpg')"></p>
                        </a>
                        <a href="#">Tốt nghiệp 2012</a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="img-g-item">
                        <a href="#">
                            <p style="background-image: url('/images/news1.jpg')"></p>
                        </a>
                        <a href="#">Hội nghị trao đổi kinh nghiệm trong công tác đào tạo nhân lực Y tế</a>
                    </div>
                </div>
                <div class="clearfix visible-sm"></div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="img-g-item">
                        <a href="#">
                            <p style="background-image: url('/images/news1.jpg')"></p>
                        </a>
                        <a href="#">Công tác Đoàn</a>
                    </div>
                </div>
                <div class="clearfix visible-md visible-lg"></div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="img-g-item">
                        <a href="#">
                            <p style="background-image: url('/images/news1.jpg')"></p>
                        </a>
                        <a href="#">Lễ Khai giảng năm học 2011 - 2012</a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="img-g-item">
                        <a href="#">
                            <p style="background-image: url('/images/news1.jpg')"></p>
                        </a>
                        <a href="#">Lễ tốt nghiệp 2014</a>
                    </div>
                </div>
                <div class="clearfix visible-sm"></div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="img-g-item">
                        <a href="#">
                            <p style="background-image: url('/images/news1.jpg')"></p>
                        </a>
                        <a href="#">Họp mặt kỉ niệm ngày nhà giáo Việt Nam 2011 - 2012</a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <div class="img-g-item">
                        <a href="#">
                            <p style="background-image: url('/images/news1.jpg')"></p>
                        </a>
                        <a href="#">Hội trại truyền thống 26-3-2015</a>
                    </div>
                </div>--%>
                <%--End img item--%>
            </div>
            <div class="loading-img col-xs-12">
                <img src="/images/ajax-loader.gif" alt="Loading" />
            </div>
            <div class="col-xs-12 img-more">
                <a onclick="load_news()">Xem thêm<i class="fa fa-fw fa-angle-down"></i></a>
            </div>
        </div>
    </div>
</div>
<div id="link">
    <div class="container">
        <div class="row">
            <FillData:clsConnect location="13" runat="server" />
        </div>
    </div>
</div>
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
        <%--        <li><a href="#">Tin tức</a></li>
        <li><a href="#">Thông báo</a></li>
        <li><a href="#">Phòng ban</a></li>
        <li><a href="#">Khoa</a></li>
        <li><a href="#">Tuyển sinh</a></li>
        <li><a href="#">Đào tạo</a></li>--%>
    </ul>
</nav>
<!--End mobile menu-->
<a href="#0" class="cd-top">Top</a>
<script src="/PageStyles/ImagePage/js/image-page-js.js"></script>
