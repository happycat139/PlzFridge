package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.TalkDAO;
import Model.TalkDTO;

public class TalkService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("서블릿에 들어옴"); // 서블릿 호출 확인

		try {
			request.setCharacterEncoding("UTF-8");
			String tk_title = request.getParameter("tk_title");
			String tk_content = request.getParameter("tk_content");

			System.out.println("tk_title: " + tk_title);
			System.out.println("tk_content: " + tk_content);

			// TalkDTO 생성 및 데이터 설정
			TalkDTO talk = new TalkDTO();
			talk.setTk_title(tk_title); // 제목 설정
			talk.setTk_content(tk_content); // 내용 설정

			// DAO를 통해 DB에 데이터 삽입
			TalkDAO talkDAO = new TalkDAO();
			int result = talkDAO.insertTalk(talk);

			// 결과 확인
			System.out.println("DB Insert 결과: " + result);

			// 데이터 저장 후 페이지 리다이렉트
			response.sendRedirect("User_Talk.jsp");
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 출력
		}
	}
}
