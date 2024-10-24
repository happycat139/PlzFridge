<%@page import="Model.TalkDTO"%>
<%@page import="Model.TalkDAO"%>
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

/* 댓글 입력창 기본 스타일 */
#talkBox {
	background-color: white;
	box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
	border-top: 1px solid #ccc;
	width: 100%;
	max-width: 360px;
	height: 50%;
	padding: 20px;
	position: fixed;
	z-index: 1000;
	bottom: -100%; /* 처음에는 화면 아래로 숨김 */
	left: 50%; /* 화면 중앙에 맞게 위치 */
	transform: translateX(-50%);
	transition: bottom 0.3s ease-in-out;
}

/* 댓글 입력창 열림 */
#talkBox.open {
	bottom: 0; /* 화면 아래에서 위로 올라옴 */
}

#talk-btn {
	width: 125px;
	height: 28px;
	padding: 4px;
	margin-top: 10px;
	font-family: "BMHANNAPro";
	font-size: 13px;
	font-weight: 600;
	color: #777676;
	background-color: #fdf9ce;
	border-radius: 20px;
}

#talkForm {
	display: flex;
	flex-direction: column;
	align-items: center;
}

ul {
	list-style-type: none;
	padding: 0;
}

li {
	background-color: #f9f9f9;
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	margin-bottom: 15px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s, box-shadow 0.2s;
}

li:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

h1 {
	font-family: 'BMHANNAPro', sans-serif;
}

h3 {
	font-family: 'BMHANNAPro', sans-serif;
	font-size: 1.8rem;
	color: #3D566E;
	margin-bottom: 10px;
}

p {
	font-family: 'Open Sans', sans-serif;
	font-size: 1.2rem;
	color: #555;
	line-height: 1.6;
}

input[name="talk_title"] {
	background-color: whitesmoke;
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-family: Open Sans;
	font-size: 14px;
}

textarea#talk_content {
	background-color: whitesmoke;
	width: 100%;
	height: 100px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	resize: none;
	font-family: Open Sans;
	font-size: 14px;
	margin-bottom: 15px;
}

#talk_submit {
	width: 125px;
	height: 28px;
	padding-top: 4px;
	padding-bottom: 4px;
	margin-top: 10px;
	text-align: center;
	font-family: "BMHANNAPro";
	font-size: 13px;
	font-weight: 600;
	color: #777676;
	background-color: #fdf9ce;
	border-radius: 20px;
	cursor: pointer;
	border: 2px solid #6b6a6a98;
	box-shadow: 1.5px 2px 4px rgba(65, 65, 65, 0.25);
}

/* 닫기 버튼 */
.close-btn {
	background-color: pink;
	color: white;
	border: none;
	border-radius: 15px;
	padding: 10px;
	cursor: pointer;
	font-size: 12px;
	position: absolute;
	top: 10px;
	right: 10px;
	width: 50px;
	text-align: center;
}

/* 재생 및 정지 버튼 스타일 */
button#playButton, button#pauseButton, button#stopButton, button.playButton,
	button.stopButton {
	background-color: #ffccd5; /* 연한 핑크색 */
	border: none;
	border-radius: 20px;
	padding: 6px 12px;
	font-family: 'BMHANNAPro', sans-serif;
	font-family: 'Open Sans', sans-serif;
	font-size: 12px; /* 버튼 글씨 크기를 작게 */
	color: #34495E; /* 글씨를 잘 보이게 진한 회색 계열로 설정 */
	cursor: pointer;
	margin-right: 5px;
	margin-top: 5px;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

/* 버튼 호버 시 스타일 */
button.playButton:hover, button.stopButton:hover {
	background-color: #ffb3c1; /* 조금 더 진한 핑크색으로 변경 */
	box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
}

/* 버튼 클릭 시 색상 */
button.playButton:active, button.stopButton:active {
	background-color: #ffa7b5; /* 클릭 시 더 진한 핑크 */
}
</style>
</head>
<body>

	<%
	// DAO를 통해 모든 글을 조회
	TalkDAO talkDAO = new TalkDAO();
	List<TalkDTO> talks = talkDAO.selectAllTalks();
	%>


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
					<span class="general-pageTl design_text">쿡톡!</span>
					<button id="talk-btn">사연등록</button>
				</div>
			</header>



			<h1>모든 글 듣기</h1>
			<button class="button" id="playButton">재생</button>
			<button class="button" id="pauseButton">일시정지</button>
			<button class="button" id="stopButton">정지</button>
			<%
			if (talks != null && !talks.isEmpty()) {
			%>
			<ul class="post-list">
				<%
				for (TalkDTO talk : talks) {
				%>
				<li class="post-item">
					<h3 class="post-title">
						<%=talk.getTk_title()%></h3> <!-- talk_content는 화면에 보이지 않게 숨김 -->
					<p class="post-content" style="display: none;"><%=talk.getTk_content()%></p>

					<!-- 재생 및 정지 버튼 추가 -->
					<button class="playButton" data-title="<%=talk.getTk_title()%>"
						data-content="<%=talk.getTk_content()%>">재생</button>
					<button class="stopButton">정지</button>
				</li>
				<%
				}
				%>
			</ul>
			<%
			} else {
			%>
			<p>등록된 글이 없습니다.</p>
			<%
			}
			%>



			<!-- 댓글 입력 창 -->
			<div id="talkBox">
				<form id="talkForm">
					<input type="hidden" name="b_idx" id="b_idx">

					<!-- 사용자 ID -->
					<p>당신의 재밌는 사연을 들려주세요!</p>
					<input type="text" name="talk_title" id="talk_title">
					<textarea name="talk_content" id="talk_content"
						placeholder="당신의 이야기를 기다립니다!"></textarea>
					<input type="submit" id="talk_submit" value="사연 보따리 등록">
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
		
	const talkBtn = document.getElementById('talk-btn');
	const talkBox = document.getElementById('talkBox');
	const closeCommentBox = document.getElementById('close-commentBox');

	// 사연등록 버튼을 눌렀을 때 talkBox가 슬라이드 업
	talkBtn.addEventListener('click', function() {
	    talkBox.classList.add('open');
	});

	// 닫기 버튼을 눌렀을 때 talkBox가 슬라이드 다운
	closeCommentBox.addEventListener('click', function() {
	    talkBox.classList.remove('open');
	});

	// 폼 제출 시 데이터를 서버로 전송
	document.getElementById('talkForm').addEventListener('submit', function(event) {
	    event.preventDefault();

	    const talkTitle = document.getElementById('talk_title').value;
	    const talkContent = document.getElementById('talk_content').value;

	    fetch('/PlzFridge/TalkService', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
	        body: new URLSearchParams({
	            tk_title: talkTitle,
	            tk_content: talkContent
	        })
	    }).then(response => {
	        if (response.ok) {
	            // 페이지를 새로고침하여 글을 즉시 표시
	            location.reload(); 
	        } else {
	            console.error('사연 등록에 실패했습니다.');
	        }
	    });
	});
	
	
	let audio;  // 전역 변수로 설정
	let isPaused = false;  // 일시정지 상태 추적
	let currentIndex = 0;  // 현재 재생 중인 문장의 인덱스 추적
	let listItems = [];  // 전체 문장 리스트

	// 전체 재생 함수 (전체 글 목록을 읽어줌)
	document.getElementById("playButton").addEventListener("click", function() {
	    if (audio && !audio.paused) {
	        // 이미 재생 중인 경우: 음성을 멈추고 처음부터 재생
	        audio.pause();
	        audio.currentTime = 0; // 재생 위치를 처음으로 설정
	    }

	    // 음성 재생
	    currentIndex = 0;  // 새로운 재생 시 첫 문장부터 시작
	    playTTS();
	});

	// 일시정지 함수 (전체 읽기 일시정지)
	document.getElementById("pauseButton").addEventListener("click", function() {
	    if (audio && audio.readyState >= 2) {
	        audio.pause();
	        isPaused = true;
	    }
	});

	// 정지 함수 (전체 읽기 정지)
	document.getElementById("stopButton").addEventListener("click", function() {
	    if (audio) {
	        audio.pause();
	        audio.currentTime = 0;  // 정지: 재생 위치를 처음으로
	        isPaused = false;
	        currentIndex = 0;  // 처음부터 다시 재생하도록 설정
	    }
	});

	// TTS 음성 재생 함수 (전체 읽기)
	function playTTS() {
	    listItems = document.querySelectorAll('.post-item'); // 모든 .post-item 요소 선택
	    playNextStep(); // 첫 번째 문장 재생 시작
	}

	// 전체 문장을 순차적으로 읽어주는 함수
	function playNextStep() {
	    if (currentIndex < listItems.length) {
	        let title = listItems[currentIndex].querySelector('.post-title').innerText.trim(); // 제목 가져오기
	        let content = listItems[currentIndex].querySelector('.post-content').innerText.trim(); // 숨겨진 내용 가져오기
	        let textToRead = "제목: " + title + ". 내용: " + content; // 제목과 내용을 결합

	        if (textToRead.length > 0) {
	            // AJAX 요청 전송
	            const xhr = new XMLHttpRequest();
	            xhr.open("POST", "/PlzFridge/MTTSService", true);
	            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	            xhr.responseType = "blob";

	            xhr.onload = function() {
	                if (xhr.status === 200) {
	                    const audioBlob = xhr.response;
	                    const audioUrl = URL.createObjectURL(audioBlob);
	                    audio = new Audio(audioUrl);
	                    audio.preload = "auto";  // 미리 로드 설정

	                    // 오디오가 끝나면 다음 문장을 재생
	                    audio.onended = function() {
	                        currentIndex++;
	                        setTimeout(playNextStep, 2000);  // 2초 텀 후 다음 문장 재생
	                    };

	                    audio.play();
	                } else {
	                    console.error("TTS 요청 실패: " + xhr.statusText);
	                }
	            };

	            xhr.send("text=" + encodeURIComponent(textToRead)); // 제목과 내용을 인코딩 후 전송
	        }
	    }
	}

	// 개별 재생 및 정지 기능 (각 제목별 재생/정지)
	document.querySelectorAll('.playButton').forEach(button => {
	    button.addEventListener('click', function() {
	        const title = this.getAttribute('data-title');
	        const content = this.getAttribute('data-content');

	        // 제목과 내용을 인코딩해서 서버로 전송
	        const textToRead = "제목: " + title + ". 내용: " + content;

	        // 이미 재생 중인 오디오가 있다면 멈추고 처음부터 재생
	        if (audio && !audio.paused) {
	            audio.pause();
	            audio.currentTime = 0; // 오디오를 처음부터 시작하게 만듦
	        }

	        // AJAX 요청 전송 (TTS 서비스 호출)
	        const xhr = new XMLHttpRequest();
	        xhr.open("POST", "/PlzFridge/MTTSService", true);
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	        xhr.responseType = "blob";

	        xhr.onload = function() {
	            if (xhr.status === 200) {
	                const audioBlob = xhr.response;
	                const audioUrl = URL.createObjectURL(audioBlob);
	                audio = new Audio(audioUrl);
	                audio.preload = "auto";  // 미리 로드 설정

	                audio.play();  // 음성 재생
	            } else {
	                console.error("TTS 요청 실패: " + xhr.statusText);
	            }
	        };

	        xhr.send("text=" + encodeURIComponent(textToRead)); // 제목과 내용을 인코딩 후 전송
	    });
	});

	// 개별 정지 버튼 클릭 시 오디오 중단
	document.querySelectorAll('.stopButton').forEach(button => {
	    button.addEventListener('click', function() {
	        if (audio) {
	            audio.pause();  // 재생 중인 오디오 중단
	            audio.currentTime = 0;  // 오디오를 처음 상태로 리셋
	        }
	    });
	});


	</script>
</body>
</html>