<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 전역CSS -->
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/EX_about_Text_Logo.css">
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/EX_Containers.css">
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/EX_style_content.css">
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/EX_with_headers_footers.css">
<!-- 지역 style -->
<link rel="stylesheet" type="text/css" href="ImportFile/css/Login.css">
<title>Insert title here</title>
</head>

<body>
	<!-- 전역 컨테이너 -->
	<div class="globals-container">
		<div class="globals-space" id="LoginPage-space" align="center">
			<!-- 타이틀&로고 -->
			<div class="logo_container" id="LoginPageLogo-container">
				<h2 class="title_text">
					<span class="title_text title_1 LoginPageLogoTxt">냉장고를</span> <br />
					<span class="title_text title_2 LoginPageLogoTxt">부탁해!</span>
				</h2>
				<!-- 냉부로고 사이즈 130 -->
				<img id="LoginPageLogoImg" src="ImportFile/imgs/logoM.png"
					alt="로고-로그인페이지" />
			</div>

			<!-- 구경할래요 버튼 -->
			<a href="Home.jsp" style="text-decoration: none;">
				<div class="LoginPageSeekerBtn-container">
					<button class="btn LoginPageBtn b_pink" id="LoginPageSeekerBtn">
						<span class="design_text" id="LoginPageSeekerBtnTxt"> 구경할래요
							👀 </span>
					</button>
				</div>
			</a>

			<!-- 로그인 정보 전송 -->
			<form action="LoginService" method="post">
				<div class="input_container design_text">
					<div class="input_container">
						<input type="text" name="userId" placeholder="ID를 입력하세요" />
					</div>

					<div class="input_container">

						<input type="password" name="userPw" placeholder="PW를 입력하세요" />
					</div>

					<!-- 로그인 버튼 -->
					<button class="btn LoginPageBtn b_green" id="LoginPageLoginBtn"
						type="submit" name="action" value="btn-Login">
						<span class="design_text" id="LoginPageLoginBtnTxt"> 로그인 </span>
					</button>
				</div>
			</form>

			<!-- Join.jsp 페이지 이동 -->
			<div class="system_text">
				<span>회원이 아니신가요?</span> <a href="JoinForm.jsp" id="GoJoin">회원가입</a>
			</div>
		</div>
	</div>

	<script>
		window.onload = function() {	
			if (
	<%=request.getAttribute("loginFailed") != null ? "true" : "false"%>
		) {
				alert("로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
			}
		}
	</script>
</body>
</html>