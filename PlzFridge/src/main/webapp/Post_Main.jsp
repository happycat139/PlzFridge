<%@page import="Model.EmojiDTO"%>
<%@page import="Model.EmojiDAO"%>
<%@page import="Model.UserDAO"%>
<%@page import="Model.CommentDAO"%>
<%@page import="Model.CommentDTO"%>
<%@page import="Model.BoardDAO"%>
<%@page import="Model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="ImportFile/css/PostMain.css" />
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/PostUpload.css" />

<!-- jQuery CDN 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
</style>
</head>
<body>
	<%
	// 게시글 및 댓글 DAO 인스턴스 생성
	BoardDAO boardDAO = new BoardDAO();
	UserDAO userDAO = new UserDAO();
	CommentDAO commentDAO = new CommentDAO();
	EmojiDAO emojiDAO = new EmojiDAO();

	// 게시글 목록 불러오기
	List<BoardDTO> boards = boardDAO.allBoard();

	// 각 게시글에 해당하는 댓글 목록 불러오기
	for (BoardDTO board : boards) {
		List<CommentDTO> comments = commentDAO.allComment(board.getB_idx());
		// 각 게시글의 작성자의 프로필 이미지 가져오기
		String user_profile_img = userDAO.profileImage(board.getB_idx());
		board.setUser_profile_img(user_profile_img); // BoardDTO에 프로필 이미지 저장
		board.setComments(comments); // BoardDTO에 댓글 리스트를 저장
		List<EmojiDTO> typeCnt = emojiDAO.emojiTypeCount(board.getB_idx());
		board.setEmojiCount(typeCnt);
	}

	request.setAttribute("boards", boards);
	%>


	<div id="globals-container">
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
					<div class="logo_container" id="post_upld_logotl">
						<span class="title_text general-header_Title"> <span
							class="title_1">냉장고를</span> <br /> <span class="title_2">부탁해!</span>
						</span>
					</div>
				</div>
				<div class="header_HrPageTl-container">
					<!-- 헤더의 hr과 페이지명이 담긴 컨테이너 -->
					<!-- a태그이지만 버튼처럼 보인답니다~⭐` -->
					<a href="Post_Upload.jsp" id="btn-Post">+</a>
				</div>
			</header>



			<!-- 게시물 구역 시작 -->
			<div class="globals-content_container">
				<c:forEach var="b" items="${boards}">
					<!-- 게시글시작 ⭐⭐⭐⭐⭐⭐⭐⭐ -->
					<div id="post_main_container">
						<!-- 작성자 정보 컨테이너 -->
						<div id="post_user_info">
							<div id="post_user_logo">

								<img src="${b.user_profile_img}" alt="사용자로고" />
							</div>
							<div id="post_user_name">
								<h6>${b.user_id}</h6>
							</div>
						</div>

						<!-- 게시물 음영 컨테이너2 -->
						<!-- 게시물 이미지 컨테이너 -->
						<div id="post_photo">

							<img src="uploads/${b.b_file}" alt="Uploaded Image"
								style="width: 95%">
						</div>

						<!-- 게시물 상호작용 버튼 컨테이너 -->
						<div id="post_click">
							<div id="post_a">

								<!-- 댓글 달기 버튼을 이미지로 변경 -->
								<button type="button" class="comment-btn"
									data-post-id="${b.b_idx}">
									<img src="ImportFile/imgs/icon_comment.png" alt="댓글 달기">
								</button>
							</div>


							<!-- 좋아요 버튼과 숫자 -->

							<c:forEach var="e" items="${b.emojiCount}">
								<div class="post_emo_btn">
									<button class="like-btn" data-bidx="${b.b_idx}"
										data-emoji-type="like">
										😍<span id="like-count-${b.b_idx}">${e.like_count}</span>
									</button>

									<button class="fun-btn" data-bidx="${b.b_idx}"
										data-emoji-type="fun">
										🤣<span id="fun-count-${b.b_idx}">${e.fun_count}</span>
									</button>
								</div>
							</c:forEach>
						</div>
						<div id="post_content">
							<span>${b.b_content}</span>
						</div>
						<!-- 댓글 목록 -->
						<div class="comments">
							<c:forEach var="comment" items="${b.comments}">
								<div class="comment" align="left">
									<span> ${comment.user_id} : ${comment.cmt_content} <span
										id="comment_created_at">${comment.created_at}</span>
									</span>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:forEach>

				<!-- 댓글 입력 창 -->
				<div id="commentBox" class="comment-box">
					<form action="CommentService" method="post">
						<input type="hidden" name="b_idx" id="b_idx">
						<!-- 동적으로 설정될 게시글 ID -->
						<input type="hidden" name="user_id"
							value="${sessionScope.user_id}">
						<!-- 사용자 ID -->
						<p>댓글입력</p>
						<textarea name="cmt_content" class="comment-input"
							placeholder="댓글을 입력하세요"></textarea>
						<button type="submit" class="comment-btn-submit">댓글 등록</button>
					</form>
					<button type="button" id="close-commentBox" class="close-btn">닫기</button>
				</div>
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
	<script>
      
   let currentPostId = null; // 현재 댓글을 작성 중인 게시글의 ID 저장

    // 댓글 쓰기 버튼 클릭 시 댓글 입력 창이 슬라이드 업
    document.querySelectorAll('.comment-btn').forEach(button => {
        button.addEventListener('click', function(event) {
           console.log(event)
            // 클릭된 게시글의 ID 가져오기
            currentPostId = this.getAttribute('data-post-id');
            console.log("현재 게시글 ID: " + currentPostId); // 콘솔에 게시글 ID 출력 (디버깅용)
            
            // 가져온 게시글 ID (b_idx)를 폼의 hidden input에 설정
            document.getElementById('b_idx').value = currentPostId;
            
            // 댓글 창을 보여줌
            document.getElementById('commentBox').classList.add('active');
        });
    });
   
    document.getElementById('close-commentBox').addEventListener('click', function() {
        const commentBox = document.getElementById('commentBox');
        commentBox.classList.remove('active'); // active 클래스 제거 (슬라이드 다운)
    });
    
    
    document.querySelectorAll('.like-btn').forEach(button => {
        button.addEventListener('click', function() {
            let b_idx = this.getAttribute('data-bidx');
            let emoji_type = 'like'; // 좋아요 반응

            fetch('/PlzFridge/EmojiService', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ b_idx: b_idx, emoji_type: emoji_type })
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById("like-count-" + b_idx).innerText = data.likeCount;
            })
            .catch(error => console.error('Error:', error));
        });
    });

    // 웃겨요 버튼 이벤트 리스너
    document.querySelectorAll('.fun-btn').forEach(button => {
        button.addEventListener('click', function() {
            let b_idx = this.getAttribute('data-bidx');
            let emoji_type = 'fun'; // 웃겨요 반응

            fetch('/PlzFridge/EmojiService', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ b_idx: b_idx, emoji_type: emoji_type })
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById("fun-count-" + b_idx).innerText = data.likeCount;
            })
            .catch(error => console.error('Error:', error));
        });
    });
    
    
   </script>
</body>
</html>