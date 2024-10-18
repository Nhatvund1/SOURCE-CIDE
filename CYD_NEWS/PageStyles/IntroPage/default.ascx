<%@ Control Language="C#" AutoEventWireup="true" CodeFile="default.ascx.cs" Inherits="PageStyles_IntroPage_default" %>

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
<div id="intro">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <FillData:clsCatTitle runat="server" />
                <%--<h3 class="cat-tit"><span>Giới thiệu</span></h3>--%>
            </div>
            <div class="col-xs-12 col-sm-8 col-md-8">
                <FillData:clsIntroContent runat="server" />
                <%--<p>Xuất phát từ Trường Tá viên Điều dưỡng từ trước 1975, ngày 07.10. 1977 trường Trung cấp Y tế Đồng Nai được Ủy ban nhân dân tỉnh Đồng Nai thành lập và đến ngày 01.02. 2007 Bộ Giáo dục và Đào tạo quyết định nâng cấp thành lập Trường Cao đẳng Y tế. Trải qua 35 năm xây dựng và phát triển vượt nhiều khó khăn, gian khổ đến nay Trường Cao Đẳng Y Tế Đồng Nai có nhiều bước tiến đáng kể trong sự nghiệp giáo dục đào tạo cán bộ y tế góp phần phục vụ chăm sóc tốt sức khỏe nhân dân trong Tỉnh Đồng Nai và khu vực lân cận.</p>
                <div class="row">
                    <div class="intro-item">
                        <div class="col-xs-4 col-sm-5 col-md-3">
                            <p class="intro-item-img" style="background-image: url('/images/images/Intro/toan-truong-cyd.jpg')"></p>
                        </div>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <a href="/gioi-thieu-chung-21">
                                <h3 class="intro-item-title">Giới thiệu chung</h3>
                            </a>
                            <p>Xuất phát từ Trường Tá viên Điều dưỡng từ trước 1975, ngày 07.10. 1977 trường Trung cấp Y tế Đồng Nai được Ủy ban nhân dân tỉnh Đồng Nai thành lập và đến ngày 01.02. 2007 Bộ Giáo dục và Đào tạo quyết định nâng cấp thành lập Trường Cao đẳng Y tế.</p>
                            <ul class="intro-list">
                                <li><a href="/gioi-thieu-chung-21/tong-quan-42">
                                    <p>Tổng quan</p>
                                </a></li>
                                <li><a href="/gioi-thieu-chung-21/tam-nhin-su-menh-cua-truong-43">
                                    <p>Tầm nhìn - Sứ mệnh của Trường</p>
                                </a></li>
                                <li><a href="/gioi-thieu-chung-21/tam-nhin-su-menh-nganh-dieu-duong-67">
                                    <p>Tầm nhìn - Sứ mệnh ngành Điều dưỡng</p>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="intro-item">
                        <div class="col-xs-4 col-sm-5 col-md-3">
                            <p class="intro-item-img" style="background-image: url('')"></p>
                        </div>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <a href="/ban-lanh-dao-22">
                                <h3 class="intro-item-title">Ban lãnh đạo</h3>
                            </a>
                            <p>Ban Giám Hiệu Trường Cao Đẳng Y Tế Đồng Nai gồm: TTƯT.BS. Nguyễn Thị Thanh Hà - HIỆU TRƯỞNG, TTƯT.BS. Nguyễn Lương Thao - PHÓ HIỆU TRƯỞNG, ThS. Nguyễn Hồng Quang - PHÓ HIỆU TRƯỞNG</p>
                            <ul class="intro-list">
                                <li><a href="/ban-lanh-dao-22/ban-giam-hieu-44">
                                    <p>Ban giám hiệu</p>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="intro-item">
                        <div class="col-xs-4 col-sm-5 col-md-3">
                            <p class="intro-item-img" style="background-image: url('/images/images/Intro/toan-truong-cyd.jpg')"></p>
                        </div>
                        <div class="col-xs-8 col-sm-7 col-md-9">
                            <a href="/doan-the-27">
                                <h3 class="intro-item-title">Đoàn thể</h3>
                            </a>
                            <p>Như tuyên truyền giáo dục CBCC thực hiện chủ trương đường lối của Đảng, pháp luật của nhà nước, tổ chức học nghị quyết của Đảng, học pháp luật thực hành tiết kiệm chống lãng phí, phòng chống tham nhũng, an toàn giao thông, an toàn vệ sinh thực phẩm.</p>
                            <ul class="intro-list">
                                <li><a href="/doan-the-27/cong-doan-68">
                                    <p>Công đoàn</p>
                                </a></li>
                                <li><a href="/doan-the-27/dang-bo-70">
                                    <p>Đảng Bộ</p>
                                </a></li>
                                <li><a href="/doan-the-27/doan-thanh-nien-hoi-sinh-vien-69">
                                    <p>Đoàn Thanh niên - Hội Sinh viên</p>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                </div>--%>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <div id="intro-info">
                    <FillData:clsIntroInfo runat="server" />
                    <%--<p class="intro-ava" style="background-image: url('/images/news1.jpg')"></p>
                    <div class="intro-detail">
                        <p>Xuất phát từ Trường Tá viên Điều dưỡng từ trước 1975, ngày 07.10. 1977 trường Trung cấp Y tế Đồng Nai được Ủy ban nhân dân tỉnh Đồng Nai thành lập và đến ngày 01.02. 2007 Bộ Giáo dục và Đào tạo quyết định nâng cấp thành lập Trường Cao đẳng Y tế. Trải qua 35 năm xây dựng và phát triển vượt nhiều khó khăn, gian khổ đến nay Trường Cao Đẳng Y Tế Đồng Nai có nhiều bước tiến đáng kể trong sự nghiệp giáo dục đào tạo cán bộ y tế góp phần phục vụ chăm sóc tốt sức khỏe nhân dân trong Tỉnh Đồng Nai và khu vực lân cận.</p>
                        <p>Xuyên suốt sự nghiệp đào tạo của mình luôn lấy mục tiêu chính để đề ra sứ mạng phát triển chung của toàn trường trong quá khứ, hiện tại và tương lai là: đào tạo, đào tạo lại, bồi dưỡng cán bộ y tế đủ về số lượng và chất lượng, đáp ứng được nhu cầu chăm sóc sức khỏe của nhân dân theo hướng ngày càng hiện đại</p>
                    </div>--%>
                </div>
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
    </div>--%>
<%--</div>--%>
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