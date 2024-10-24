let audio;  // 전역 변수로 설정
let isPaused = false;  // 일시정지 상태 추적
let currentIndex = 0;  // 현재 재생 중인 문장의 인덱스 추적
let listItems = [];  // 문장 리스트


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

// 일시정지 함수
document.getElementById("pauseButton").addEventListener("click", function() {
	if (audio && audio.readyState >= 2) {
		audio.pause();
		isPaused = true;
	}
});

// 정지 함수
document.getElementById("stopButton").addEventListener("click", function() {
	if (audio) {
		audio.pause();
		audio.currentTime = 0;  // 정지: 재생 위치를 처음으로
		isPaused = false;
		currentIndex = 0;  // 처음부터 다시 재생하도록 설정
	}
});

// TTS 음성 재생 함수
function playTTS() {
	listItems = document.querySelectorAll("#ttstext li"); // 모든 li 요소 선택
	playNextStep(); // 첫 번째 문장 재생 시작
}

function playNextStep() {
	if (currentIndex < listItems.length) {
		let step = listItems[currentIndex].innerText.trim(); // 현재 li의 텍스트 가져오기

		if (step.length > 0) {
			// AJAX 요청 전송
			const xhr = new XMLHttpRequest();
			xhr.open("POST", "/PlzFridge/TTSService", true);
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

			xhr.send("text=" + encodeURIComponent(step)); // 각 문장을 TTS 서버로 전송
		}
	}
}




function toggleFavorite(recipeIdx) {
	const heartImg = document.getElementById('heart-img-' + recipeIdx);

	// AJAX 요청을 보냄
	const xhr = new XMLHttpRequest();
	xhr.open("POST", "FavoriteService", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			const response = JSON.parse(xhr.responseText);

			if (response.result === "not_logged_in") {
				alert('로그인 후 사용 가능합니다.');
			} else if (response.result === "added") {
				heartImg.src = "ImportFile/imgs/yellow-heart.png";
			} else if (response.result === "removed") {
				heartImg.src = "ImportFile/imgs/white-heart.png";
			}
		}
	};

	xhr.send("recipeIdx=" + recipeIdx);
} function toggleFavorite(recipeIdx) {
	const heartImg = document.getElementById('heart-img-' + recipeIdx);

	// AJAX 요청을 보냄
	const xhr = new XMLHttpRequest();
	xhr.open("POST", "FavoriteService", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			const response = JSON.parse(xhr.responseText);

			if (response.result === "not_logged_in") {
				alert('로그인 후 사용 가능합니다.');
			} else if (response.result === "added") {
				heartImg.src = "ImportFile/imgs/옐로하트-찜 버튼 after.png";
			} else if (response.result === "removed") {
				heartImg.src = "ImportFile/imgs/속빈하트-찜 버튼 before.png";
			}
		}
	};

	xhr.send("recipeIdx=" + recipeIdx);
}