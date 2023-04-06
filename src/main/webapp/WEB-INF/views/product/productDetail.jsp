<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>상품 상세 페이지 </title>
            <c:import url="../template/common_css.jsp"></c:import>
        </head>

        <body>

            <h1>Detail Page</h1>
            <!-- Product section-->

            <section class="py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">

                        <div class="col-md-6">
                            <c:forEach items="${dto.productImgDTOs}" var="productImgDTO">
                                <img class="card-img-top mb-5 mb-md-0"
                                    src="../resources/upload/product/${productImgDTO.fileName}" />
                            </c:forEach>
                        </div>

                        <div class="col-md-6">
                            <form action="../cart/cartAdd" method="post">
                                <!-- 옵션 dto의 횟수 만큼 돌지 않도록 loop_flag 설정-->
                                <c:set var="loop_flag" value="false" />
                                <c:forEach items="${dto.productOptionDTOs}" var="productOptionDTO">
                                    <c:if test="${not loop_flag }">
                                        <div class="small mb-1">업로드 날짜 : ${productOptionDTO.productDate}</div>
                                        <h1 class="display-5 fw-bolder">${dto.productName}</h1>
                                        <div class="fs-5 mb-5">
                                            <span
                                                class="text-decoration-line-through" >${productOptionDTO.productPrice}원</span>
                                            <span>원</span>
                                        </div>

                                        <!-- 옵션 창 띄워주는 부분 -->

                                        <div id="depth0" >
                                            <select class="form-select" aria-label="Default select example"
                                                id="selectForm1">
                                                <c:if test="${productOptionDTO.depth eq 0}">
                                                    <option selected>${productOptionDTO.optionName}</option>
                                                </c:if>
                                                <c:forEach items="${dto.productOptionDTOs}" var="productOptionDTO">
                                                    <c:if test="${productOptionDTO.depth eq 0}">
                                                        <option value="${productOptionDTO.optionNum}"
                                                            data-productnum="${productOptionDTO.productNum}"
                                                            id="option">${productOptionDTO.optionValue}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <c:set var="loop_flag" value="true" />
                                    </c:if>
                                </c:forEach>
                                

                                <div class="d-flex">
                                    <input class="form-control text-center me-3" id="inputQuantity" name="productEa" type="num" value="1"
                                        style="max-width: 3rem" />
                                    <button class="btn btn-outline-dark flex-shrink-0" type="submit" id="btn">
                                        <i class="bi-cart-fill me-1"></i>
                                        Add to cart
                                    </button>
                                </div>

                                
                                <!-- db에 인서트해주는 폼 -->
                                <div id="cartform">
                                    <input type="text" class="form-control" id="id" name="id" value=" ${member.id}" readonly>
                                    <input type="text" class="form-control" id="productNum" name="productNum" value="${dto.productNum}" readonly>
                                    <input type="text" class="form-control" id="totalPrice" name="totalPrice" value="0" readonly>
                                  
                                    
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <!-- 리뷰 창 들어가는 곳  -->
            <div class="container-fluid my-5" id="reviewList"> </div>
            <div id="qnaList"> </div>

            <div class="row">
                <a href="../../qna/add?productNum=${dto.productNum}" class="btn btn-primary">상품문의</a>
                <a href="../../review/add?productNum=${dto.productNum}" class="btn btn-primary">리뷰작성</a>
                <a href="./add" class="btn btn-primary">상품추가</a>

            </div>


            <script src="../resources/js/reviewTop5.js"></script>
            <script src="../resources/js/qnaTop5.js"></script>
            <script src="../resources/js/productDetail.js"></script>
            <c:import url="../template/common_js.jsp"></c:import>
        </body>

        </html>




        