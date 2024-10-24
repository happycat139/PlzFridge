<%@page import="Model.FavoriteDAO"%>
<%@page import="Model.RecipeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="ImportFile/css/EX_Containers.css" />
<link rel="stylesheet" href="ImportFile/css/EX_about_Text_Logo.css" />
<link rel="stylesheet" href="ImportFile/css/EX_with_headers_footers.css" />
<link rel="stylesheet" href="ImportFile/css/EX_style_content.css" />

<link rel="stylesheet" href="ImportFile/css/RecipeMain.css" />
<link rel="stylesheet" href="ImportFile/css/RecipeDetail.css" />
</head>
<body>

   <%
   String userId = (String) session.getAttribute("user_id");
   boolean isFavor = false;
   FavoriteDAO favoriteDAO = new FavoriteDAO();
   List<RecipeDTO> recipeDetail = (List<RecipeDTO>) request.getAttribute("recipeDetail");
   for (RecipeDTO rd : recipeDetail) {
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
               <span class="general-pageTl design_text">레시피 상세</span>
            </div>
         </header>

         <div class="globals-content_container">
            <!-- 이상 content 구역 시작 -->

            <!-- 선택된 레시피 메뉴 출력부 -->
            <div class="r_DetailPage_result-container">
               <!-- 선택된 레시피 메뉴 썸네일 컨테이너 -->
               <div class="r_DetailPage_result-IMG">
                  <img src="<%=rd.getRecipe_img1()%>" alt="선택된 레시피 메뉴 썸네일" />
               </div>

               <!-- 선택된 레시피 메뉴명 & 찜 버튼 컨테이너 -->
               <div class="r_DetailPage_result-ContentBox">
                  <!-- 메뉴명 출력 컨테이너 -->
                  <div class="r_DetailPage_result_content system_text">
                     <h4><%=rd.getRecipe_name()%></h4>
                  </div>

                  <!-- 찜 버튼 컨테이너 -->
                  <div class="r_DetailPage_result_LikeyBtn-container">
                     <!-- 찜 버튼 -->
                     <%
                     if (userId != null) {
                        isFavor = favoriteDAO.isRecipeFavorited(userId, rd.getRecipe_idx());

                     }
                     %>

                     <button id="like-btn-<%=rd.getRecipe_idx()%>"
                        onclick="toggleFavorite('<%=rd.getRecipe_idx()%>')"
                        class="r_MainPage_LikeyBtn">
                        <%
                        if (isFavor) {
                        %>
                        <img id="heart-img-<%=rd.getRecipe_idx()%>"
                           src="ImportFile/imgs/옐로하트-찜 버튼 after.png" alt="찜해제">
                        <%
                        } else {
                        %>
                        <img id="heart-img-<%=rd.getRecipe_idx()%>"
                           src="ImportFile/imgs/속빈하트-찜 버튼 before.png" alt="찜하기">

                     </button>

                     <%
                     }
                     %>
                  </div>
               </div>
            </div>

            <!-- 메뉴/재료 출력부 구분선 -->
            <div id="ingre_line">

               <!-- '재료' 텍스트 컨테이너 -->
               <!-- 헤더 코드 재사용으로 클래스명 중복 -->
               <div class="header_HrPageTl-container r_DetailPage_Ingre_Txt">
                  <span class="general-pageTl design_text" id="recipe_detail_ingre">재료</span>
               </div>
            <div>
               <hr class="general-Tl_hr" id="recipe_detail_ingre_i"/>
            </div>
            </div>
            <!-- 선택된 레시피 재료 출력부 -->
            <div class="r_DetailPage_Ingre-container">
               <!-- 재료 출력부 박스 -->
               <!-- ❗❗❗피드백에 따라 공간 분할 배치 변동 가능성 있음 -->
               <div class="r_DetailPage_IngreBox">
                  <!-- 재료 출력 -->
                  <div id="ingre_box">
                     <%
                     String[] ingredients = rd.getRecipe_use_ingre().replace("[", "").replace("]", "").replace("\"", "").split(",");
                     for (String ingredient : ingredients) {
                     %>
                     <p><%=ingredient.trim()%></p>
                     <%
                     }
                     %>
                  </div>
               </div>
            </div>

            <!-- 선택된 레시피 조리순서 출력부 -->
            <div class="r_DetailPage_Order-container">
               <!-- '조리순서' 텍스트 & 구분선 컨테이너 -->
               <div class="header_HrPageTl-container r_DetailPage_Order_hr_Txt">
                  <!-- '조리순서' 구분선 -->
                  <div>
                     <span class="general-pageTl design_text">조리순서</span>
                  </div>
                  <div id="cooking_guide">
                     <hr class="general-Tl_hr r_DetailPage_Order_hr" />
                  </div>
               </div>
               <!-- 조리순서 출력 -->
               <div>
                  <!-- tts 버튼!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                  <button class="button" id="playButton">재생</button>
                  <button class="button" id="pauseButton">일시정지</button>
                  <button class="button" id="stopButton">정지</button>
                  <ol id="ttstext">
                     <!-- ❗백엔드 로직 예시: ol 안에 조리순서를 행 단위로 <li> 태그에 담아 반복문 출력  -->
                     <%
                     String[] steps = rd.getRecipe_cooking_guide().replace("[", "").replace("]", "").replace("\"", "").split(",");
                     for (String step : steps) {
                     %>
                     <li><%=step.trim()%></li><br>
                     <%
                     }
                     %>

                  </ol>
               </div>
            </div>

            <!-- 이하 content 구역 끝 -->
         </div>
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

   <%
   }
   %>

   <script src="ImportFile/js/Favorite.js"></script>

</body>
</html>