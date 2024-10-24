<%@page import="Model.EmojiDTO"%>
<%@page import="Model.EmojiDAO"%>
<%@page import="Model.CommentDTO"%>
<%@page import="Model.CommentDAO"%>
<%@page import="Model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="Model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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

<body>
	<%
	int boardIdx = Integer.parseInt(request.getParameter("b_idx"));
	String userId = (String) session.getAttribute("user_id");
	BoardDAO boardDAO = new BoardDAO();
	CommentDAO commentDAO = new CommentDAO();
	EmojiDAO emojiDAO = new EmojiDAO();

	List<EmojiDTO> emojiTypeCount = emojiDAO.emojiTypeCount(boardIdx);

	List<CommentDTO> userBoardcomment = commentDAO.allComment(boardIdx);
	List<BoardDTO> userBoard = boardDAO.userBoard(boardIdx, userId);

	for (BoardDTO b : userBoard) {
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

				</div>
			</header>



			<!-- 게시물 구역 시작 -->
			<div class="globals-content_container">

				<!-- 게시글시작 ⭐⭐⭐⭐⭐⭐⭐⭐ -->
				<div id="post_main_container">
					<!-- 작성자 정보 컨테이너 -->
					<div id="post_user_info">
						<div id="post_user_name">
							<h6>나의게시글</h6>
						</div>
					</div>

					<!-- 게시물 음영 컨테이너2 -->
					<!-- 게시물 이미지 컨테이너 -->
					<div id="post_photo">
						<img src="uploads/<%=b.getB_file()%>" alt="Uploaded Image" style="width: 95%">

					</div>

					<!-- 게시물 상호작용 버튼 컨테이너 -->
					<div id="post_click">
						<div id="post_a">

							<!-- 댓글 달기 버튼을 이미지로 변경 -->

						</div>


						<!-- 좋아요 버튼과 숫자 -->
						<%
						for (EmojiDTO e : emojiTypeCount) {
						%>
						<div class="post_emo_btn">
							<!-- 좋아요 버튼과 숫자 -->
							😍<span id="like-count-<%=e.getB_idx()%>"><%=e.getLike_count()%></span>


							<!-- 웃겨요 버튼과 숫자 -->
							🤣<span id="fun-count-<%=b.getB_idx()%>"><%=e.getFun_count()%>
							</span>

						</div>
						<%
						}
						%>
					</div>
					<div id="post_content">
						<span><%=b.getB_content()%></span>
					</div>
					<!-- 댓글 목록 -->
					<div class="comments">
						<%
						for (CommentDTO c : userBoardcomment) {
						%>

						<div class="comment" align="left">
							<span> <%=c.getUser_id()%> : <%=c.getCmt_content()%> <span
								id="comment_created_at"><%=c.getCreated_at()%></span>
							</span>
						</div>

						<%
						}
						%>
					</div>
				</div>


				<!-- 댓글 입력 창 -->

			</div>
		</div>
		<%
		}
		%>
	
</body>
</html>