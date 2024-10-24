package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.RecipeDAO;
import Model.RecipeDTO;


public class DetailRecipeService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String recipeIdStr = request.getParameter("recipeId");
		
		System.out.println(recipeIdStr);
        if (recipeIdStr != null) {
            try {
            	
            	
                int recipeId = Integer.parseInt(recipeIdStr);

                // DAO를 통해 레시피 상세 정보 가져오기
                RecipeDAO recipeDAO = new RecipeDAO();
                List<RecipeDTO> recipeDetail = recipeDAO.DetailRecipe(recipeId);

                // 레시피 정보를 request에 설정
                request.setAttribute("recipeDetail", recipeDetail);

                // 상세 정보를 표시할 JSP 페이지로 이동
                request.getRequestDispatcher("/Recipe_Detail.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid recipe ID");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Recipe ID is missing");
        }
		
		
		
		
		
		
		
		
		
		
		
	}

}
