<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로그인</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        .invalid-feedback-custom {
            color: red;
            display: none;
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .remember-me input[type="checkbox"] {
            margin-left: 8px;
        }

        .remember-me label {
            margin-left: 8px;
            margin-bottom: 0;
            font-weight: normal;
        }

        .form-check {
            display: flex;
            align-items: center;
        }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

    <!-- 로그인 Section -->
    <section class="page-section" id="login">
        <div class="container mt-5">
            <!-- 로그인 Card -->
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card shadow-lg">
                        <div class="card-body p-5">
                            <!-- 로그인 Form -->
                            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-4">로그인</h2>
                            <form id="loginForm" action="loginDo" method="post">
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
                                <!-- Remember Me -->
                                <div class="form-check remember-me">
                                    <label for="remember">아이디 기억하기</label>
                                    <input type="checkbox" class="form-check-input" id="remember" name="remember">
                                </div>
                                <!-- Submit Button -->
                                <div class="d-grid mt-4">
                                    <button class="btn btn-primary btn-xl" id="submitButton" type="submit" disabled>로그인</button>
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
            const memIdField = document.getElementById('memId');
            const memPwField = document.getElementById('memPw');
            const rememberCheckBox = document.getElementById('remember');

            // 쿠키에서 아이디와 비밀번호 값을 자동으로 찾아서 입력하는 함수
            function getCookiesAndAutoFill() {
                const cookies = document.cookie.split(';');
                let savedId = null;
                let savedPw = null;

                // 쿠키에서 rememberId와 rememberPw를 찾아 저장
                cookies.forEach(cookie => {
                    const trimmedCookie = cookie.trim();
                    if (trimmedCookie.startsWith('rememberId=')) {
                        savedId = trimmedCookie.substring('rememberId='.length);
                    } else if (trimmedCookie.startsWith('rememberPw=')) {
                        savedPw = trimmedCookie.substring('rememberPw='.length);
                    }
                });

                // 두 값이 모두 존재할 때만 필드에 값 채우기
                if (savedId && savedPw) {
                    memIdField.value = savedId;
                    memPwField.value = savedPw;
                    rememberCheckBox.checked = true;
                    console.log("쿠키를 통해 아이디와 비밀번호가 자동 입력되었습니다.");
                }
            }

            // 폼 유효성 검사 함수
            function checkFormValidity() {
                let allValid = true;
                [memIdField, memPwField].forEach((field) => {
                    if (!field.value.trim()) {
                        allValid = false;
                        field.classList.add('is-invalid');
                    } else {
                        field.classList.remove('is-invalid');
                    }
                });
                submitButton.disabled = !allValid;
            }

            // 입력 필드에 입력이 발생할 때마다 유효성 검사 실행
            [memIdField, memPwField].forEach((field) => {
                field.addEventListener('input', checkFormValidity);
            });

            // 페이지가 로드될 때 쿠키 확인 및 필드 채우기
            getCookiesAndAutoFill();

            // 페이지 로드 시 초기 유효성 검사
            checkFormValidity();
        });
    </script>
</body>

</html>
