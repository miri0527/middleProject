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
	<style type="text/css">
		#img {
			  width: 20%;
			  margin: auto;
			  display: block;
		}
		.entry-content {
			margin-top:40px;
		}
		
		@font-face {
		    font-family: 'Cafe24Ssurround';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		.h1 {
			font-family: 'Cafe24Ssurround';
			
		}
		#h1 {
			margin-top : 30px;
		}
		
		strong {
			font-size: 15px;
		}
		.p {
			margin-top : 10px;
			margin-left : 10px;
		}
	</style>
   
</head>

<body>
	<c:import url="../template/managerHeader.jsp"></c:import>	
      
  <c:import url="../template/common_js.jsp"></c:import>   
  
   <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80 section">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="breadcrumbs-inner">
                               <img alt="" src="/resources/js/img/logo/managerLogo.png" id="img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
          <!-- Start page content -->
        <section id="page-content" class="page-wrapper section">

            <!-- ABOUT SECTION START -->	
            <div class="about-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title text-start ">
                                <h2 class="uppercase">about admin</h2>
                                <p>쇼핑몰 링크몰 Admin은 관리자가 구성원 및 보안, 환경설정 등 전반적인 회사 계정을 관리할 수 있는 운영도구입니다</p>
                                <p>IT전문가가 아닌 관리자도 쉽게 사용할 수 있습니다</p>
                               
                               
                            </div>
                        </div>
                    </div>                    
                    <div class="entry-content">
                    	<h1 class="h1">
                    		<span class="ez-toc-section" id="i"></span>
                    		관리자의 역할
                    		<span class="ez-toc-section end"></span>
                    	</h1>
                    	<p>
                    		관리자란 쇼핑몰 링크몰 회사 계정을 개설한 사용자이며, 나중에 변경하거나 추가할 수 있습니다. Admin은 관리자만 접근할 수 있으며, 각 회사의
                    		상황에 맞게 회사 계정과 서비스 환경을 설정할 수 있습니다
                    	</p>
                    	<p>
                    		<img class="alignnone size-full wp-image-78511" alt="" src="">
                    		내가 관리자가 맞긴한데 , 무엇부터 해아할 지 고민이신가요? 관리자를 위한 시작에서 step-by-step 가이드를 확인해보세요
                    	</p>
                    	<h1 class="h1" id="h1">
                    		<span class="ez-toc-section" id="i-2"></span>
                    		Admin에서 무엇을 할 수 있나요?
                    	</h1>
                    	<p class="p">
                    		<strong>#기본 환경 설정</strong>
                    	</p>
                    	<p>
                    		회사정보에서 회사의 기본 정보를 수정할 수 있습니다, 또한 회사 로고의 색상을 설정하여 조직의 소속감을 높일 수 있습니다
                    	</p>
                    	<p class="p">
                    		<strong>#조직 및 구성원 관리</strong>
                    	</p>
                    	<p>
                    		링크몰을 처음 사용하거나, 조직 또는 새로운 구성원이 생겼을 때 조직도에서 조직을 추가 하거나 구성원을 추가할 수 있습니다<br>
                    		또한 필요에 따라 조직삭제와 구성원 삭제도 가능합니다
                    	</p>
                    	<p class="p">
                    		<strong>#서비스 관리</strong>
                    	</p>
                    	<p>
                    		메세지 외부 연동 설정, 게시판의 파일 용량 제한, 메일의 파일 다운로드 기간 설정 등 서비스별 세부 설정을 관리할 수 있습니다
                    	</p>
                    	<p class="p">
                    		<strong>#보안관리</strong>
                    	</p>
                    	<p>
                    		회사정보를 안전하게 관리할 수 있도록 다양한 보안 	기능을 설정할 수 있습니다<br>
                    		구성원의 접속 현황과 활동 내역을 확인 할 수 있고 필요시 적절한 조취를 취할 수도 있습니다. 회사 정보에 접속한 기기를 확인할 수 있고<br>
                    		메일,메세지,드라이브의 특정 활동을 모니터링하여 정보 유출을 예방할 수 있습니다
                    	</p>
                    </div>
                </div>
            </div>
            <!-- ABOUT SECTION END --> 

          
            <!-- TEAM SECTION END -->             
        </section>
        <!-- End page content -->
  
  
  
  <c:import url="../template/managerFooter.jsp"></c:import>
  

    
</body>
</html>