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
<!-- 지역CSS -->
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/JoinForm.css">
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/Sel_Profile.css">
<link rel="stylesheet" type="text/css"
	href="ImportFile/css/joinForm_SelProFile.css">
<title>Insert title here</title>

</head>
<body>
	<!-- 전역 컨테이너 -->
	<div class="globals-container">
		<div class="globals-space" id="JoinPage-space" align="center">
			<!-- 타이틀&로고 -->
			<!-- (수정 항목 : 로고&타이틀 배열 방향, 디자인 디테일) -->
			<div class="logo_container" id="joinPageLogo-container">
				<!-- 냉부로고 사이즈 120 -->
				<img src="ImportFile/imgs/logoM.png" alt="냉부로고" id="joinPageLogoImg" />

				<!-- 타이틀 위치 (가로 배치, 폰트 사이즈 조정) -->
				<h2 class="title_text" id="joinPageLogoTitle">
					<span class="title_text title_1">냉장고를</span> <br /> <span
						class="title_text title_2">부탁해!</span>
				</h2>
			</div>

			<!-- 회원가입 정보 입력창 -->
			<form action="JoinService" method="post">
				<div class="input_container design_text joinPageInput">
					<input type="text" name="userName" placeholder="이름 또는 별명을 입력하세요" />
					<input type="text" name="userId" placeholder="ID를 입력하세요" />
				</div>

				<!-- ID 중복체크 버튼 -->
				<div class="JoinPageIdCheck-container">
					<button class="btn b_pink" id="joinPageIdCheckBtn" type="button"
						name="idCheck" value="btn-New-ID">
						<span class="design_text" id="joinPageIdCheckBtnTxt">중복확인</span>
					</button>
					<!-- ⭐⭐ 추후, Script로 hidden 메세지 추가 
                    : "사용 가능한 아이디 입니다." OR "사용이 불가능한 아이디 입니다." ⭐⭐ -->
					<div>
						<span class="system_text" id="idCheckMessage"
							style="display: none;"></span>
						<!-- <span class="system_text idc_Fail">사용이 불가능한 ID 입니다.</span> -->
					</div>
				</div>

				<div class="input_container design_text joinPageInput_2">
					<input type="password" name="userPw" placeholder="PW를 입력하세요" /> <input
						type="password" name="user_pw_Check" placeholder="PW 확인" /> <input
						id="JoinPageInputEmail" type="text" name="userEmail"
						placeholder="이메일을 입력하세요" />

				</div>
				
				<div>
				<button id="profileSettingBtn" type="button"
					class="JoinPage_SelProfile_Btn b_pink">
					<span class="JoinPage_SelProfile_Btn_Txt">내 프로필 👩‍🍳<br />이미지
						고르기
					</span>
				<input type="hidden" id="profileImagePath" name="profileImagePath" />
				</button>
				</div>
				
				<!-- '회원가입환영.jsp(가상)' OR 'Home.jsp' 페이지 이동 -->
				<div>
				<button class="btn b_green design_text" id="joinPageSubmit"
					type="submit" name="action" value="btn-Join">
					<span class="design_text" id="joinPageSubmitTxt">Join Us</span>
				</button>
				</div>
				
			</form>

		</div>
	</div>


	<!-- 모달 창 -->
	<div id="profileModal" class="modal">
		<div class="modal-content">
			<!-- 여기부터 content 구역 시작 -->
			<div class="globals-content_container">
				<!-- 💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛 -->
				<!-- 여기부터 프로필 선택창 컨테이너 시작 -->
				<div class="lightPage-container">
					<!-- 💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛 -->
					<!-- 엑스(뒤로가기) 버튼 컨테이너 -->
					<div class="sel_Profile_Xbtn-container">
						<!-- 엑스(뒤로가기) 버튼 -->
						<!-- ❗type이 submit인지 button인지??? -->
						<button class="sel_Profile_Xbtn" type="button" name="action"
							value="btn-back" id="closeModal">&times;</button>
					</div>
					<!-- 💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛 -->
					<!-- '프로필을 선택해주세요' 문구 컨테이너 -->
					<div class="sel_Profile_Txt-container">
						<h3 class="design_text">프로필을 선택해주세요😊</h3>
					</div>
					<!-- 💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛 -->
					<!-- 프로필 사진 예시 전체 컨테이너 -->
					<div class="sel_Profile_IMG-container">
						<!-- 🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍 -->
						<!-- 프로필 사진 예시 개별 컨테이너-1 -->
						<!-- ❗버튼을 '클릭'하면 테두리가 생기는 JavaScript -->
						<div class="sel_Profile_IMG_individual-container">
							<!-- 프로필 사진 예시-1 -->
							<!-- ❗프로필 사진 예시 버튼 value는 '이미지 이름.png' -->
							<button class="sel_Profile_IMG_individual-Btn" type="button"
								name="sel_Profile_IMG-Btn" value="selProfile_animalCook_(1).jpg"
								onclick="selectProfileImage('ImportFile/imgs/selProfile_animalCook_(1).jpg')">
								<img class="sel_Profile_IMG"
									src="ImportFile/imgs/selProfile_animalCook_(1).jpg"
									alt="프로필사진 1" />
							</button>
						</div>
						<!-- 🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍 -->
						<!-- 프로필 사진 예시 개별 컨테이너-2 -->
						<!-- ❗버튼을 '클릭'하면 테두리가 생기는 JavaScript -->
						<div class="sel_Profile_IMG_individual-container">
							<!-- 프로필 사진 예시-2 -->
							<!-- ❗프로필 사진 예시 버튼 value는 '이미지 이름.png' -->
							<button class="sel_Profile_IMG_individual-Btn" type="button"
								name="sel_Profile_IMG-Btn" value="selProfile_animalCook_(2).jpg"
								onclick="selectProfileImage('ImportFile/imgs/selProfile_animalCook_(2).jpg')">
								<img class="sel_Profile_IMG"
									src="ImportFile/imgs/selProfile_animalCook_(2).jpg"
									alt="프로필사진 2" />
							</button>
						</div>
						<!-- 🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍 -->
						<!-- 프로필 사진 예시 개별 컨테이너-3 -->
						<!-- ❗버튼을 '클릭'하면 테두리가 생기는 JavaScript -->
						<div class="sel_Profile_IMG_individual-container">
							<!-- 프로필 사진 예시-2 -->
							<!-- ❗프로필 사진 예시 버튼 value는 '이미지 이름.png' -->
							<button class="sel_Profile_IMG_individual-Btn" type="button"
								name="sel_Profile_IMG-Btn" value="selProfile_animalCook_(3).png"
								onclick="selectProfileImage('ImportFile/imgs/selProfile_animalCook_(3).png')">
								<img class="sel_Profile_IMG"
									src="ImportFile/imgs/selProfile_animalCook_(3).png"
									alt="프로필사진 예시" />
							</button>
						</div>
						<!-- 🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍 -->
						<!-- 프로필 사진 예시 개별 컨테이너-4 -->
						<!-- ❗버튼을 '클릭'하면 테두리가 생기는 JavaScript -->
						<div class="sel_Profile_IMG_individual-container">
							<!-- 프로필 사진 예시-2 -->
							<!-- ❗프로필 사진 예시 버튼 value는 '이미지 이름.png' -->
							<button class="sel_Profile_IMG_individual-Btn" type="button"
								name="sel_Profile_IMG-Btn" value="selProfile_animalCook_(4).jpg"
								onclick="selectProfileImage('ImportFile/imgs/selProfile_animalCook_(4).jpg')">
								<img class="sel_Profile_IMG"
									src="ImportFile/imgs/selProfile_animalCook_(4).jpg"
									alt="프로필사진 예시" />
							</button>
						</div>
						<!-- 🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍 -->
						<!-- 프로필 사진 예시 개별 컨테이너-5 -->
						<!-- ❗버튼을 '클릭'하면 테두리가 생기는 JavaScript -->
						<div class="sel_Profile_IMG_individual-container">
							<!-- 프로필 사진 예시-2 -->
							<!-- ❗프로필 사진 예시 버튼 value는 '이미지 이름.png' -->
							<button class="sel_Profile_IMG_individual-Btn" type="button"
								name="sel_Profile_IMG-Btn" value="selProfile_animalCook_(5).jpg"
								onclick="selectProfileImage('ImportFile/imgs/selProfile_animalCook_(5).jpg')">
								<img class="sel_Profile_IMG"
									src="ImportFile/imgs/selProfile_animalCook_(5).jpg"
									alt="프로필사진 예시" />
							</button>
						</div>
						<!-- 🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍 -->
						<!-- 프로필 사진 예시 개별 컨테이너-6 -->
						<!-- ❗버튼을 '클릭'하면 테두리가 생기는 JavaScript -->
						<div class="sel_Profile_IMG_individual-container">
							<!-- 프로필 사진 예시-2 -->
							<!-- ❗프로필 사진 예시 버튼 value는 '이미지 이름.png' -->
							<button class="sel_Profile_IMG_individual-Btn" type="button"
								name="sel_Profile_IMG-Btn" value="selProfile_animalCook_(6).jpg"
								onclick="selectProfileImage('ImportFile/imgs/selProfile_animalCook_(6).jpg')">
								<img class="sel_Profile_IMG"
									src="ImportFile/imgs/selProfile_animalCook_(6).jpg"
									alt="프로필사진 예시" />
							</button>
						</div>
						<!-- 🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍🤍 -->
					</div>
					<!-- 💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛 -->
					<!-- '선택 완료' 버튼 컨테이너 -->
					<div class="sel_Profile_Choice_btn-container">
						<!-- '선택 완료' 버튼 -->
						<button class="sel_Profile_Choice_btn" type="submit" name="action"
							value="btn-sel_Profile" id="selectProfileBtn">
							<span class="design_text">👉🏼 선택완료</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="ImportFile/js/CheckId.js"></script>

	<script>
		// 모달 열기/닫기 스크립트
		var modal = document.getElementById("profileModal");
		var btn = document.getElementById("profileSettingBtn");
		var closeBtn = document.getElementById("closeModal");
		var selectedProfileImage = "";

		// 프로필 설정 버튼 클릭 시 모달 열기
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// 닫기 버튼 클릭 시 모달 닫기
		closeBtn.onclick = function() {
			modal.style.display = "none";
		}

		// 모달 외부 클릭 시 닫기
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

		// 이미지 선택
		function selectProfileImage(imagePath) {
			selectedProfileImage = imagePath;

			// 선택된 상태로 만들기 (기존 선택 해제)
			var buttons = document
					.querySelectorAll('.sel_Profile_IMG_individual-Btn');
			buttons.forEach(function(btn) {
				btn.classList.remove('selected');
			});

			// 선택된 이미지에 테두리 추가
			event.target.parentElement.classList.add('selected');
		}

		// 선택 완료 버튼 클릭 시
		document.getElementById("selectProfileBtn").onclick = function() {
			if (selectedProfileImage) {
				// 선택한 이미지를 숨겨진 필드에 설정
				document.getElementById("profileImagePath").value = selectedProfileImage;
				modal.style.display = "none"; // 모달 닫기
			} else {
				alert("프로필 이미지를 선택해주세요.");
			}
		}
	</script>


</body>
</html>