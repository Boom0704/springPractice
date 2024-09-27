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
    <style>
        .invalid-feedback-custom {
            color: red;
            display: none; /* 처음엔 안 보이게 설정 */
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 회원가입 Section -->
    <section class="page-section" id="signup">
        <div class="container mt-5">
            <!-- 회원가입 Card -->
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card shadow-lg">
                        <div class="card-body p-5">
                            <!-- 회원가입 Form -->
                            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-4">회원가입</h2>
                            <form id="signupForm" action="registDo" method="post">
                                <!-- ID (아이디) input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="memId" name="memId" type="text" placeholder="아이디를 입력하세요" required />
                                    <label for="memId">아이디</label>
                                    <div class="invalid-feedback">아이디는 필수입니다. <i class="fas fa-info-circle"></i></div>
                                </div>
                                <!-- Password input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="memPw" name="memPw" type="password" placeholder="비밀번호를 입력하세요" required />
                                    <label for="memPw">비밀번호</label>
                                    <div class="invalid-feedback">비밀번호는 필수입니다. <i class="fas fa-info-circle"></i></div>
                                </div>
                                <!-- Confirm Password input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="confirmMemPw" name="confirmMemPw" type="password" placeholder="비밀번호를 다시 입력하세요" required />
                                    <label for="confirmMemPw">비밀번호 확인</label>
                                    <div class="invalid-feedback-custom" id="passwordMismatchError">비밀번호가 일치하지 않습니다.</div>
                                </div>
                                <!-- Name input -->
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="memNm" name="memNm" type="text" placeholder="이름을 입력하세요" required />
                                    <label for="memNm">이름</label>
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
            const passwordField = document.getElementById('memPw');
            const confirmPasswordField = document.getElementById('confirmMemPw');
            const passwordMismatchError = document.getElementById('passwordMismatchError');
            const requiredFields = document.querySelectorAll('#signupForm input[required]');

            // 폼 유효성 검사 함수
            function checkFormValidity() {
                let allValid = true;

                // 필수 입력 항목 확인
                requiredFields.forEach((field) => {
                    if (!field.value.trim()) {
                        allValid = false;
                        field.classList.add('is-invalid');
                    } else {
                        field.classList.remove('is-invalid');
                    }
                });

                // 비밀번호 일치 여부 확인
                if (passwordField.value !== confirmPasswordField.value || !passwordField.value.trim()) {
                    passwordMismatchError.style.display = 'block';
                    allValid = false;
                } else {
                    passwordMismatchError.style.display = 'none';
                }

                // 제출 버튼 활성화 또는 비활성화
                submitButton.disabled = !allValid;
            }

            // 입력 필드에 입력이 발생할 때마다 유효성 검사 실행
            requiredFields.forEach((field) => {
                field.addEventListener('input', checkFormValidity);
            });

            // 페이지 로드 시 초기 유효성 검사
            checkFormValidity();
        });
    </script>
</body>
</html>
