package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.CommentDAO;
import Model.CommentDTO;

public class CommentService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("서블릿에 들어옴"); // 서블릿이 호출되는지 확인

		try {
			
			request.setCharacterEncoding("UTF-8");
			// 폼에서 전달된 데이터 받기
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			String user_id = request.getParameter("user_id");
			String cmt_content = request.getParameter("cmt_content");

			System.out.println("b_idx: " + b_idx); // 데이터 확인
			System.out.println("user_id: " + user_id);
			System.out.println("cmt_content: " + cmt_content);

			// 댓글 DTO 생성
			CommentDTO comment = new CommentDTO();
			comment.setB_idx(b_idx);
			comment.setUser_id(user_id);
			comment.setCmt_content(cmt_content);

			// DAO를 이용해 DB에 댓글 저장
			CommentDAO commentDAO = new CommentDAO();
			int result = commentDAO.insertComment(comment);

			System.out.println("DB Insert 결과: " + result); // DB 저장 결과 확인

			// 댓글 저장 후 게시물로 리다이렉트
			response.sendRedirect("Post_Main.jsp");
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 콘솔에 출력
		}
	}
}
