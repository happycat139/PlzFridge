package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // 세션 가져오기
        HttpSession session = request.getSession(); // 세션이 존재하지 않으면 null 반환
        session.getAttribute("user_id");
        if (session != null) {
            // 세션 무효화
            session.invalidate();
        }
        System.out.println("로그아웃성공");
        // 로그아웃 후 홈 페이지나 로그인 페이지로 리다이렉트
        response.sendRedirect("Login.jsp");
    }
		
		
		
		
		
		
	

}
