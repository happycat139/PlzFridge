<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoinError</title>
</head>
<body>

<script>
window.onload = function() {
   
   if (true) {
        var goToLogin = confirm("잘못된값이입력되었습니다\n ->확인:로그인페이지로이동\n ->취소:비회원입자");
        if (goToLogin) {
            window.location.href = "JoinForm.jsp"; // 로그인 페이지로 리다이렉트
        } else {
            // 취소를 누르면 홈 페이지로 이동 (또는 다른 페이지로 이동)
            window.location.href = "Home.jsp";
        }
   }
   
}
</script>

</body>
</html>