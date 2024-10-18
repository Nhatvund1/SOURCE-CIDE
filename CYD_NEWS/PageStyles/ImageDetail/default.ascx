<%@ Control Language="C#" AutoEventWireup="true" CodeFile="default.ascx.cs" Inherits="PageStyles_ImageDetail_default" %>

<%@ Register TagPrefix="FillData" Namespace="FillData" %>
<link href="/PageStyles/ImageDetail/css/image-detail.css" rel="stylesheet" />
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
            <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 960px; height: 480px; overflow: hidden; visibility: hidden; background-color: transparent;">
                <!-- Loading Screen -->
                <div data-u="loading" style="position: absolute; top: 0px; left: 0px; background-color: rgba(0,0,0,0.7);">
                    <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                    <div style="position: absolute; display: block; background: url('/images/ajax-loader.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                </div>
                <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 240px; width: 720px; height: 480px; overflow: hidden;">
                    <FillData:clsImageDetail runat="server" />
                    <%--<div>
                        <img data-u="image" src="img/01.jpg" />
                        <img data-u="thumb" src="img/thumb-01.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/02.jpg" />
                        <img data-u="thumb" src="img/thumb-02.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/03.jpg" />
                        <img data-u="thumb" src="img/thumb-03.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/04.jpg" />
                        <img data-u="thumb" src="img/thumb-04.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/05.jpg" />
                        <img data-u="thumb" src="img/thumb-05.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/06.jpg" />
                        <img data-u="thumb" src="img/thumb-06.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/07.jpg" />
                        <img data-u="thumb" src="img/thumb-07.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/08.jpg" />
                        <img data-u="thumb" src="img/thumb-08.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/09.jpg" />
                        <img data-u="thumb" src="img/thumb-09.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/10.jpg" />
                        <img data-u="thumb" src="img/thumb-10.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/11.jpg" />
                        <img data-u="thumb" src="img/thumb-11.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/12.jpg" />
                        <img data-u="thumb" src="img/thumb-12.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/13.jpg" />
                        <img data-u="thumb" src="img/thumb-13.jpg" />
                    </div>
                    <div>
                        <img data-u="image" src="img/14.jpg" />
                        <img data-u="thumb" src="img/thumb-14.jpg" />
                    </div>--%>
                </div>
                <!-- Thumbnail Navigator -->
                <div data-u="thumbnavigator" class="jssort01-99-66" style="position: absolute; left: 0px; top: 0px; width: 240px; height: 480px;" data-autocenter="2">
                    <!-- Thumbnail Item Skin Begin -->
                    <div data-u="slides" style="cursor: default;">
                        <div data-u="prototype" class="p">
                            <div class="w">
                                <div data-u="thumbnailtemplate" class="t"></div>
                            </div>
                            <div class="c"></div>
                        </div>
                    </div>
                    <!-- Thumbnail Item Skin End -->
                </div>
                <!-- Arrow Navigator -->
                <span data-u="arrowleft" class="jssora05l" style="top: 0px; left: 248px; width: 40px; height: 40px;" data-autocenter="2"></span>
                <span data-u="arrowright" class="jssora05r" style="top: 0px; right: 8px; width: 40px; height: 40px;" data-autocenter="2"></span>
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
<script src="/PageStyles/ImageDetail/js/image-detail.js"></script>
<script type="text/javascript">jssor_1_slider_init();</script>