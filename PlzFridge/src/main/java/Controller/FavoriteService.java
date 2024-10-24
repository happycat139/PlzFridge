package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.FavoriteDAO;


public class FavoriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        int recipeIdx = Integer.parseInt(request.getParameter("recipeIdx"));
        FavoriteDAO favoriteDAO = new FavoriteDAO();
        
        // JSON 응답을 위한 준비
        response.setContentType("application/json;charset=UTF-8");
        
        PrintWriter out = response.getWriter();

        // 비회원인 경우 처리
        if (userId == null) {
            out.write("{\"result\": \"not_logged_in\"}");
            return;
        }

        // 찜 여부 확인
        boolean isFavorited = favoriteDAO.isRecipeFavorited(userId, recipeIdx);

        if (isFavorited) {
            // 이미 찜한 경우 -> 찜 해제
            favoriteDAO.removeFavorite(userId, recipeIdx);
            out.write("{\"result\": \"removed\"}");
        } else {
            // 찜하지 않은 경우 -> 찜 추가
            favoriteDAO.addFavorite(userId, recipeIdx);
            out.write("{\"result\": \"added\"}");
        }
		
		
		
		
		
		
	}

}
