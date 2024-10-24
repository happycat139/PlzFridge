package Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RecipeDTO {

	

	//레시피 식별자
	private int recipe_idx;
	//레시피 이름
	private String recipe_name;
	//레시피 내용
	private String recipe_cooking_guide;
	//레시피 이미지 
	private String recipe_img1;
	//레시피 재료
	private String recipe_use_ingre;
	
	private String ingredientsName;
	
	
	//생성자
	public RecipeDTO(String recipe_name, String recipe_img1) {

		this.recipe_name = recipe_name;
		this.recipe_img1 = recipe_img1;
	}
	
	


	//getter&setter
	public int getRecipe_idx() {
		return recipe_idx;
	}

	public void setRecipe_idx(int recipe_idx) {
		this.recipe_idx = recipe_idx;
	}

	public String getRecipe_use_ingre() {
		return recipe_use_ingre;
	}


	public void setRecipe_use_ingre(String recipe_use_ingre) {
		this.recipe_use_ingre = recipe_use_ingre;
	}
	
	public String getRecipe_name() {
		return recipe_name;
	}


	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}


	public String getRecipe_cooking_guide() {
		return recipe_cooking_guide;
	}


	public void setRecipe_cooking_guide(String recipe_cooking_guide) {
		this.recipe_cooking_guide = recipe_cooking_guide;
	}


	public String getRecipe_img1() {
		return recipe_img1;
	}


	public void setRecipe_img1(String recipe_img1) {
		this.recipe_img1 = recipe_img1;
	}




	public String getIngredientsName() {
		return ingredientsName;
	}




	public void setIngredientsName(String ingredientsName) {
		this.ingredientsName = ingredientsName;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
