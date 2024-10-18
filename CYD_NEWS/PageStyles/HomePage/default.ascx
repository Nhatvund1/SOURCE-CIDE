<%@ Control Language="C#" AutoEventWireup="true" CodeFile="default.ascx.cs" Inherits="PageStyles_HomePage_default" %>

<%@ Register TagPrefix="FillData" Namespace="FillData" %>
<header>
    <div id="top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 top-left">
                    <ul class="list-inline">
                        <FillData:clsTopMenu location="1" runat="server" />
                        <%--<asp:Repeater ID="rptTopMenu" runat="server">
                                <ItemTemplate>
                                    <li><a href="<%#Eval("Url").ToString()==""?string.Format("/{0}-{1}",clsUrl.Convert(Eval("CatName").ToString()),Eval("CatID")):Eval("Url") %>" <%#Convert.ToBoolean(Eval("NewTab"))==true?"target=\"_blank\"":"" %>><%#Eval("CatName") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>--%>
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
                                    <%--<asp:Repeater ID="rptMainMenu" runat="server">
                                            <ItemTemplate>
                                                <li><a href="<%#Eval("Url").ToString()==""?string.Format("/{0}-{1}",clsUrl.Convert(Eval("CatName").ToString()),Eval("CatID")):Eval("Url") %>" <%#Convert.ToBoolean(Eval("NewTab"))==true?"target=\"_blank\"":"" %>><%#Eval("CatName") %></a></li>
                                            </ItemTemplate>
                                        </asp:Repeater>--%>
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
<div id="carousel">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <FillData:clsSlideshow location="3" runat="server" />
                <%--<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="images/slider.jpg" alt="...">
                                <div class="carousel-caption">
                                    <h3>What is Lorem Ipsum?</h3>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="images/slider.jpg" alt="...">
                                <div class="carousel-caption">
                                    <h3>Why do we use it?</h3>
                                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout</p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="images/slider.jpg" alt="...">
                                <div class="carousel-caption">
                                    <h3>Where does it come from?</h3>
                                    <p>Contrary to popular belief, Lorem Ipsum is not simply random text</p>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>--%>
            </div>
        </div>
    </div>
</div>
<!--End carousel-->
<div id="home-main">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-8">
                <div id="home-news">
                    <FillData:clsFeaturedNews location="4" runat="server" />
                    <%-- <h3 class="cat-tit"><span>Tin hoạt động</span><a href="#" class="pull-right all">Tất cả<i class="fa fa-fw fa-angle-double-right"></i></a></h3>
                        <div class="row">
                            <div class="col-xs-12 col-sm-5">
                                <div class="news-first">
                                    <a href="#">
                                        <p class="news-avatar" style="background-image: url('images/news1.jpg')"></p>
                                    </a>
                                    <h4><a href="#">Lorem Ipsum là gì? Tại sao lại sử dụng nó?</a></h4>
                                    <p class="date"><i class="fa fa-fw fa-calendar icon"></i>26/08/2016</p>
                                    <p class="text-muted">Lorem Ipsum chỉ đơn giản là một đoạn văn bản giả, được dùng vào việc trình bày và dàn trang phục vụ cho in ấn.</p>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-7">
                                <div class="news-lst">
                                    <div class="lst-item">
                                        <div class="n-left">
                                            <a href="#">
                                                <p style="background-image: url('images/news2.jpg')"></p>
                                            </a>
                                        </div>
                                        <div class="n-right">
                                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó?</a></h5>
                                            <p class="date"><i class="fa fa-fw fa-calendar icon"></i>25/08/2016</p>
                                        </div>
                                    </div>
                                    <div class="lst-item">
                                        <div class="n-left">
                                            <a href="#">
                                                <p style="background-image: url('images/news3.jpg')"></p>
                                            </a>
                                        </div>
                                        <div class="n-right">
                                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó?</a></h5>
                                            <p class="date"><i class="fa fa-fw fa-calendar icon"></i>24/08/2016</p>
                                        </div>
                                    </div>
                                    <div class="lst-item">
                                        <div class="n-left">
                                            <a href="#">
                                                <p style="background-image: url('images/news4.jpg')"></p>
                                            </a>
                                        </div>
                                        <div class="n-right">
                                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó?</a></h5>
                                            <p class="date"><i class="fa fa-fw fa-calendar icon"></i>23/08/2016</p>
                                        </div>
                                    </div>
                                    <div class="lst-item">
                                        <div class="n-left">
                                            <a href="#">
                                                <p style="background-image: url('images/news5.jpg')"></p>
                                            </a>
                                        </div>
                                        <div class="n-right">
                                            <h5><a href="#">Nó đến từ đâu? Làm thế nào để có nó? Tại sao lại sử dụng nó?</a></h5>
                                            <p class="date"><i class="fa fa-fw fa-calendar icon"></i>22/08/2016</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                </div>
                <!--End home-news-->
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <div id="home-msg">
                    <%--<FillData:clsTopNews location="5" runat="server" />--%>
                    <FillData:clsNewsCatImp location="5" runat="server" />
                </div>

                <%--<div class="top-news">
                    <FillData:clsTopNews location="5" runat="server" />
                </div>--%>

                <%--<h3 class="cat-tit"><span>Tin khác</span></h3>
                <div class="cat-lst">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-12">
                            <a href="#" class="cat-lst-item">
                                <div class="lst-it-left">
                                    <p style="background-image: url('images/images/Avatar/01_chim_canh_cut.jpg')"></p>
                                </div>
                                <div class="lst-it-right">
                                    <p>Chưa bao giờ DNTU tự tin và mạnh mẽ như bây giờ</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-12">
                            <a href="#" class="cat-lst-item">
                                <div class="lst-it-left">
                                    <p style="background-image: url('images/images/Avatar/01_chim_canh_cut.jpg')"></p>
                                </div>
                                <div class="lst-it-right">
                                    <p>Chưa bao giờ DNTU tự tin và mạnh mẽ như bây giờ</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-12">
                            <a href="#" class="cat-lst-item">
                                <div class="lst-it-left">
                                    <p style="background-image: url('images/images/Avatar/01_chim_canh_cut.jpg')"></p>
                                </div>
                                <div class="lst-it-right">
                                    <p>Chưa bao giờ DNTU tự tin và mạnh mẽ như bây giờ</p>
                                </div>
                            </a>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-12">
                            <a href="#" class="cat-lst-item">
                                <div class="lst-it-left">
                                    <p style="background-image: url('images/images/Avatar/01_chim_canh_cut.jpg')"></p>
                                </div>
                                <div class="lst-it-right">
                                    <p>Chưa bao giờ DNTU tự tin và mạnh mẽ như bây giờ</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>--%>

                <%--<div id="home-msg">
                    <FillData:clsMessage location="5" runat="server" />
                    <h3 class="cat-tit"><span>Thông báo</span><a href="/thong-bao" class="pull-right all">Tất cả<i class="fa fa-fw fa-angle-double-right"></i></a></h3>
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
                        </div>
                    <!--End msg-box-->
                </div>--%>
            </div>
        </div>
    </div>
</div>
<!--End home-main-->
<div class="featured">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-8">
                <div class="row">
                    <div class="col-xs-12">
                        <FillData:clsAdmission location="10" runat="server" />
                        <%--<h3 class="cat-tit"><span>Tuyển sinh</span></h3>
                        <div class="row">
                            <div class="col-xs-12 col-sm-3">
                                <div class="f-item">
                                    <a href="#">
                                        <p style="background-image: url('/images/news1.jpg')"></p>
                                    </a>
                                    <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3">
                                <div class="f-item">
                                    <a href="#">
                                        <p style="background-image: url('/images/news1.jpg')"></p>
                                    </a>
                                    <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3">
                                <div class="f-item">
                                    <a href="#">
                                        <p style="background-image: url('/images/news1.jpg')"></p>
                                    </a>
                                    <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3">
                                <div class="f-item">
                                    <a href="#">
                                        <p style="background-image: url('/images/news1.jpg')"></p>
                                    </a>
                                    <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                    <div class="col-xs-12">
                        <FillData:clsTraining location="11" runat="server" />
                        <%--<h3 class="cat-tit"><span>Đào tạo ngắn hạn</span></h3>
                        <div class="row">
                            <div class="col-xs-12 col-sm-3">
                                <div class="f-item">
                                    <a href="#">
                                        <p style="background-image: url('images/images/Avatar/01_chim_canh_cut.jpg')"></p>
                                    </a>
                                    <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3">
                                <div class="f-item">
                                    <a href="#">
                                        <p style="background-image: url('images/images/Avatar/01_chim_canh_cut.jpg')"></p>
                                    </a>
                                    <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3">
                                <div class="f-item">
                                    <a href="#">
                                        <p style="background-image: url('images/images/Avatar/01_chim_canh_cut.jpg')"></p>
                                    </a>
                                    <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3">
                                <div class="f-item">
                                    <a href="#">
                                        <p style="background-image: url('images/images/Avatar/01_chim_canh_cut.jpg')"></p>
                                    </a>
                                    <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <%--End row--%>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <FillData:clsService location="12" runat="server" />
                <%--                <h3 class="cat-tit"><span>Hệ thống sinh viên</span></h3>
                <ul class="lst-service">
                    <li><a href="#"><i class="fa fa-fw fa-graduation-cap icon-2x"></i>Bảng điểm</a></li>
                    <li><a href="#"><i class="fa fa-fw fa-bookmark-o icon-2x"></i>Hệ thống tín chỉ</a></li>
                    <li><a href="#"><i class="fa fa-fw fa-file icon-2x"></i>Tài liệu</a></li>
                    <li><a href="#"><i class="fa fa-fw fa-book icon-2x"></i>Sổ tay sinh viên</a></li>
                    <li><a href="#"><i class="fa fa-fw fa-clock-o icon-2x"></i>Hệ thống lịch giảng</a></li>
                </ul>--%>
            </div>
        </div>
    </div>
</div>
<div class="featured">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6">
                <FillData:clsLanguageAndInfoTech location="14" runat="server" />
                <%--<h3 class="cat-tit"><span>Trung tâm Tin học Ngoại ngữ</span><a href="#" class="pull-right all">Tất cả<i class="fa fa-fw fa-angle-double-right"></i></a></h3>
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <div class="f-item">
                            <a href="#">
                                <p style="background-image: url('images/news1.jpg')"></p>
                            </a>
                            <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="f-item">
                            <a href="#">
                                <p style="background-image: url('images/news1.jpg')"></p>
                            </a>
                            <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="f-item">
                            <a href="#">
                                <p style="background-image: url('images/news1.jpg')"></p>
                            </a>
                            <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                        </div>
                    </div>
                </div>--%>
            </div>
            <div class="col-xs-12 col-sm-6">
                <FillData:clsLanguageAndInfoTech location="15" runat="server" />
                <%--<h3 class="cat-tit"><span>Phòng khám đa khoa</span><a href="#" class="pull-right all">Tất cả<i class="fa fa-fw fa-angle-double-right"></i></a></h3>
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <div class="f-item">
                            <a href="#">
                                <p style="background-image: url('images/news1.jpg')"></p>
                            </a>
                            <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="f-item">
                            <a href="#">
                                <p style="background-image: url('images/news1.jpg')"></p>
                            </a>
                            <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="f-item">
                            <a href="#">
                                <p style="background-image: url('images/news1.jpg')"></p>
                            </a>
                            <a href="#">Hiệu trưởng làm việc với các điểm liên kết đào tạo</a>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</div>
<div id="home-info">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-3">
                <h3 class="cat-tit-1"><span>Mạng xã hội</span></h3>
                <ul class="list-unstyled foot-con">
                    <li><a target="_blank" href="#"><i class="fa fa-fw fa-facebook"></i></a><a target="_blank" href="https://www.facebook.com/#">Facebook</a></li>
                    <li><a target="_blank" href="#"><i class="fa fa-fw fa-google-plus"></i></a><a target="_blank" href="#">Google plus</a></li>
                    <li><a target="_blank" href="#"><i class="fa fa-fw fa-twitter"></i></a><a target="_blank" href="#">Twitter</a></li>
                    <li><a target="_blank" href="#"><i class="fa fa-fw fa-youtube"></i></a><a target="_blank" href="#">Youtube</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <FillData:clsVideo location="7" runat="server" />
                <%--<h3 class="cat-tit-2"><span>Video</span></h3>
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe src="https://www.youtube.com/embed/499xiwmTu74?list=PLyfEWMZU8iNbBLcp7lf5LaToGRjz6n7BB"></iframe>
                    </div>--%>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <FillData:clsLink location="8" runat="server" />
                <%--<h3 class="cat-tit-3"><span>Liên kết</span></h3>
                <ul class="list-unstyled lst">
                    <li><a href="#">Trang chủ DNTU</a></li>
                        <li><a href="#">Thông tin - Thư viện</a></li>
                        <li><a href="#">Phòng Đào tạo</a></li>
                        <li><a href="#">Ký túc xác</a></li>
                </ul>--%>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3">
                <h3 class="cat-tit-4"><span>Truy cập</span></h3>
                <ul class="list-unstyled visit">
                    <FillData:clsVisit runat="server" />
                    <%--<li><i class="fa fa-fw fa-spinner fa-pulse icon-2x"></i>
                        Đang online<span class="badge">438</span></li>
                    <li><i class="fa fa-fw fa-user icon-2x"></i>
                        Hôm nay<span class="badge">3.543</span></li>
                    <li><i class="fa fa-fw fa-calendar icon-2x"></i>
                        Hôm qua<span class="badge">4.315</span></li>
                    <li><i class="fa fa-fw fa-bar-chart icon-2x"></i>
                        Tất cả<span class="badge">239.654.342</span></li>--%>
                </ul>
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
<!--End home-info-->
<%--<div id="connect">
    <%--<FillData:clsEnterprise location="9" runat="server" />--%>
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