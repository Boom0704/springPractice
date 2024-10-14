<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	<!-- 글 삭제 -->
	<!-- Contact Section-->
        <section class="page-section masthead" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">글 삭제</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                     
                        <form id="contactForm" action="/boardDelDo" method="post" >
                        	<div class="mb-3">
                        		<label>제목</label>
                        		<input type="text" class="form-control" name="boardTitle" value="${board.boardTitle }" readonly>
                        	</div>
                        	<div class="mb-3">
                        		<label>내용</label>
                        		<textarea class="form-control" style="height: 20rem" name="boardContent" readonly>${board.boardContent }</textarea>
                        	</div>
                            <input type="hidden" name="memId" value="${sessionScope.login.memId }">
                            <input type="hidden" name="boardNo" value="${board.boardNo }">
                            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">삭제</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>

	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>