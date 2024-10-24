<%@page import="Model.RecipeDAO"%>
<%@page import="Model.RecipeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 전역 style -->
<link rel="stylesheet" href="ImportFile/css/EX_Containers.css" />
<link rel="stylesheet" href="ImportFile/css/EX_about_Text_Logo.css" />
<link rel="stylesheet" href="ImportFile/css/EX_with_headers_footers.css" />
<link rel="stylesheet" href="ImportFile/css/EX_style_content.css" />
<!-- 지역 style -->
<link rel="stylesheet" href="ImportFile/css/Like_Recipe.css" />
</head>
<body>
	<%
	boolean visit = false;

	String userId = (String) session.getAttribute("user_id");

	RecipeDAO recipeDAO = new RecipeDAO();

	if (userId == null) {
		visit = false;

	} else {
		visit = true;
	}

	List<RecipeDTO> favoriteRecipes = (List<RecipeDTO>) recipeDAO.selectFavoriteRecipesByUserId(userId);
	for (RecipeDTO r : favoriteRecipes) {
		List<String> ingredientName = recipeDAO.getIngredientsByRecipeIdx(r.getRecipe_idx());
		String ingredientsName = String.join(", ", ingredientName);
		r.setIngredientsName(ingredientsName); // 레시피에 재료 목록을 추가
	}
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
					<span class="general-pageTl design_text">찜한 레시피🩷</span>
				</div>
			</header>

			<!-- 여기부터 content 구역 시작 -->

			<div class="globals-content_container">
				<!-- 검색 결과 레시피 개별 출력-1 ⭐⭐⭐ ==> 반복 출력 -->

				<%
				for (RecipeDTO r : favoriteRecipes) {
				%>
				<div class="r_MainPage_result-container">
					<!-- 검색된 레시피 썸네일 -->
					<form action="DetailRecipeService" method="post">
						<input type="hidden" name="recipeId"
							value="<%=r.getRecipe_idx()%>">
						<div class="r_MainPage_result-IMG">
							<a href="javascript:void(0);"
								onclick="this.closest('form').submit();"> <img
								src="<%=r.getRecipe_img1()%>" alt="레시피 검색결과-파스타 이미지" />
							</a>
						</div>
					</form>
					<!-- 검색된 레시피의 정보 컨테이너 -->
					<div class="r_MainPage_result-ContentBox">
						<!-- 검색된 레시피의 정보 -->
						<div class="r_MainPage_result_content system_text">
							<!-- 백엔드 로직으로 검색 결과에 해당하는 메뉴명 출력 -->

							<h4><%=r.getRecipe_name()%></h4>


							<!-- '재료' 표시는 기본값으로 출력 -->
							<p>재료</p>
							<!-- 백엔드 로직으로 해당 메뉴의  재료 상위 목록릏 출력 -->

							<ul>
								<span><%=r.getIngredientsName()%></span>
							</ul>
						</div>
						<!-- 찜 버튼 컨테이너 -->

					</div>
				</div>
				<!-- 검색 결과 레시피 개별 출력-2 ⭐⭐⭐ ==> 반복 출력 -->
				<%
				}
				%>

				<!-- ⭐⭐⭐ 이하 레시피 개별 출력-5, 레시피 개별 출력-6, 레시피 개별 출력-7, ... -->
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
	</div>

	<script>
		// 페이지 로드 시 세션 체크
		window.onload = function() {
			var isLoggedIn =
	<%=visit%>
		;

			// 로그인이 안 된 경우 confirm 창 띄우기
			if (!isLoggedIn) {
				var goToLogin = confirm("로그인 후 이용가능한 서비스 입니다.\n확인버튼 클릭 시 로그인페이지로 이동합니다.");
				if (goToLogin) {
					window.location.href = "Login.jsp"; // 로그인 페이지로 리다이렉트
				} else {
					// 취소를 누르면 홈 페이지로 이동 (또는 다른 페이지로 이동)
					window.location.href = "Home.jsp";
				}
			}
		}
	</script>
</body>
</html>