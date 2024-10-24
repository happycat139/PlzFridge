package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UserDAO;


public class CheckIdService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		 request.setCharacterEncoding("UTF-8");
		 System.out.println("CheckIdService도착");
	        // 폼에서 전달된 userId 값 가져오기
	     String userId = request.getParameter("userId");

	        // DAO를 통해 DB에서 중복 여부 확인
	        UserDAO dao = new UserDAO();
	        boolean isDuplicate = dao.checkUserId(userId);

	        // 결과에 따라 응답 전송
	        if (isDuplicate) {
	            response.getWriter().write("duplicate");
	        } else {
	            response.getWriter().write("available");
	        }
	}

}
