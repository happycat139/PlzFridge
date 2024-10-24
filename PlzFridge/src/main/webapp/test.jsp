<%@page import="Model.RecipeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
boolean visit = false;

String userId = (String) session.getAttribute("user_id");

RecipeDAO recipeDAO = new RecipeDAO();

if (userId == null){
	visit = false;

}else{
	visit = true;
}
%>


<script>
        // 페이지 로드 시 세션 체크
        window.onload = function() {
            var isLoggedIn = <%= visit %>;

            // 로그인이 안 된 경우 confirm 창 띄우기
            if (!isLoggedIn) {
                var goToLogin = confirm("로그인 후 이용가능한 서비스 입니다.\n확인버튼 클릭 시 로그인페이지로 이동합니다.");
                if (goToLogin) {
                    window.location.href = "Login.jsp"; // 로그인 페이지로 리다이렉트
                } else {
                    // 취소를 누르면 홈 페이지로 이동 (또는 다른 페이지로 이동)
                    window.location.href = "Home.jsp";
                }
            }
        }
</script>
</body>
</html>