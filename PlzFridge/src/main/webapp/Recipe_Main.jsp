<%@page import="Model.FavoriteDAO"%>

<%@page import="Model.RecipeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="importFile/css/파일명.css">  -->
<link rel="stylesheet" href="ImportFile/css/Hashtag.css" />
<link rel="stylesheet" href="ImportFile/css/EX_Containers.css" />
<link rel="stylesheet" href="ImportFile/css/EX_about_Text_Logo.css" />
<link rel="stylesheet" href="ImportFile/css/EX_with_headers_footers.css" />
<link rel="stylesheet" href="ImportFile/css/EX_style_content.css" />
<!-- 지역 style -->
<link rel="stylesheet" href="ImportFile/css/RecipeMain.css" />
</head>
<body>
	<%
	String ingredientsInput = (String) request.getAttribute("ingredientsInput");
	List<RecipeDTO> recipes = (List<RecipeDTO>) request.getAttribute("recipes");
	String userId = (String) session.getAttribute("user_id");
	boolean isFavor = false;
	FavoriteDAO favoriteDAO = new FavoriteDAO();
	%>





	<!-- 전역 컨테이너 -->
	<div class="globals-container">
		<div class="globals-space_withBar" align="center">
			<!-- 여기부터 header 구역 시작 -->

			<!-- 헤더-타이틀&로고 -->
			<header class="general-header">
				<!-- ❗❗ 'Home.html' 기준. 수정 예정! -->
				<div class="general-logo_container">
					<!-- 타이틀&로고 -->
					<div class="logo_container">
						<!-- 냉부로고 사이즈 35 -->
						<img class="header-LogoImg" src="ImportFile/imgs/logoM.png"
							alt="로고-홈페이지" />
					</div>

					<!-- 홈페이지 타이틀 -->
					<div class="logo_container">
						<!-- ❗타이틀 사이에 간격 주기 -->
						<span class="title_text general-header_Title"> <span
							class="title_1">냉장고를</span> <br /> <span class="title_2">부탁해!</span>
						</span>
					</div>
				</div>

				<div class="header_HrPageTl-container">
					<!-- 헤더의 hr과 페이지명이 담긴 컨테이너 -->
					<hr class="general-Tl_hr" />
					<span class="general-pageTl design_text">레시피 찾기</span>
				</div>
			</header>

			<!-- 여기부터 content 구역 시작 -->

			<div class="globals-content_container">
				<!-- 여기에 서비스 페이지를 작성 -->

				<!-- 검색어(키워드) 출력부 컨테이너 -->
				<div class="r_MainPage_KeyWordBox-container">
					<!-- 검색어(키워드) 출력 -->
					<div class="r_MainPage_KeyWordBox system_text">
						<!-- ❗ 이 부분에 반복문으로 Home에서 입력한 식재료 키워드를 출력 -->
						<span><%=ingredientsInput%></span>
					</div>
				</div>

				<!-- ◽🔸◽🔹◽🔸◽🔹◽🔸◽🔹◽🔸◽🔹◽🔸◽🔹◽🔸◽🔹◽🔸◽🔹◽🔸◽ -->

				<%
				if (recipes != null) {
					for (RecipeDTO r : recipes) {
				%>

				<!-- 검색 결과 레시피 개별 출력-1 ⭐⭐⭐ ==> 반복 출력 -->
				<div class="r_MainPage_result-container">
					<!-- 검색된 레시피 썸네일 -->
					<div class="r_MainPage_result-IMG">
						<!-- 이미지를 클릭하면 서블릿으로 이동 -->
						<a href="DetailRecipeService?recipeId=<%=r.getRecipe_idx()%>">
							<img width="100px" height="auto" src="<%=r.getRecipe_img1()%>"
							alt="레시피 검색결과-파스타 이미지" />
						</a>
					</div>

					<!-- 검색된 레시피의 정보 컨테이너 -->
					<div class="r_MainPage_result-ContentBox">
						<!-- 검색된 레시피의 정보 -->
						<div class="r_MainPage_result_content system_text">
							<!-- 레시피 이름을 클릭하면 서블릿으로 이동 -->
							<a href="DetailRecipeService?recipeId=<%=r.getRecipe_idx()%>">
								<h4><%=r.getRecipe_name()%></h4>
							</a>
							<!-- 요리이름 -->
							<p>재료</p>
							<!-- 백엔드 로직으로 해당 메뉴의 재료 상위 목록을 출력 -->
							<ul>
								<!-- 재료 -->
								<span><%=r.getIngredientsName()%></span>
							</ul>
						</div>
						<!-- 찜 버튼 컨테이너 -->

						<div class="r_MainPage_result_LikeyBtn-container">
							<%
							if (userId != null) {
								isFavor = favoriteDAO.isRecipeFavorited(userId, r.getRecipe_idx());

							}
							%>

							<button id="like-btn-<%=r.getRecipe_idx()%>"
								onclick="toggleFavorite('<%=r.getRecipe_idx()%>')"
								class="r_MainPage_LikeyBtn">
								<%
								if (isFavor) {
								%>
								<img id="heart-img-<%=r.getRecipe_idx()%>"
									src="ImportFile/imgs/옐로하트-찜 버튼 after.png" alt="찜해제">
								<%
								} else {
								%>
								<img id="heart-img-<%=r.getRecipe_idx()%>"
									src="ImportFile/imgs/속빈하트-찜 버튼 before.png" alt="찜하기">

							</button>

							<%
							}
							%>
						</div>
						<!-- 찜 버튼 -->

					</div>
				</div>

				<%
				} // for문 종료
				} // if문 종료
				%>
			</div>
		</div>

		<!-- 여기부터 Footer 구역 시작 -->

		<!-- 하단바-홈/게시판/나의레시피/마이페이지 -->
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


	<script src="ImportFile/js/Favorite.js"></script>




</body>
</html>