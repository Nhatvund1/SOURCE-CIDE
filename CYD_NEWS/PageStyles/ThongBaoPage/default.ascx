<%@ Control Language="C#" AutoEventWireup="true" CodeFile="default.ascx.cs" Inherits="PageStyles_ThongBaoPage_default" %>

<%@ Register TagPrefix="FillData" Namespace="FillData" %>
<header>
    <div id="top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 top-left">
                    <ul class="list-inline">
                        <FillData:clsTopMenu location="1" runat="server" />
                        <%--                        <li><a href="/">Trang chủ</a></li>
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
                        <img src="/images/logo.png" alt="Nội san Khoa học trường Đại học Công nghệ Đồng Nai" />
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
<div id="cat-detail">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-8">
                <div id="info">
                    <FillData:clsNewsContent runat="server" />
                    <%--<h3 class="cat-tit"><span>Tin tức</span></h3>
                    <h4>Bạn có quan tâm đến ngành công nghệ hóa học? điều gì đang chờ bạn phia trước?</h4>
                    <p class="sub-title"><i class="fa fa-fw fa-calendar"></i>Thứ 6, ngày 10/06/2016 <i class="fa fa-fw fa-clock-o"></i>14:54</p>
                    <div id="cat-detail-content">
                        <p>Ngành Điều đưỡng là một nghề nghiệp trong hệ thống y tế nhằm bảo vệ, chăm sóc, tối ưu về sức khỏe; dự phòng bệnh; xoa dịu nỗi đau qua chẩn đoán và điều trị.</p>
                        <p style="text-align: center;">
                            <img style="max-width: 80%;" src="images/dieu_duong.jpg" alt="Diều dưỡng" />
                        </p>
                        <p>Ngày nay, ngành điều dưỡng đã được công nhận là một nghề nghiệp độc lập, cùng cộng tác với các bác sỹ, dược sỹ, kỹ thuật viên và các thành phần trong hệ thống y tế để cung cấp dịch vụ chăm sóc sức khỏe cho cá nhân, gia đình, cộng đồng và xã hội, người làm nghề điều dưỡng gọi là điều dưỡng viên.</p>
                        <p>Điều dưỡng viên có các quyền và trách nhiệm nghề nghiệp được qui định trong luật hành nghề, đây cũng là một công cụ để giám sát trách nhiệm của người điều dưỡng trước cộng đồng, xã hội.</p>
                        <p>Để được làm việc trong nghề điều dưỡng thì người điều dưỡng phải có các giấy tờ hợp lệ được pháp luật thừa nhận (bằng cấp hay chứng chỉ hành nghề…). Điều dưỡng đã xây dựng cho mình một hệ thống học thuyết khoa học phong phú áp dụng vào chăm sóc người bệnh, nghiên cứu khoa học và nâng cao chất lượnggiáo dục nghề nghiệp.</p>
                        <p>Thực hành nghề điều dưỡng là các hoạt động cung cấp dịch vụ chăm sóc đến với “khách hàng” (hoặc người bệnh). Trong đó, người điều dưỡng xây dựng kế hoạch chăm sóc đối với từng người bệnh cụ thể bằng cách sử dụng quy trình điều dưỡng. Nó bao gồm nhiều bước dựa trên một quy trình khoa học ứng dụng các lý thuyết điều dưỡng, các kết quả của nghiên cứu khoa học trong lĩnh vực điều dưỡng và y học.</p>
                        <p>Các chuyên ngành điều dưỡng:</p>
                        <p>Hiện nay điều dưỡng được phát triển thành các lĩnh vực chuyên môn nhằm đáp ứng nhu cầu điều trị và chăm sóc cho người bệnh theo từng lĩnh vực chuyên sâu. Các trường đào tạo cũng đã xây dựng những chương trình đào tạo riêng biệt để đáp ứng nhu cầu về nguồn nhân lực cho từng lĩnh vực đó.</p>
                        <p>Hiện tại chương trình đào tạo điều dưỡng đa khoa là phổ biến nhất. Sau khi người điều dưỡng tốt nghiệp chương trình này có thể tham gia các khóa học đào tạo chuyên môn cho từng lĩnh vực để trở thành các điều dưỡng chuyên ngành như: điều dưỡng Răng hàm mặt, điều dưỡng gây mê hồi sức, điều dưỡng mắt…</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p style="text-align: right; font-style: italic;">TS Trần Thanh Đại</p>
                    </div>--%>
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <h3 class="cat-tit"><span>Tin khác</span></h3>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-12">
                        <ul class="lst-msg">
                            <FillData:clsOtherMsg runat="server" />
                            <%--<li><a href="#">
                                    <p class="msg-tit">Chưa bao giờ DNTU tự tin và mạnh mẽ như bây giờ</p>
                                </a>
                                    <p class="msg-date">26/4/2017</p>
                                </li>
                                <li><a href="#">
                                    <p class="msg-tit">Chưa bao giờ DNTU tự tin và mạnh mẽ như bây giờ</p>
                                </a>
                                    <p class="msg-date">26/4/2017</p>
                                </li>
                                <li><a href="#">
                                    <p class="msg-tit">Chưa bao giờ DNTU tự tin và mạnh mẽ như bây giờ</p>
                                </a>
                                    <p class="msg-date">26/4/2017</p>
                                </li>
                                <li><a href="#">
                                    <p class="msg-tit">Chưa bao giờ DNTU tự tin và mạnh mẽ như bây giờ</p>
                                </a>
                                    <p class="msg-date">26/4/2017</p>
                                </li>--%>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
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
    <div id="mm-connect" class="visible-xs visible-sm">
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

<script>
    $('a', '#info').click(function () {
        //if (!PDFObject.supportsPDFs){
        //    alert('Trình duyệt không hỗ trợ xem pdf');
        //    return false;
        //}
        var link = $(this).attr('href');
        var pdf = link.split('-').pop();
        if (pdf == 'pdf') {
            PDFObject.embed(link);
            return false;
        }
    })
</script>
