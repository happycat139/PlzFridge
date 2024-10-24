<%@page import="Model.UserDAO"%>
<%@page import="Model.BoardDTO"%>
<%@page import="Model.BoardDAO"%>
<%@page import="Model.BadgeDTO"%>
<%@page import="java.util.List"%>
<%@page import="Model.BadgeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<!-- 지역CSS -->
<link rel="stylesheet" type="text/css" href="ImportFile/css/MyPage.css">
<title>Insert title here</title>
</head>
<body>

	<!-- 베지/보드  -->
	<%
	boolean visit = false;

	String userId = (String) session.getAttribute("user_id");

	if (userId == null) {
		visit = false;

	} else {
		visit = true;
	}

	BadgeDAO badgeDAO = new BadgeDAO();
	List<BadgeDTO> badges = badgeDAO.showBadge(userId);
	request.setAttribute("badges", badges);

	BoardDAO boardDAO = new BoardDAO();
	List<BoardDTO> boards = boardDAO.myPost(userId);
	request.setAttribute("boards", boards);

	UserDAO userDAO = new UserDAO();
	String profileImage = userDAO.getProfileImage(userId);
	String userName = userDAO.getUserName(userId);
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
					<span class="general-pageTl design_text">마이페이지</span>
				</div>
			</header>

			<!-- 여기부터 content 구역 시작 -->

			<div class="globals-content_container">
				<!-- 이하 회원 프로필 컨테이너 -->
				<div class="myPage_profile-container">
					<!-- 회원 프로필 사진 출력부 -->



					<div class="myPage_profile-IMG">
						<img src="<%=profileImage%>" alt="마이페이지-회원프사" />
					</div>

					<!-- 회원 프로필 정보 출력부 컨테이너 -->
					<div class="myPage_profile_Info-container system_text">
						<!-- 회원 프로필-닉네임 컨테이너 -->

						<div class="myPage_profile_Info_userName-container">
							<h4><%=userName%></h4>
						</div>
						<!-- 회원 프로필-아이디 컨테이너 -->
						<div id="userinfo">

							<div class="myPage_profile_Info_userId-container">
								<span id="user_name"><%=userId%></span>
							</div>
							<div>
								<form id="logoutForm" action="LogoutService" method="get">
									<button type="button" class="logout-button"
										onclick="confirmLogout()">로그아웃</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 이상 회원 프로필 컨테이너 -->

				<!-- 회원 프로필-뱃지 컨테이너 -->
				<div id="myPage_profile_Info_userBdgs-container">
					<!--  '내 뱃지' 텍스트 & 구분선 컨테이너 -->
					<div class="header_HrPageTl-container myPage_userBdgs_hr_Txt">
						<!-- '내 뱃지' 구분선 -->
						<div>
							<hr class="general-Tl_hr r_DetailPage_Order_hr" />
						</div>
						<div>
							<span class="general-pageTl design_text Txt_myBdg">내 뱃지</span>
						</div>
					</div>
					<div class="myPage_userBdgs-Box">
						<c:forEach var="b" items="${badges}">
							<!-- 개별 뱃지-1 -->
							<div class="userBdg_IMG-container">
								<img src="ImportFile/imgs/${b.badgeImg}" alt="마이페이지-회원뱃지이미지-1" />
								<br /> <span class="myPage_bdg_name system_text">${b.badgeName}</span>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- 이상 회원 프로필-뱃지 컨테이너 -->
				<!-- ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐ -->

				<!-- 회원 프로필-내 게시글 컨테이너 -->
				<div id="myPage_profile_Info_userPosts-container">
					<!--  '내 게시글' 텍스트 & 구분선 컨테이너 -->
					<div class="header_HrPageTl-container myPage_userBdgs_hr_Txt">
						<!-- '내 게시글' 구분선 -->
						<div>
							<hr class="general-Tl_hr r_DetailPage_Order_hr" />
						</div>
						<div>
							<span class="general-pageTl design_text">내 게시글</span>
						</div>
					</div>
					<div class="myPage_userBdgs-Box">
						<c:forEach var="v" items="${boards}">
							<!-- 개별 게시물-1 -->
							<div id="mypage_mypost">
								<div class="userPosts_IMG-container">
									<a href="UserBoard.jsp?b_idx=${v.b_idx}"><img
										src="uploads/${v.b_file}" alt="게시글사진" /></a>
								</div>
								<form id="deleteForm-${v.b_idx}" action="DeleteBoardService"
									method="post">
									<input type="hidden" name="boardIdx" value="${v.b_idx}" />
									<button type="button" class="cutebutton"
										onclick="confirmDelete(${v.b_idx})">삭제하기</button>
								</form>
							</div>
						</c:forEach>

					</div>
				</div>
				<!-- 이상 회원 프로필-뱃지 컨테이너 -->
				<!-- ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐ -->
			</div>
			<!-- 이상 content 구역 끝 -->
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
   
     window.onload = function() {
           var isLoggedIn = <%=visit%>;

           // 로그인이 안 된 경우 confirm 창 띄우기
           if (!isLoggedIn) {
               var goToLogin = confirm("로그인 페이지로 이동하시겠습니까?");
               if (goToLogin) {
                   window.location.href = "Login.jsp"; // 로그인 페이지로 리다이렉트
               } else {
                   // 취소를 누르면 홈 페이지로 이동 (또는 다른 페이지로 이동)
                   window.location.href = "Home.jsp";
               }
           }
       }
     
    function confirmLogout() {
        var confirmLogout = confirm("로그아웃을 하시겠습니까?");
        if (confirmLogout) {
            document.getElementById("logoutForm").submit(); // 확인을 누르면 폼을 제출하여 로그아웃 실행
        } else {
            // 취소를 누르면 아무 동작도 하지 않음
        }
    }
    
    function confirmDelete(postId) {
        var confirmDelete = confirm("게시물을 삭제하시겠습니까?");
        if (confirmDelete) {
            document.getElementById("deleteForm-" + postId).submit(); // 해당 게시물 삭제 요청을 전송
        }
    }
    
 // 페이지 로드 시 세션 체크
  
</script>


</body>
</html>
