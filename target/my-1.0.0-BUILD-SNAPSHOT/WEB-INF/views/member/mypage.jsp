<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>mypage</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<!-- Contact Section-->
	<section class="page-section" id="contact" style="margin-top: 150px">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">mypage</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<img src="${pageContext.request.contextPath}/assets/img/non.png"
						id="myImage" class="rounded-circle img-thumbnail shadow-sm"
						width="200" style="cursor: pointer;">
					<form id="profileForm" enctype="multipart/form-data">
						<input type="file" name="uploadImage" id="uploadImage"
							accept="image/*" style="display: none;">
					</form>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<form method="post" action="<c:url value="/registDo" />">
						<div class="form-floating mb-3">
							<input class="form-control" name="memId" type="text" disabled
								value="" placeholder="아이디를 입력해주세요 "> <label>아이디</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" name="memNm" type="text" value=""
								placeholder="이름을 입력해주세요 "> <label>이름</label>
						</div>
						<button class="btn btn-primary btn-xl" type="submit">수정하기</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
		});
	</script>
</body>
</html>