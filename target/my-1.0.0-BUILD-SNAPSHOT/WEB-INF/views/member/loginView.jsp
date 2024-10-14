<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<!-- 로그인 -->
	<!-- Contact Section-->
        <section class="page-section masthead" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">로그인</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                     
                        <form id="contactForm" action="/loginDo" method="post" >
                            <!-- Id input-->
                            <div class="form-floating mb-3" >
                                <input class="form-control" id="id" name="memId" value="${cookie.rememberId.value }" type="text" placeholder="아이디를 입력해주세요."/>
                                <label for="id">ID</label> 
                            </div>
                            <!-- Pw address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="pw" name="memPw" type="password" placeholder="비밀번호를 입력해주세요."/>
                                <label for="pw">Password</label>   
                            </div>
                            <div class="form-check mb-3">
                            	<input ${cookie.rememberId.value == null ? "" : "checked" } type="checkbox" class="form-check-input" name="remember" >
								<label class="form-check-label" for="flexCheckDefault">아이디 기억하기</label>
                            </div>
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">로그인하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>

	<!-- 회원가입 -->
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>