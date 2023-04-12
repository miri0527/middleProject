<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Contact Us</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.png">
	<c:import url="./template/common_css.jsp"></c:import>
</head>

<body>
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
	<c:import url="./template/header.jsp"></c:import>
    <!-- Body main wrapper start -->
    <div class="wrapper">

        

        <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80 section">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">Contact</h1>
                                <ul class="breadcrumb-list">
                                    <li><a href="index.html">Home</a></li>
                                    <li>Contact</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->

        <!-- Start page content -->
        <section id="page-content" class="page-wrapper section">

            <!-- ADDRESS SECTION START -->
            <div class="address-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="contact-address box-shadow">
                                <i class="zmdi zmdi-pin"></i>
                                <h6>서울특별시 금천구 가산동 가산디지털1로</h6>
                                <h6>3층 306호</h6>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="contact-address box-shadow">
                                <i class="zmdi zmdi-phone"></i>
                                <h6><a href="tel:0123456789">0123456789</a></h6>
                                <h6><a href="tel:0123456789">0123456789</a></h6>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="contact-address box-shadow">
                                <i class="zmdi zmdi-email"></i>
                                <h6>demo@example.com</h6>
                                <h6>demo@example.com</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ADDRESS SECTION END -->

            <!-- GOOGLE MAP SECTION START -->
            <div class="col-md-10 mx-auto mb-5">
            	<div class="mx-auto" id="map" style="width:1000px;height:400px;"></div>
            </div>
            <!-- GOOGLE MAP SECTION END -->
        </section>
        <!-- End page content -->

        <!-- START FOOTER AREA -->
        <footer id="footer" class="footer-area section">
            <div class="footer-top">
                <div class="container-fluid">
                    <div class="plr-185">
                        <div class="footer-top-inner gray-bg">
                            <div class="row">
                                <div class="col-xl-4 col-lg-5 col-md-5">
                                    <div class="single-footer footer-about">
                                        <div class="footer-logo">
                                            <img src="img/logo/logo.png" alt="">
                                        </div>
                                        <div class="footer-brief">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                industry. Lorem
                                                Ipsum has been the subas industry's standard dummy text ever since the
                                                1500s,
                                            </p>
                                            <p>When an unknown printer took a galley of type and If you are going to use
                                                a
                                                passage of Lorem Ipsum scrambled it to make.</p>
                                        </div>
                                        <ul class="footer-social">
                                            <li>
                                                <a class="facebook" href="" title="Facebook"><i
                                                        class="zmdi zmdi-facebook"></i></a>
                                            </li>
                                            <li>
                                                <a class="google-plus" href="" title="Google Plus"><i
                                                        class="zmdi zmdi-google-plus"></i></a>
                                            </li>
                                            <li>
                                                <a class="twitter" href="" title="Twitter"><i
                                                        class="zmdi zmdi-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a class="rss" href="" title="RSS"><i class="zmdi zmdi-rss"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xl-2 d-block d-xl-block d-lg-none d-md-none">
                                    <div class="single-footer">
                                        <h4 class="footer-title border-left">Shipping</h4>
                                        <ul class="footer-menu">
                                            <li>
                                                <a href="#"><i class="zmdi zmdi-circle"></i><span>New
                                                        Products</span></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="zmdi zmdi-circle"></i><span>Discount
                                                        Products</span></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="zmdi zmdi-circle"></i><span>Best Sell
                                                        Products</span></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="zmdi zmdi-circle"></i><span>Popular
                                                        Products</span></a>
                                            </li>
                                            <li>
                                                <a href="#"><i
                                                        class="zmdi zmdi-circle"></i><span>Manufactirers</span></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="zmdi zmdi-circle"></i><span>Suppliers</span></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="zmdi zmdi-circle"></i><span>Special
                                                        Products</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xl-2 col-lg-3 col-md-3">
                                    <div class="single-footer">
                                        <h4 class="footer-title border-left">my account</h4>
                                        <ul class="footer-menu">
                                            <li>
                                                <a href="my-account.html"><i class="zmdi zmdi-circle"></i><span>My
                                                        Account</span></a>
                                            </li>
                                            <li>
                                                <a href="wishlist.html"><i class="zmdi zmdi-circle"></i><span>My
                                                        Wishlist</span></a>
                                            </li>
                                            <li>
                                                <a href="cart.html"><i class="zmdi zmdi-circle"></i><span>My
                                                        Cart</span></a>
                                            </li>
                                            <li>
                                                <a href="login.html"><i class="zmdi zmdi-circle"></i><span>Sign
                                                        In</span></a>
                                            </li>
                                            <li>
                                                <a href="login.html"><i
                                                        class="zmdi zmdi-circle"></i><span>Registration</span></a>
                                            </li>
                                            <li>
                                                <a href="checkout.html"><i class="zmdi zmdi-circle"></i><span>Check
                                                        out</span></a>
                                            </li>
                                            <li>
                                                <a href="order.html"><i class="zmdi zmdi-circle"></i><span>Oder
                                                        Complete</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-4">
                                    <div class="single-footer">
                                        <h4 class="footer-title border-left">Get in touch</h4>
                                        <div class="footer-message">
                                            <form action="#">
                                                <input type="text" name="name" placeholder="Your name here...">
                                                <input type="text" name="email" placeholder="Your email here...">
                                                <textarea class="height-80" name="message"
                                                    placeholder="Your messege here..."></textarea>
                                                <button class="submit-btn-1 mt-20 btn-hover-1" type="submit">submit
                                                    message</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom black-bg">
                <div class="container-fluid">
                    <div class="plr-185">
                        <div class="copyright">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="copyright-text">
                                        <p class="copy-text"> © 2022 <strong>Subas</strong> Made With <i
                                                class="zmdi zmdi-favorite" style="color: red;" aria-hidden="true"></i>
                                            By <a class="company-name"
                                                href="#">
                                                <strong> SubasTeam</strong></a>.</p>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <ul class="footer-payment text-end">
                                        <li>
                                            <a href="#"><img src="img/payment/1.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="img/payment/2.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="img/payment/3.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="img/payment/4.jpg" alt=""></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- END FOOTER AREA -->

        <!--style-customizer start -->
        <div class="style-customizer closed">
            <div class="buy-button">
                <a href="index.html" class="customizer-logo"><img src="images/logo/logo.png" alt="Theme Logo"></a>
                <a class="opener" href="#"><i class="zmdi zmdi-settings"></i></a>
            </div>
            <div class="clearfix content-chooser">
                <h3>Layout Options</h3>
                <p>Which layout option you want to use?</p>
                <ul class="layoutstyle clearfix">
                    <li class="wide-layout selected" data-style="wide" title="wide"> Wide </li>
                    <li class="boxed-layout" data-style="boxed" title="boxed"> Boxed </li>
                </ul>
                <h3>Color Schemes</h3>
                <p>Which theme color you want to use? Select from here.</p>
                <ul class="styleChange clearfix">
                    <li class="skin-default selected" title="skin-default" data-style="skin-default"></li>
                    <li class="skin-green" title="green" data-style="skin-green"></li>
                    <li class="skin-purple" title="purple" data-style="skin-purple"></li>
                    <li class="skin-blue" title="blue" data-style="skin-blue"></li>
                    <li class="skin-cyan" title="cyan" data-style="skin-cyan"></li>
                    <li class="skin-amber" title="amber" data-style="skin-amber"></li>
                    <li class="skin-blue-grey" title="blue-grey" data-style="skin-blue-grey"></li>
                    <li class="skin-teal" title="teal" data-style="skin-teal"></li>
                </ul>
                <h3>Background Patterns</h3>
                <p>Which background pattern you want to use?</p>
                <ul class="patternChange clearfix">
                    <li class="pattern-1" data-style="pattern-1" title="pattern-1"></li>
                    <li class="pattern-2" data-style="pattern-2" title="pattern-2"></li>
                    <li class="pattern-3" data-style="pattern-3" title="pattern-3"></li>
                    <li class="pattern-4" data-style="pattern-4" title="pattern-4"></li>
                    <li class="pattern-5" data-style="pattern-5" title="pattern-5"></li>
                    <li class="pattern-6" data-style="pattern-6" title="pattern-6"></li>
                    <li class="pattern-7" data-style="pattern-7" title="pattern-7"></li>
                    <li class="pattern-8" data-style="pattern-8" title="pattern-8"></li>
                </ul>
                <h3>Background Images</h3>
                <p>Which background image you want to use?</p>
                <ul class="patternChange main-bg-change clearfix">
                    <li class="main-bg-1" data-style="main-bg-1" title="Background 1"> <img
                            src="images/customizer/bodybg/01.jpg" alt=""></li>
                    <li class="main-bg-2" data-style="main-bg-2" title="Background 2"> <img
                            src="images/customizer/bodybg/02.jpg" alt=""></li>
                    <li class="main-bg-3" data-style="main-bg-3" title="Background 3"> <img
                            src="images/customizer/bodybg/03.jpg" alt=""></li>
                    <li class="main-bg-4" data-style="main-bg-4" title="Background 4"> <img
                            src="images/customizer/bodybg/04.jpg" alt=""></li>
                    <li class="main-bg-5" data-style="main-bg-5" title="Background 5"> <img
                            src="images/customizer/bodybg/05.jpg" alt=""></li>
                    <li class="main-bg-6" data-style="main-bg-6" title="Background 6"> <img
                            src="images/customizer/bodybg/06.jpg" alt=""></li>
                    <li class="main-bg-7" data-style="main-bg-7" title="Background 7"> <img
                            src="images/customizer/bodybg/07.jpg" alt=""></li>
                    <li class="main-bg-8" data-style="main-bg-8" title="Background 8"> <img
                            src="images/customizer/bodybg/08.jpg" alt=""></li>
                </ul>
                <ul class="resetAll">
                    <li><a class="button button-border button-reset" href="#">Reset All</a></li>
                </ul>
            </div>
        </div>
        <!--style-customizer end -->
    </div>
    <!-- Body main wrapper end -->
	<!-- appkey=발급받은 APP KEY를 넣으시면 됩니다. -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b323b9b847b18172c6c8ad17e7c35602"></script>
	<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.478991044717546, 126.8815096340795), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		});
	</script>
    <!-- Placed JS at the end of the document so the pages load faster -->
	<c:import url="./template/common_js.jsp"></c:import>
    

</body>

</html>