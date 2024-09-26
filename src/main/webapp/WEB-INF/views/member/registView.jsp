<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 회원가입 Section -->
    <section class="page-section" id="signup">
        <div class="container mt-5">
            <!-- 회원가입 Section Heading -->
            
            <!-- 회원가입 Card -->
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card shadow-lg">
                        <div class="card-body p-5">
                            <!-- 회원가입 Form -->
                            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-4">회원가입</h2>
                            <form id="signupForm" action="register.do" method="post">
                                <!-- ID (아이디) input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="username" name="username" type="text" placeholder="아이디를 입력하세요" required />
                                    <label for="username">아이디</label>
                                    <div class="invalid-feedback">아이디는 필수입니다. <i class="fas fa-info-circle"></i></div>
                                </div>
                                <!-- Password input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="password" name="password" type="password" placeholder="비밀번호를 입력하세요" required />
                                    <label for="password">비밀번호</label>
                                    <div class="invalid-feedback">비밀번호는 필수입니다. <i class="fas fa-info-circle"></i></div>
                                </div>
                                <!-- Confirm Password input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="confirmPassword" name="confirmPassword" type="password" placeholder="비밀번호를 다시 입력하세요" required />
                                    <label for="confirmPassword">비밀번호 확인</label>
                                    <div class="invalid-feedback">비밀번호 확인은 필수입니다. <i class="fas fa-info-circle"></i></div>
                                </div>
                                <!-- Name input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="name" name="name" type="text" placeholder="이름을 입력하세요" required />
                                    <label for="name">이름</label>
                                    <div class="invalid-feedback">이름은 필수입니다. <i class="fas fa-info-circle"></i></div>
                                </div>
                                <!-- Submit Button -->
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-xl" id="submitButton" type="submit" disabled>회원가입</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const submitButton = document.getElementById('submitButton');
            const requiredFields = document.querySelectorAll('#signupForm input[required]');

            // 체크 함수: 모든 필수 필드가 입력되었는지 확인
            function checkFormValidity() {
                let allValid = true;
                requiredFields.forEach((field) => {
                    if (!field.value.trim()) {
                        allValid = false;
                        field.classList.add('is-invalid');
                    } else {
                        field.classList.remove('is-invalid');
                    }
                });
                submitButton.disabled = !allValid; // 모든 필드가 채워져 있어야 버튼 활성화
            }

            // 각 필드의 입력 상태가 바뀔 때마다 체크
            requiredFields.forEach((field) => {
                field.addEventListener('input', checkFormValidity);
            });

            // 페이지 로드 시 한 번 실행
            checkFormValidity();
        });
    </script>
</body>
</html>
