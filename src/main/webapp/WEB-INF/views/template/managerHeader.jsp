<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <title>Home</title>
	 <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Subas || Home-3</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:import url="../template/common_css.jsp"></c:import>

   
</head>

<body>
		  <!-- START HEADER AREA -->
        <header class="header-area header-wrapper">
            <!-- header-top-bar -->
            <div class="header-top-bar plr-185">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 d-none d-md-block">
                            <div class="call-us">
                                <p class="mb-0 roboto">0123456789</p>
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
                                        <a href="/cart/cartList">
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
                                        <a href="wishlist.html">
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
                                    <a href="/manager/home">
                                        <img src="/resources/js/img/logo/logo.png" alt="main logo">
                                    </a>
                                </div>
                            </div>
                            <!-- primary-menu -->
                            <div class="col-lg-8 d-none d-lg-block">
                                <nav id="primary-menu">
                                    <ul class="main-menu text-center">
                                    
                                    	<li><a href="/manager/home">Admin소개</a>
                                    	
                                    	</li>
                                        <li><a href="/manager/memberList">회원리스트</a>
                                          
                                        </li>
                                        <li class="mega-parent"><a href="/manager/productList">상품리스트</a>
                                         
                                        </li>
                                        <li class="mega-parent"><a href="/manager/cartList">구매리스트</a>
                        
                                        </li>
                                        <li class="mega-parent"><a href="/product/add">상품등록</a>
                         
                                        </li>
                               
                                        <li>
                                            <a href="/qna/listdetail">QNA</a>
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
        <!-- START MOBILE MENU AREA -->
        <div class="mobile-menu-area d-block d-lg-none section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="mobile-menu">
                            <nav id="dropdown">
                                <ul>
                                    <li><a href="/manager/memberList">회원리스트</a>
                                       
                                    </li>
                                    <li>
                                        <a href="/manager/productList">상품리스트</a>
                                    </li>
                                    <li><a href="/manager/cartList">구매리스트</a>
                                     
                                 
                                    </li>
                                    <li><a href="/product/add">상품등록</a>
                             
                                    </li>
                                    <li>
                                        <a href="about.html">공지사항</a>
                                    </li>
                                    <li>
                                        <a href="contact.html">QNA</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MOBILE MENU AREA -->
      
  <c:import url="../template/common_js.jsp"></c:import>   