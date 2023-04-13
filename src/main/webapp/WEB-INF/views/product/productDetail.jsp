<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>상품 상세 페이지 </title>
            <c:import url="../template/common_css.jsp"></c:import>
            <style>
                .row {
                    display: flex;
                    align-items: center;
                }

                .pro-price {
                    border: none;
                    background: transparent;
                    font-size: 24px;
                    font-weight: bold;
                    color: #333;
                }

                .row span {
                    margin-left: 5px;
                    font-size: 16px;
                    color: #999;
                }

                /* ...a bunch of other CSS... */
                /* Now do one of the following options */
                /* GREATER SPECIFICITY - SMALL increase, 0 0 2 3 */

                ul.pagination>li>a:focus,
                ul.pagination>li>a:hover,
                ul.pagination>li>span:focus,
                ul.pagination>li>span:hover {
                    background-color: orange;
                    color: white;
                }

                .pagination>li>a {
                    background-color: white;
                    color: orange;
                }

                .pagination>li>a:focus,
                .pagination>li>a:hover,
                .pagination>li>span:focus,
                .pagination>li>span:hover {
                    color: orange;
                    background-color: #eee;
                    border-color: #ddd;
                }

                .pagination>.active {
                    color: white;
                    background-color: orange;
                    border: solid 1px orange;
                }

                .pagination>.active>a:hover {
                    background-color: orange;
                    border: solid 1px orange;
                }

                .pagination .page-item.active .page-link {
                    background-color: orange;
                    border-color: orange;
                }

                .pagination a.active {
                    background-color: orange;
                    color: white;
                    border: solid 1px orange;
                }
            </style>
        </head>

        <body>
            <c:import url="../template/header.jsp"></c:import>
            <c:import url="../template/mobileheader.jsp"></c:import>
            <!-- BREADCRUMBS SETCTION START -->
            <div class="breadcrumbs-section plr-200 mb-80 section text-center">
                <img src="/resources/js/img/others/ad.png" alt="" class="mx-auto">
            </div>


            <!-- BREADCRUMBS SETCTION END -->

            <!-- Start page content -->
            <section id="page-content" class="page-wrapper section">

                <!-- SHOP SECTION START -->
                <div class="shop-section mb-80">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9">
                                <!-- single-product-area start -->
                                <div class="single-product-area mb-80">
                                    <div class="row">
                                        <!-- imgs-zoom-area start -->
                                        <div class="col-lg-5">
                                            <div class="imgs-zoom-area">
                                                <div>
                                                    <c:forEach items="${dto.productImgDTOs}" var="productImgDTO">
                                                        <img id="zoom_03"
                                                            src="../resources/upload/product/${productImgDTO.fileName}"
                                                            height="270" width="450" />
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- imgs-zoom-area end -->
                                        <!-- single-product-info start -->
                                        <div class="col-lg-7">
                                            <div class="single-product-info">
                                                <form action="../cart/cartAdd" method="post">

                                                    <c:set var="loop_flag" value="false" />
                                                    <c:forEach items="${dto.productOptionDTOs}" var="productOptionDTO">
                                                        <c:if test="${not loop_flag}">

                                                            <h3 class="text-black-1">${dto.productName} </h3>
                                                            <h6 class="brand-name-2">brand name</h6>
                                                            <!--  hr -->
                                                            <hr>
                                                            <!-- single-pro-color-rating -->
                                                            <div class="single-pro-color-rating clearfix">
                                                                <div>
                                                                    <p>상품옵션</p>
                                                                    <div class="pro-rating sin-pro-rating f-right">
                                                                        <a href="#" tabindex="0"><i
                                                                                class="zmdi zmdi-star"></i></a>
                                                                        <a href="#" tabindex="0"><i
                                                                                class="zmdi zmdi-star"></i></a>
                                                                        <a href="#" tabindex="0"><i
                                                                                class="zmdi zmdi-star"></i></a>
                                                                        <a href="#" tabindex="0"><i
                                                                                class="zmdi zmdi-star-half"></i></a>
                                                                        <a href="#" tabindex="0"><i
                                                                                class="zmdi zmdi-star-outline"></i></a>
                                                                        <span class="text-black-5">( 27 Rating )</span>
                                                                    </div>
                                                                    <div id="depth0">
                                                                        <select class="form-select"
                                                                            aria-label="Default select example"
                                                                            id="selectForm1">
                                                                            <c:if test="${productOptionDTO.depth eq 0}">
                                                                                <option selected>
                                                                                    ${productOptionDTO.optionName}
                                                                                </option>
                                                                            </c:if>
                                                                            <c:forEach items="${dto.productOptionDTOs}"
                                                                                var="productOptionDTO">
                                                                                <c:if
                                                                                    test="${productOptionDTO.depth eq 0}">
                                                                                    <option
                                                                                        value="${productOptionDTO.optionNum}"
                                                                                        data-productnum="${productOptionDTO.productNum}"
                                                                                        id="option">
                                                                                        ${productOptionDTO.optionValue}
                                                                                    </option>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <!-- hr -->
                                                            <hr>
                                                            <!-- plus-minus-pro-action -->
                                                            <div class="plus-minus-pro-action clearfix">
                                                                <div class="sin-plus-minus f-left clearfix">
                                                                    <p class="color-title f-left">구매수량</p>
                                                                    <div class="cart-plus-minus f-left" id="qtybutton">
                                                                        <!-- <input type="text" value="02" id="inputQuantity" name="productEa" name="qtybutton" class="cart-plus-minus-box"> -->
                                                                        <input class="cart-plus-minus-box"
                                                                            id="inputQuantity" name="productEa"
                                                                            type="num" value="0"
                                                                            style="max-width: 3rem" />
                                                                    </div>
                                                                </div>
                                                                <div class="sin-pro-action f-right">
                                                                    <ul class="action-button">
                                                                        <li>
                                                                            <a href="#" title="Wishlist" tabindex="0"><i
                                                                                    class="zmdi zmdi-favorite"></i></a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="#" data-bs-toggle="modal"
                                                                                data-bs-target="#productModal"
                                                                                title="Quickview" tabindex="0"><i
                                                                                    class="zmdi zmdi-zoom-in"></i></a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="#" title="Compare" tabindex="0"><i
                                                                                    class="zmdi zmdi-refresh"></i></a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="#" title="Add to cart"
                                                                                tabindex="0"><i
                                                                                    class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <!-- plus-minus-pro-action end -->
                                                            <!-- hr -->
                                                            <hr>
                                                            <!-- single-product-price -->
                                                            <!-- <div class="row"><input type="text" id="totalPrice" name="totalPrice" value="5000" class="pro-price"readonly>원</div> -->


                                                            <input type="text" id="totalPrice" name="totalPrice"
                                                                value="0" class="pro-price" readonly
                                                                style="width:175px;">
                                                            원


                                                            <!--  hr -->
                                                            <hr>


                                                            <button class="btn btn-outline-dark flex-shrink-0"
                                                                type="submit" id="btn">
                                                                <i class="bi-cart-fill me-1"></i>
                                                                Add to cart
                                                               
                                                            </button>
                                                            
                                                            <c:if test="${not empty member.id and dto.id eq member.id}">
                                                            <c:choose>
                                                            	<c:when test="${not empty dto.productOptionDTOs[0].optionNum}">
                                                            		<a href="./productOptionUpdate?productNum=${dto.productNum}" class="btn btn-outline-dark flex-shrink-0">옵션 수정</a>
                                                            	</c:when>
                                                            	<c:otherwise>
                                                            		<a href="./productOptionAdd?productNum=${dto.productNum}" class="btn btn-outline-dark flex-shrink-0">옵션 추가</a>
                                                            	</c:otherwise>
                                                            </c:choose>
                                                            </c:if>
                                                            <a href="../../qna/add?productNum=${dto.productNum}">
                                                                <button class="btn btn-outline-dark flex-shrink-0"
                                                                    type="button">

                                                                    <i class="bi-cart-fill me-1"></i>
                                                                    리뷰 작성

                                                                </button>
                                                            </a>
                                                            <a href="../../review/add?productNum=${dto.productNum}">
                                                                <button class="btn btn-outline-dark flex-shrink-0"
                                                                    type="button">

                                                                    <i class="bi-cart-fill me-1"></i>
                                                                    QNA 작성

                                                                </button>
                                                            </a>
                                                            <c:set var="loop_flag" value="true" />

                                                        </c:if>
                                                    </c:forEach>
                                                    <div id="cartform">
                                                        <input type="text" class="form-control" id="id" name="id"
                                                            value="${member.id}" readonly>
                                                        <input type="text" class="form-control" id="productNum"
                                                            name="productNum" value="${dto.productNum}" readonly>

                                                    </div>
                                                    <!-- single-product-info end -->
                                                </form>
                                            </div>
                                        </div>
                                        <!-- single-product-tab -->
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <!-- hr -->
                                                <hr>
                                                <div class="single-product-tab reviews-tab">
                                                    <ul class="nav mb-20">
                                                        <li><a class="active" href="#description"
                                                                data-bs-toggle="tab">Description</a></li>
                                                        <li><a href="#reviews" data-bs-toggle="tab">Reviews</a></li>
                                                        <li><a href="#information" data-bs-toggle="tab">Qna</a></li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div role="tabpanel" class="tab-pane active show"
                                                            id="description">
                                                            <p>만족스러운 성능과 가성비로 수 년째 인기를 이어가고 있는 스테디셀러 게이밍 모니터이다. 대부분 게이밍
                                                                모니터가 갖고 있는 144Hz 주사율을 넘어 165Hz 고주사율을 실현했다. 1초에 165프레임의
                                                                이미지를 표현하므로 일반 모니터는 말할 것도 없고 144Hz 게이밍 모니터보다 화면 움직임이 한결
                                                                부드럽다. </p>
                                                            <p>레이싱 게임에서는 배경이 자연스럽게 이동하며, MOBA나 RPG 등의 게임에서는 상하좌우 스크롤이
                                                                매끄럽게 이어진다. 특히 화면 갱신 속도가 높은 탓에 1인칭 슈팅 게임에서는 적의 움직임을 빠르게
                                                                알아챌 수 있다. 여기에 1ms(OD)에 불과한 응답속도를 구현함으로써 잔상을 최소화했다. 화면 속
                                                                사물이 선명하고 또렷하게 나타난다. 그래픽카드가 출력하는 프레임과 모니터의 재생빈도가 엇갈리며
                                                                발생하는 화면찢김 현상을 제거하기 위해 AMD 프리싱크 기술을 탑재했다.</p>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane" id="reviews">
                                                            <!-- reviews-tab-desc -->

                                                            <c:forEach items="${list1}" var="dto1" varStatus="index1">
                                                                <div class="reviews-tab-desc">
                                                                    <!-- single comments -->
                                                                    <div class="media mt-30">
                                                                        <c:choose>
                                                                            <c:when test="${index1.index%2 eq 1}">
                                                                                <div class="media-left">
                                                                                    <a href="#"><img
                                                                                            class="media-object"
                                                                                            src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDlfMjI5%2FMDAxNjI1ODExOTExNDI3.gvYo9qbHCJYYHCvdQYJCvLgbAUtV4VYB-jymATd8vxMg.3fH0kLPgTQbbmIqS568PscVkz9ijXFEeAyW7ouvpO6kg.PNG.jangduk2011%2F4087E937-A915-4645-8E5B-B5F363875BD9.png&type=sc960_832"
                                                                                            height="80" width="80"
                                                                                            alt="#"></a>
                                                                                </div>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <div class="media-left">
                                                                                    <a href="#"><img
                                                                                            class="media-object"
                                                                                            src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTEyMjVfNjMg%2FMDAxNTc3MjcwMjc0OTEy.LTtu4ufCy-VO4L7MLOOnOuvRKtqB6r2De9Gvh4z7Vq4g.nYN3uaB6teH3PrGhdeb_XLVD75-MHkurbjUGfsxSk9kg.JPEG.dms7568%2FIMG_2318.jpg&type=sc960_832"
                                                                                            height="80" width="80"
                                                                                            alt="#"></a>
                                                                                </div>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <div class="media-body">
                                                                            <div class="clearfix">
                                                                                <div class="name-commenter pull-left">
                                                                                    <h6 class="media-heading"><a
                                                                                            href="#">${dto1.id}
                                                                                            ${dto1.num}</a></h6>
                                                                                    <p class="mb-10">
                                                                                    </p>
                                                                                </div>
                                                                                  <c:if test="${member.id eq dto1.id}">
                                                                                    <div class="pull-right">
                                                                                        <ul class="reply-delate">
                                                                                            <li><a href="#"></a></li>
                                                                                            <li>
                                                                                                <a class="btn btn-outline-warning"
                                                                                                    href="/review/update?num=${dto1.num}">update</a>
                                                                                            </li>
                                                                                            <li>
                                                                                                <form
                                                                                                    action="/review/delete"
                                                                                                    method="post"
                                                                                                    id="frmde">
                                                                                                    <input type="hidden"
                                                                                                        name="num"
                                                                                                        value="${dto1.num}">
                                                                                                    <input type="hidden"
                                                                                                        name="productNum"
                                                                                                        value="${dto.productNum}">
                                                                                                    <button
                                                                                                        type="submit"
                                                                                                        class="btn btn-outline-warning">DELETE</button>
                                                                                                </form>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                  </c:if>
                                                                            </div>
                                                                            <p class="mb-0">${dto1.contents}</p>
                                                                        </div>-
                                                                    </div>

                                                                </div>
                                                            </c:forEach>
                                                            <!-- paging -->
                                                            <div class="row">
                                                                <nav aria-label="Page navigation example" class="">
                                                                    <div class="offset-md-5 col-md-5">
                                                                        <ul class="pagination orange mx-auto">
                                                                            <li class="page-item">
                                                                                <a class="page-link" href="#"
                                                                                    aria-label="Previous"
                                                                                    data-board-page="1">
                                                                                    <!--==page=1 -->

                                                                                    <span
                                                                                        aria-hidden="true">&laquo;</span>
                                                                                </a>
                                                                            </li>
                                                                            <li
                                                                                class="page-item ${pager.before ? 'disabled' : ''}">
                                                                                <a class="page-link" href="#"
                                                                                    aria-label="Previous"
                                                                                    data-board-page="${pager.startNum-1}">
                                                                                    <span
                                                                                        aria-hidden="true">&lsaquo;</span>
                                                                                    <!--lsaquo는 꺽쇠 하나 laquo는 꺽쇠 두개  -->
                                                                                </a>
                                                                            </li>
                                                                            <c:forEach begin="${pager.startNum}"
                                                                                end="${pager.lastNum}" var="i">
                                                                                <li class="page-item"><a
                                                                                        class="page-link ${pager.page eq i ? 'active' : '' }"
                                                                                        href="#"
                                                                                        data-board-page="${i}">${i}</a>
                                                                                </li>
                                                                            </c:forEach>
                                                                            <!-- &gt = <꺽쇠를 표현 &lt는 >꺽쇠를 표현 -->
                                                                            <li
                                                                                class="page-item ${pager.after eq false ? 'disabled' : ''}">
                                                                                <!--  -->
                                                                                <a class="page-link " href="#"
                                                                                    aria-label="Next"
                                                                                    data-board-page="${pager.lastNum+1}">
                                                                                    <span
                                                                                        aria-hidden="true">&rsaquo;</span>
                                                                                </a>
                                                                            </li>
                                                                            <li class="page-item "> <!--  -->
                                                                                <a class="page-link " href="#"
                                                                                    aria-label="Next"
                                                                                    data-board-page="${pager.totalPage}">
                                                                                    <span
                                                                                        aria-hidden="true">&raquo;</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </nav>

                                                            </div>
                                                            <!-- 검색창 -->
                                                            <form class="row g-3" action="./detail" method="get"
                                                                id="searchForm">
                                                                <input type="hidden" name="page" value="1" id="page">
                                                                <input type="hidden" name="productNum"
                                                                    value="${dto.productNum}" id="productNum">
                                                                <div class="col-auto">
                                                                    <label for="kind"
                                                                        class="visually-hidden">Kind</label>
                                                                    <select class="form-select" name="kind" id="kind"
                                                                        aria-label="Default select example">

                                                                        <option value="contents" ${pager.kind
                                                                            eq 'contents' ? 'selected' : '' }>상품이름
                                                                        </option>
                                                                        <option value="id" ${pager.kind eq 'id'
                                                                            ? 'selected' : '' }>상품이름</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <label for="Search"
                                                                        class="visually-hidden">Search</label>
                                                                    <input type="text" class="form-control"
                                                                        name="search" id="search" placeholder="검색어 입력"
                                                                        value="${pager.search}">
                                                                </div>
                                                                <div class="col-auto">
                                                                    <button type="submit"
                                                                        class="btn btn-warning mb-3">검색</button>
                                                                </div>
                                                            </form>
                                                        </div>

                                                        <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        QNA        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                                                        <div role="tabpanel" class="tab-pane" id="information">
                                                            <c:forEach items="${list2}" var="dto2" varStatus="index1">
                                                                <div class="card mb-15">
                                                                    <div class="card-header" role="tab"
                                                                        id="heading${dto2.num}">
                                                                        <h4 class="panel-title">
                                                                            <a role="button" data-bs-toggle="collapse"
                                                                                data-bs-parent="#accordion"
                                                                                href="#collapse${dto2.num}"
                                                                                aria-expanded="false"
                                                                                aria-controls="collapse${dto2.num}"
                                                                                class="collapsed">

                                                                                <div class="row">

                                                                                    <div class="col-md-6 float-left">
                                                                                        [문의] ${dto2.title} ${dto2.num}
                                                                                    </div>
                                                                                    <c:forEach items="${list3}"
                                                                                        var="dto3" varStatus="index1">
                                                                                       
                                                                                          <c:if test="${dto3.num eq dto2.num}">
                                                                                            <div
                                                                                                class="col-md-6 d-flex justify-content-end">

                                                                                                <i class="zmdi zmdi-check zmdi-hc-lg"></i>

                                                                                            </div>
                                                                                           </c:if>
                                                                                    </c:forEach>
                                                                                </div>

                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse${dto2.num}" class="collapse"
                                                                        data-bs-parent="#accordion"
                                                                        aria-labelledby="heading${dto2.num}">
                                                                        <div class="card-body">
                                                                            <i
                                                                                class="zmdi zmdi-comment-outline zmdi-hc-2x mdc-text-amber"></i>
                                                                            질문
                                                                            <p> 작성자 : ${dto2.id}</p>
                                                                            <p>${dto2.contents}</p>
                                                                        </div>
                                                                        <div class="card-body">
                                                                            <c:forEach items="${list3}" var="dto3"
                                                                                varStatus="index1">
                                                                                <c:if test="${dto3.num eq dto2.num}">

                                                                                    <li><i
                                                                                            class="zmdi zmdi-comment-alt-text zmdi-hc-2x mdc-text-amber"></i>
                                                                                        답변 </li>
                                                                                    <p>${dto3.title} </p>
                                                                                    <p>${dto3.contents}</p>
                                                                                    <p>${dto3.regDate}</p>

                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--  hr -->
                                                <hr>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-area end -->
                                <div class="related-product-area">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="section-title text-start mb-40">
                                                <h2 class="uppercase">추천 상품 둘러보기</h2>
                                                <h6>이 상품을 구매한 고객들이 자주 봤던 상품이에요</h6>
                                            </div>
                                            <div class="active-related-product">
                                                <div class="product-item">
                                                    <div class="product-img">
                                                        <a href="single-product.html">
                                                            <img src="img/product/1.jpg" alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <h6 class="product-title">
                                                            <a href="single-product.html">Product Name</a>
                                                        </h6>
                                                        <div class="pro-rating">
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                                                        </div>
                                                        <h3 class="pro-price">$ 869.00</h3>
                                                        <ul class="action-button">
                                                            <li>
                                                                <a href="#" title="Wishlist"><i
                                                                        class="zmdi zmdi-favorite"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" data-bs-toggle="modal"
                                                                    data-bs-target="#productModal" title="Quickview"><i
                                                                        class="zmdi zmdi-zoom-in"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Compare"><i
                                                                        class="zmdi zmdi-refresh"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Add to cart"><i
                                                                        class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="product-item">
                                                    <div class="product-img">
                                                        <a href="single-product.html">
                                                            <img src="img/product/1.jpg" alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <h6 class="product-title">
                                                            <a href="single-product.html">Product Name</a>
                                                        </h6>
                                                        <div class="pro-rating">
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                                                        </div>
                                                        <h3 class="pro-price">$ 869.00</h3>
                                                        <ul class="action-button">
                                                            <li>
                                                                <a href="#" title="Wishlist"><i
                                                                        class="zmdi zmdi-favorite"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" data-bs-toggle="modal"
                                                                    data-bs-target="#productModal" title="Quickview"><i
                                                                        class="zmdi zmdi-zoom-in"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Compare"><i
                                                                        class="zmdi zmdi-refresh"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Add to cart"><i
                                                                        class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="product-item">
                                                    <div class="product-img">
                                                        <a href="single-product.html">
                                                            <img src="img/product/1.jpg" alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <h6 class="product-title">
                                                            <a href="single-product.html">Product Name</a>
                                                        </h6>
                                                        <div class="pro-rating">
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                                                        </div>
                                                        <h3 class="pro-price">$ 869.00</h3>
                                                        <ul class="action-button">
                                                            <li>
                                                                <a href="#" title="Wishlist"><i
                                                                        class="zmdi zmdi-favorite"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" data-bs-toggle="modal"
                                                                    data-bs-target="#productModal" title="Quickview"><i
                                                                        class="zmdi zmdi-zoom-in"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Compare"><i
                                                                        class="zmdi zmdi-refresh"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Add to cart"><i
                                                                        class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="product-item">
                                                    <div class="product-img">
                                                        <a href="single-product.html">
                                                            <img src="img/product/1.jpg" alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <h6 class="product-title">
                                                            <a href="single-product.html">Product Name</a>
                                                        </h6>
                                                        <div class="pro-rating">
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                                            <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                                                        </div>
                                                        <h3 class="pro-price">$ 869.00</h3>
                                                        <ul class="action-button">
                                                            <li>
                                                                <a href="#" title="Wishlist"><i
                                                                        class="zmdi zmdi-favorite"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" data-bs-toggle="modal"
                                                                    data-bs-target="#productModal" title="Quickview"><i
                                                                        class="zmdi zmdi-zoom-in"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Compare"><i
                                                                        class="zmdi zmdi-refresh"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="#" title="Add to cart"><i
                                                                        class="zmdi zmdi-shopping-cart-plus"></i></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <!-- widget-search -->
                                <aside class="widget-search mb-30">
                                    <form action="#">
                                        <input type="text" placeholder="Search here...">
                                        <button type="submit"><i class="zmdi zmdi-search"></i></button>
                                    </form>
                                </aside>
                                <!-- widget-categories -->
                                <aside class="widget widget-categories box-shadow mb-30">
                                    <h6 class="widget-title border-left mb-20">Categories</h6>
                                    <div id="cat-treeview" class="product-cat">
                                        <ul>
                                            <li class="closed"><a href="#">Brand One</a>
                                                <ul>
                                                    <li><a href="#">Mobile</a></li>
                                                    <li><a href="#">Tab</a></li>
                                                    <li><a href="#">Watch</a></li>
                                                    <li><a href="#">Head Phone</a></li>
                                                    <li><a href="#">Memory</a></li>
                                                </ul>
                                            </li>
                                            <li class="open"><a href="#">Brand Two</a>
                                                <ul>
                                                    <li><a href="#">Mobile</a></li>
                                                    <li><a href="#">Tab</a></li>
                                                    <li><a href="#">Watch</a></li>
                                                    <li><a href="#">Head Phone</a></li>
                                                    <li><a href="#">Memory</a></li>
                                                </ul>
                                            </li>
                                            <li class="closed"><a href="#">Accessories</a>
                                                <ul>
                                                    <li><a href="#">Footwear</a></li>
                                                    <li><a href="#">Sunglasses</a></li>
                                                    <li><a href="#">Watches</a></li>
                                                    <li><a href="#">Utilities</a></li>
                                                </ul>
                                            </li>
                                            <li class="closed"><a href="#">Top Brands</a>
                                                <ul>
                                                    <li><a href="#">Mobile</a></li>
                                                    <li><a href="#">Tab</a></li>
                                                    <li><a href="#">Watch</a></li>
                                                    <li><a href="#">Head Phone</a></li>
                                                    <li><a href="#">Memory</a></li>
                                                </ul>
                                            </li>
                                            <li class="closed"><a href="#">Jewelry</a>
                                                <ul>
                                                    <li><a href="#">Footwear</a></li>
                                                    <li><a href="#">Sunglasses</a></li>
                                                    <li><a href="#">Watches</a></li>
                                                    <li><a href="#">Utilities</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </aside>
                                <!-- operating-system -->
                                <aside class="widget operating-system box-shadow mb-30">
                                    <h6 class="widget-title border-left mb-20">operating system</h6>
                                    <form action="action_page.php">
                                        <label><input type="checkbox" name="operating-1" value="phone-1">Windows
                                            Phone</label><br>
                                        <label><input type="checkbox" name="operating-1" value="phone-1">Bleckgerry
                                            ios</label><br>
                                        <label><input type="checkbox" name="operating-1"
                                                value="phone-1">Android</label><br>
                                        <label><input type="checkbox" name="operating-1" value="phone-1">ios</label><br>
                                        <label><input type="checkbox" name="operating-1" value="phone-1">Windows
                                            Phone</label><br>
                                        <label><input type="checkbox" name="operating-1"
                                                value="phone-1">Symban</label><br>
                                        <label class="mb-0"><input type="checkbox" name="operating-1"
                                                value="phone-1">Bleckgerry os</label><br>
                                    </form>
                                </aside>
                                <!-- widget-product -->
                                <aside class="widget widget-product box-shadow">
                                    <h6 class="widget-title border-left mb-20">recent products</h6>
                                    <!-- product-item start -->
                                    <div class="product-item">
                                        <div class="product-img">
                                            <a href="single-product.html">
                                                <img src="img/product/4.jpg" alt="" />
                                            </a>
                                        </div>
                                        <div class="product-info">
                                            <h6 class="product-title">
                                                <a href="single-product.html">Product Name</a>
                                            </h6>
                                            <h3 class="pro-price">$ 869.00</h3>
                                        </div>
                                    </div>
                                    <!-- product-item end -->
                                    <!-- product-item start -->
                                    <div class="product-item">
                                        <div class="product-img">
                                            <a href="single-product.html">
                                                <img src="img/product/8.jpg" alt="" />
                                            </a>
                                        </div>
                                        <div class="product-info">
                                            <h6 class="product-title">
                                                <a href="single-product.html">Product Name</a>
                                            </h6>
                                            <h3 class="pro-price">$ 869.00</h3>
                                        </div>
                                    </div>
                                    <!-- product-item end -->
                                    <!-- product-item start -->
                                    <div class="product-item">
                                        <div class="product-img">
                                            <a href="single-product.html">
                                                <img src="img/product/12.jpg" alt="" />
                                            </a>
                                        </div>
                                        <div class="product-info">
                                            <h6 class="product-title">
                                                <a href="single-product.html">Product Name</a>
                                            </h6>
                                            <h3 class="pro-price">$ 869.00</h3>
                                        </div>
                                    </div>
                                    <!-- product-item end -->
                                </aside>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- SHOP SECTION END -->
                <!-- 리뷰 창 들어가는 곳  -->
                <!-- <div class="container-fluid my-5" id="reviewList"> </div>
            <div id="qnaList"> </div>
            <div class="row">
                <a href="../../qna/add?productNum=${dto.productNum}" class="btn btn-primary">상품문의</a>
                <a href="../../review/add?productNum=${dto.productNum}" class="btn btn-primary">리뷰작성</a>
                <a href="./add" class="btn btn-primary">상품추가</a>

            </div> -->
                <c:import url="../template/footer.jsp"></c:import>
            </section>
            <!-- End page content -->



            <script src="../resources/js/pageing.js"></script>

            <script src="../resources/js/productDetail.js"></script>
            <c:import url="../template/common_js.jsp"></c:import>
        </body>

        </html>