<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- 지역 CSS -->
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/PostUpload.css" />
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/Sel_Profile.css" />
</head>
<body>


	<div class="globals-container">
		<div class="globals-space_withBar" align="center">
			<!-- 헤더-타이틀&로고 -->
			<header class="general-header" id="post_upld_header">
				<div class="general-logo_container">
					<!-- 타이틀&로고 -->
					<div class="logo_container">
						<img class="header-LogoImg" src="ImportFile/imgs/logoM.png"
							alt="로고-홈페이지" />
					</div>
					<!-- 홈페이지 타이틀 -->
					<div class="logo_container">
						<span class="title_text general-header_Title"> <span
							class="title_1">냉장고를</span> <br /> <span class="title_2">부탁해!</span>
						</span>
					</div>
				</div>
			</header>
			<!-- 여기부터가 상단바. 아래에  HTML 코드 적기 -->


			<!-- 여기부터 content 구역 시작 -->

			<div class="globals-content_container">
				<div class="lightPage-container" id="post_upld_lightPage-container">

					<div id="post_out">
						<!-- ❗엑스 누르면, '게시물 작성을 취소하시겠습니까?' -->
						<div class="sel_Profile_Xbtn">
							<a href="Post_Main.jsp" id="upload_x">x</a>
						</div>
					</div>

					<form action="BoardService" method="post"
						enctype="multipart/form-data">

						<div class="post_ch">
							<h3 class="design_text">사진을 선택해 주세요</h3>
						</div>

						<div class="post_ch_img-container">
							<img id="dft_img" src="ImportFile/imgs/icon_Board.png"
								alt="이미지등록" />

							<!-- 파일 선택 버튼 -->
							<input type="file" name="filename" id="file_input"
								style="display: none;" /> <label for="file_input"
								class="custom-file-label">사진 선택</label>
						</div>

						<textarea id="post_text" cols="60" rows="8" name="content" placeholder="사진과 함께 업로드할 내용을 작성해주세요..."></textarea>
						<div>
							<input type="submit" value="👉🏼 게시글 올리기" />
						</div>

					</form>

				</div>
			</div>



			<!-- 여기부터가 하단바. 위에  HTML 코드 적기 -->
				<footer class="globals-footer">
				<div class="icons-container">
					<a class="icon_footer_link" href="Home.jsp"> <img
						class="icon_footer_img" src="ImportFile/imgs/icon_Home.png"
						alt="Home으로 이동">
						<p class="icon_footer_a">Home</p>
					</a>
				</div>
				<div class="icons-container">
					<a class="icon_footer_link" href="Post_Main.jsp"> <img
						class="icon_footer_img" src="ImportFile/imgs/icon_Board.png"
						alt="게시판으로 이동">
						<p class="icon_footer_a">게시판</p>
					</a>
				</div>
				<div class="icons-container">
					<a class="icon_footer_link" href="Like_Recipe.jsp"> <img
						class="icon_footer_img" src="ImportFile/imgs/icon_MyRecipe.png"
						alt="나만의 레시피로 이동">
						<p class="icon_footer_a">나만의 레시피</p>
					</a>
				</div>
				<div class="icons-container">
					<a class="icon_footer_link" href="MyPageService"> <img
						class="icon_footer_img" src="ImportFile/imgs/icon_MyPage.png"
						alt="마이 페이지로 이동">
						<p class="icon_footer_a">마이페이지</p>
					</a>
				</div>
			</footer>


		</div>
	</div>

	<script>
		document.getElementById('upload_x').addEventListener('click',
				function(event) {
					// 이동을 일단 막기 위해 기본 동작을 방지
					event.preventDefault();

					// 경고창에서 확인을 누르면 페이지로 이동
					if (confirm('정말로 이 페이지로 나가시겠습니까? 작성하던 게시글이 사라집니다.')) {
						window.location.href = this.href; // href 속성으로 페이지 이동
					}
				});
	</script>
</body>
</html>