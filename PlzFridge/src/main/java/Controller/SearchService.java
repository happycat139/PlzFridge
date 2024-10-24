package Controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.RecipeDAO;
import Model.RecipeDTO;


public class SearchService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("서블릿도착");
		
		RecipeDAO recipeDAO = new RecipeDAO();
		
		 // 사용자가 입력한 재료를 콤마로 구분하여 리스트로 변환
		
        String ingredientsInput = request.getParameter("ingredients"); // "tomato,onion"
        
        System.out.println(ingredientsInput);
        
        List<String> ingredients = Arrays.asList(ingredientsInput.split("\\s*,\\s*")); // 콤마로 분리하여 리스트로 변환
        
        // DAO를 통해 레시피 검색
        
        List<RecipeDTO> recipes = recipeDAO.findRecipesByIngredients(ingredients);
        
        for (RecipeDTO r : recipes) {
        	List<String> ingredientName = recipeDAO.getIngredientsByRecipeIdx(r.getRecipe_idx());
        	String ingredientsName = String.join(", ", ingredientName);
            r.setIngredientsName(ingredientsName); // 레시피에 재료 목록을 추가
        }

        // 결과를 JSP에 전달	
        request.setAttribute("ingredientsInput", ingredientsInput);
        request.setAttribute("recipes", recipes);
        request.getRequestDispatcher("/Recipe_Main.jsp").forward(request, response);
	}

}
