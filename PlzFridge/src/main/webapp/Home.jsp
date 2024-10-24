<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="Model.RecipeDAO"%>
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

<link rel="stylesheet" href="ImportFile/css/Hashtag.css" />
<link rel="stylesheet" href="ImportFile/css/EX_Containers.css" />
<link rel="stylesheet" href="ImportFile/css/EX_about_Text_Logo.css" />
<link rel="stylesheet" href="ImportFile/css/EX_with_headers_footers.css" />
<link rel="stylesheet" href="ImportFile/css/EX_style_content.css" />
<!-- 지역 style -->
<link rel="stylesheet" href="ImportFile/css/Home.css" />
<!-- css 스타일 적용 -->
</head>
<body>
	<%
   // 세션에서 레시피 리스트 가져오기
   RecipeDAO recipeDAO = new RecipeDAO(); //객체 불러오기   
   List<RecipeDTO> recipes = recipeDAO.bestRecipe(); // 객체를 recipes에 담기
   request.setAttribute("recipes", recipes);
   
   %>



   <!-- 상단바 헤더 부분(로고,제목) -->

   <div id="globals-container">
      <div class="globals-space_withBar" align="center">

         <!-- 상단바 헤더 부분(로고,제목) -->

         <header id="homePage-header">
            <!-- 타이틀&로고 -->
            <div class="logo_container">
               <!-- 냉부로고 사이즈 35 -->
               <img class="header-LogoImg" src="ImportFile/imgs/logoM.png"
                  alt="로고-홈페이지" />
            </div>

            <!-- 홈페이지 타이틀 -->
            <div class="logo_container Home-header_Title">
               <span class="title_text"> <span class=" title_1">냉장고를</span>
                  <br /> <span class=" title_2">부탁해!</span>
               </span>
            </div>
            <div id="cooktalk">
            <a href="User_Talk.jsp" ><img src="ImportFile/imgs/cooktalk.png" alt="쿡톡" width="50px"></a></div>
         </header>

         <!-- 레시피 재료 검색 추가 부분 -->
         <div class="globals-content_container"
            id="HomePage-content_container">
            <form action="SearchService" method="post" name="ingredient">
               <div id="HomePageAddSearch-container">

                  <div id="HomePage_InputAddHash-container">

                        <div id="HomePageInputAdd-container">
                           <div class="input-container">
                              <input type="text" placeholder="재료를 입력하세요"
                                 class="search-ingre" id="ingredientInput">
                           </div>
                           <button type="button" id="HomePageAddBtn" class="HomePageBtn">
                              <span class="design_text"> <img id="HomePageAddBtnImg"
                                 src="ImportFile/imgs/Add_Btn.png" alt="식재료 추가 버튼" />
                              </span>
                           </button>
                        </div>
                           <!-- '+' 버튼 -->

                        
                        <hr />
                        <div class="tag-container" id="HomePageHash-container">
                           <!-- 여기에 해시태그로 추가된 재료들이 나타남 -->
                           <input type="hidden" name="ingredients" id="ingredientsInput">
                        </div>
                     
                  </div>
                     
                     <!-- 서버로 전송할 숨겨진 필드 -->
                  




                     <!-- 레시피 검색 버튼 -->
                     <div id="globals-searchbtn">
                        <button class="HomePageBtn" id="HomePageSearchBtn" type="submit"
                           name="action" value="serchRecipe">
                           <span class="design_text"> 👉🏼 레시피 검색 </span>
                        </button>
                     </div>
                     
                  
               </div>
            </form>




            <div id="HomePageBestRecipe-container">
               <!-- Best 제목부분 -->
               <div id="HomePageBestTl-container">
                  <!-- '베스트 레시피' 글씨 -->
                  <span class="design_text" id="HomePageBestTlTxt">Best</span>

                  <!-- '베스트 레시피' 구분선 -->
                  <hr id="hr_HomePageBestRecipe" />
               </div>

               <!-- Best 레시피 추천 부분 -->
                  
               <div id="HomePage-BestRecipeContents-container">
               
                  <%
                  List<RecipeDTO> recipesList = (List<RecipeDTO>) request.getAttribute("recipes");
                  for (RecipeDTO r : recipesList) {
                  %>

                  <div class="HomePage-BestRecipe_Individual">
                     <!-- 폼으로 감싸서 데이터를 POST 방식으로 전송 -->
                     <form action="DetailRecipeService" method="post">

                        <!-- 숨겨진 input 요소로 레시피 정보를 전송 -->
                        <input type="hidden" name="recipeId" value="<%=r.getRecipe_idx()%>"> 

                        <div class="HomePageBestRecipe_Img-container">
                           <!-- 이미지를 클릭하면 폼이 전송되도록 설정 -->
                           <a href="javascript:void(0);"
                              onclick="this.closest('form').submit();"> <img
                              src="<%=r.getRecipe_img1()%>" alt="베스트 레시피 이미지"
                              class="HomePageBestRecipe_Img" />
                           </a>
                        </div>
                     </form>

                     <div class="HomePageBestRecipe_Txt-container">
                        <!-- '베스트 레시피' 게시글 미리보기 텍스트 -->
                        <span class="HomePageBestRecipe_Txt system_text"> <%=r.getRecipe_name()%>
                        </span>
                     </div>
                  </div>

                  <%
                  }
                  %>
               </div>
            </div>
            <!-- 마무리 -->






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
   </div>

   <script src="ImportFile/js/Hashtag.js"></script>
</body>
</html>