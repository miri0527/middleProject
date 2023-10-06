<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <div class="wrapper">

        <!-- START HEADER AREA -->
        <header class="header-area header-wrapper">
            <!-- header-top-bar -->
            <div class="header-top-bar plr-185">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 d-none d-md-block">
                            <div class="call-us">
                                <p class="mb-0 roboto"></p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="top-link clearfix">
                                <ul class="link f-right">
                                    
                                    	<c:choose>
                                    		<c:when test="${empty member}">
                                    	<li>
                                    	<a href="/member/memberAgree">
                                            <i class="zmdi zmdi-account-o"></i>
                                           	Join
                                        </a>
                                        </li>
                                        <li>
                                        <a href="/member/memberLogin">
                                            <i class="zmdi zmdi-favorite"></i>
                                            Wish List (0)
                                        </a>
                                    </li>
                                        <li>
                                        <a href="/member/memberLogin">
                                            <i class="zmdi zmdi-lock-open"></i>
                                            Login
                                        </a>
                                    </li>
                                        </c:when>
                                        <c:otherwise>
                                        <li>
                                       	 <a href="/member/memberDetail">
                                            <i class="zmdi zmdi-account"></i>
                                            My Account
                                        </a>
                                        </li>
                                        <li>
                                        <a href="/cart/cartList">
                                            <i class="zmdi zmdi-favorite"></i>
                                            Wish List (0)
                                        </a>
                                    </li>
                                        <li>
                                        <a href="/member/memberLogout">
                                            <i class="zmdi zmdi-lock"></i>
                                            Logout
                                        </a>
                                        	
                                        
                                        </li>
                                        </c:otherwise>
                                        </c:choose>
                                    
                                    
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- header-middle-area -->
            <div class="header-middle-area plr-185">
                <div class="container-fluid">
                    <div class="full-width-mega-dropdown">
                        <div class="row">
                            <!-- logo -->
                            <div class="col-lg-2 col-md-4">
                                <div class="logo">
                                    <a href="/">
                                        <img src="/resources/js/img/logo/logo.png" alt="main logo">
                                    </a>
                                </div>
                            </div>
                            <!-- primary-menu -->
                            <div class="col-lg-8 d-none d-lg-block">
                                <nav id="primary-menu">
                                    <ul class="main-menu text-center">
                                        <li><a href="">전체카테고리</a>
                                            <ul class="dropdwn">
                                              
                                                <li>
                                                    <a href="/product/list?categoryNum=1">카레고리 1 컴퓨터 </a>
                                                </li>
                                                <li>
                                                    <a href="/product/list?categoryNum=2">카테고리 2 노트북</a>
                                                </li>
                                                <li>
                                                    <a href="/product/list?categoryNum=3">카테고리 3 모니터</a>
                                                </li>
                                                <li>
                                                    <a href="/product/list?categoryNum=4">카테고리 4 휴대폰</a>
                                                </li>
                                                <li>
                                                    <a href="/product/list?categoryNum=5">카테고리 5 TV </a>
                                                </li>
                                                <li>
                                                    <a href="/product/list?categoryNum=6">카테고리 6 냉장고 </a>
                                                </li>
                                                <li>
                                                    <a href="/product/list?categoryNum=7">카테고리 7 에어컨</a>
                                                </li>
                                                <li>
                                                    <a href="/product/list?categoryNum=8">카테고리 8 공기청정기</a>
                                                </li>
                                       
                                            </ul>
                                        </li>

                                        <li class="mega-parent"><a href="/product/detail?productNum=1">Products</a>
                                        </li>
                                        
                                         <li>
                                            <a href="/notice/list">NOTICE</a>
                                        </li>
                                      
                                        <li class="mega-parent"><a href="/qna/listdetail">Qna</a>
                                        </li>
                                        <li><a a href="/review/listdetail">Review</a>
                                        </li>
                                        <!-- <li>
                                            <a href="about.html">About us</a>
                                        </li> -->
                                        <li>
                                            <a href="/contact">Contact</a>
                                        </li>
                                        
                                    </ul>
                                </nav>
                            </div>
                            <!-- header-search & total-cart -->
                            <div class="col-lg-2 col-md-8">
                                <div class="search-top-cart  f-right">
                                    <!-- header-search -->
                                    <div class="header-search f-left">
            
                                        </div>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- END HEADER AREA -->