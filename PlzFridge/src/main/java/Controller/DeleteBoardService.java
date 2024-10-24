package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BoardDAO;


public class DeleteBoardService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("게시판삭제서비스도착");
		
		int postId = Integer.parseInt(request.getParameter("boardIdx"));     
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("user_id");
		
        // 게시물 삭제를 처리하는 DAO 호출
		System.out.println(postId);
		System.out.println(userId);
        BoardDAO boardDAO = new BoardDAO();
        boolean isDeleted = boardDAO.deleteBoard(postId,userId);
		
        System.out.println(isDeleted);
        
        if (isDeleted) {
            // 삭제 성공 시 마이페이지로 리다이렉트
            response.sendRedirect("MyPage.jsp");
        } else {
            // 삭제 실패 시 처리 (예: 오류 메시지)
            response.getWriter().println("게시물 삭제에 실패했습니다.");
        }
		
		
		
	}

}
