package Controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import Model.EmojiDAO;

public class EmojiService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("서블릿에 들어옴"); // 서블릿이 호출되는지 확인


    	 // JSON 데이터 파싱
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        // JSON 데이터 가져오기
        String requestData = sb.toString();
        JSONObject json = new JSONObject(requestData);
        int b_idx = json.getInt("b_idx");
        String emojiType = json.getString("emoji_type");

        System.out.println("b_idx: " + b_idx);  // 로그로 확인
        System.out.println("emoji_type: " + emojiType);
        
        // 세션에서 사용자 ID 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");

        // DAO를 통해 좋아요/웃겨요 여부 확인 및 처리
        EmojiDAO emojiDAO = new EmojiDAO();
        boolean isEmojiGiven = emojiDAO.isEmojiGiven(b_idx, userId, emojiType);

        if (isEmojiGiven) {
            // 이미 눌렀다면 반응 취소
            emojiDAO.removeEmoji(b_idx, userId, emojiType);
        } else {
            // 아직 안 눌렀다면 반응 추가
            emojiDAO.addEmoji(b_idx, userId, emojiType);
        }

        // 좋아요/웃겨요 수를 반환
        int emojiCount = emojiDAO.getEmojiCount(b_idx, emojiType);

        // 클라이언트로 JSON 형태로 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"likeCount\": " + emojiCount + "}");
    }

}
