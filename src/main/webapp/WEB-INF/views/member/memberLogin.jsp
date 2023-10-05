<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<c:import url="../template/common_css.jsp"></c:import>

</head>
<body>

	<c:import url="../template/header.jsp"></c:import>

	 
		<img class="mb-4" src="/resources/imgs/logo.png" alt="" width="72"
			height="57">
		

		
	
<div class="col-lg-10 mx-auto">
                            <div class="registered-customers">
                                <h6 class="widget-title border-left mb-50">REGISTERED CUSTOMERS</h6>
                                <form action="./memberLogin" method="post" name="login_frm">
                                    <div class="login-account p-30 box-shadow">
                                    	
                                        <p>If you have an account with us, Please log in.</p>
                                        <input type="text" class="form-control" id="floatingInput"
																				placeholder="ID입력" name="id" value="${cookie.remember.value}">
                                        <input type="password" class="form-control" id="floatingPassword"
																					placeholder="바밀번호입력" name="pw">
                                        <!-- <p><small><a href="#">Forgot our password?</a></small></p> -->
                                        <label> <input type="checkbox" value="remember"
																						name="remember"> ID 저장
																				</label>
																				<div>
																				<a href="./memberIdFind"><button type="button" class="submit-btn-1 btn-hover-1">ID찾기</button></a> 
																				<a href="./memberPwFind"><button type="button" class="submit-btn-1 btn-hover-1">PW찾기</button></a>
                                        <button class="submit-btn-1 btn-hover-1" type="submit">login</button>
                                        <!-- <ul>
																						<li onclick="kakaoLogin();">
																					      <a href="javascript:void(0)">
																					          <span>카카오 로그인</span>
																					      </a>
																						</li>
																						<li onclick="kakaoLogout();">
																					      <a href="javascript:void(0)">
																					          <span>카카오 로그아웃</span>
																					      </a>
																						</li>
																					</ul> -->
																					<div class="form-group row" id="kakaologin">
																							<div class="kakaobtn">
																								<input type="hidden" name="kakaoemail" id="kakaoemail" />
																								<input type="hidden" name="kakaoname" id="kakaoname" />
																								<!-- <input type="hidden" name="kakaobirth" id="kakaobirth" /> -->
																								<a href="javascript:kakaoLogin();"> 
																									<img src="/resources/imgs/kakao_login.png" />
																								</a>
																							</div>
																					</div>
																					
                                        </div>
                                    </div>
                                </form>
                                <form action="./kakaologin.do" method="post" name="lfrm" hidden>
										<input type="text" name="kakaoemail" id="kakaoemail" />
								</form>
                            </div>
                        </div>
	<c:import url="../template/common_js.jsp"></c:import>
	<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init(''); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  location.href="/";
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script> -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init("로그인 키");

function kakaoLogin(){
    Kakao.Auth.login({
        scope:'account_email',//profile,,birthday
        success: function(authObj){
            //console.log(authObj);
            Kakao.API.request({
                url: '/v2/user/me',
                success: res => {
                    const email = res.kakao_account.email;
                    /* const name = res.properties.nickname; */
                    /* const birth = res.kakao_account.birthday; */

                    console.log(email);
                    console.log(name);
                   /*  console.log(birth); */

                    $('#kakaoemail').val(email);
                    /* $('#kakaoname').val(name); */
                    /* $('#kakaobirth').val(birth); */
                    
                    document.login_frm.submit();
                }
            });

        }
    });
}
</script>
</body>
</html>