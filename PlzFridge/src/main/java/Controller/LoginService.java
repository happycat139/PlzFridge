package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.UserDAO;
import Model.UserDTO;

public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

	      String userId = request.getParameter("userId"); // 폼에서 입력받은 ID
	      String userPw = request.getParameter("userPw");
	      
	      
	      UserDAO dao = new UserDAO();
	         
	       boolean result = dao.loginCheck(userId,userPw);
	      
	       if(result == true) {
	          HttpSession session = request.getSession();
	         session.setAttribute("user_id", userId); // 세션에 ID 저장

	         response.sendRedirect("Home.jsp"); // 게시글 작성 페이지로 리다이렉트
	          
	       }else {
	          
	          request.setAttribute("loginFailed", true);
	          RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
	            dispatcher.forward(request, response); // 로그인 페이지로 포워드
	          System.out.println("로그인실패");
	       }


	}

}
