var isIdDuplicate = false;  // ID 중복 체크 결과 저장 변수

// ID 중복 체크 버튼 클릭 시 처리
document.getElementById("joinPageIdCheckBtn").addEventListener("click", function() {
    var userId = document.getElementsByName("userId")[0].value;

    // AJAX 요청을 사용하여 서버로 userId 전송
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "CheckIdService", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = xhr.responseText;
            var messageElement = document.getElementById("idCheckMessage");

            // 응답에 따른 메시지 처리
            if (response === "available") {
                messageElement.style.display = "inline";  // 메시지 표시
                messageElement.style.color = "green";  // 성공 메시지 색상 설정
                messageElement.textContent = "사용 가능한 ID 입니다.";
                isIdDuplicate = false;  // ID가 사용 가능
            } else if (response === "duplicate") {
                messageElement.style.display = "inline";  // 메시지 표시
                messageElement.style.color = "red";  // 실패 메시지 색상 설정
                messageElement.textContent = "이미 사용중인 ID 입니다.";
                isIdDuplicate = true;  // 중복된 ID
            }
        }
    };

    xhr.send("userId=" + encodeURIComponent(userId));
});

// Join Us 버튼 클릭 시 처리
document.getElementById("joinPageSubmit").addEventListener("click", function(event) {
    event.preventDefault();  // 기본 제출 동작을 막음

    // ID 중복 체크 여부 확인
    if (isIdDuplicate) {
        alert("이미 사용중인 ID입니다. 다른 ID를 입력하세요.");
    } else {
        // ID가 중복되지 않은 경우 폼을 제출
        document.querySelector("form").submit();  // 폼을 수동으로 제출
    }
});