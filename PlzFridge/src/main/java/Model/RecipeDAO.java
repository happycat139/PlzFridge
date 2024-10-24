package Model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionManager;

public class RecipeDAO {

	SqlSessionFactory sqlSessionManager = DataBase.SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionManager.openSession(true);

	public List<RecipeDTO> bestRecipe() {

		List<RecipeDTO> Recipe = new ArrayList<>();

		
			Recipe = sqlSession.selectList("RecipeDAO.topRecipe");
			System.out.println("22번째줄");
		

		System.out.println("레시피" + Recipe);

		return Recipe;

	}

	public List<RecipeDTO> findRecipesByIngredients(List<String> ingredients) {

		
			return sqlSession.selectList("RecipeDAO.findRecipesByIngredients", ingredients);
		
			
		
	}

	public List<RecipeDTO> DetailRecipe(int recipe_idx) {

		
			return sqlSession.selectList("RecipeDAO.getRecipeById", recipe_idx);
		
			
		

	}

	public List<RecipeDTO> selectFavoriteRecipesByUserId(String userId) {
		return sqlSession.selectList("RecipeDAO.selectFavoriteRecipesByUserId", userId);
	}

	public List<String> getIngredientsByRecipeIdx(int recipeIdx) {

		
		
		
		return sqlSession.selectList("RecipeDAO.getIngredientsByRecipeIdx" , recipeIdx);
	}

}
