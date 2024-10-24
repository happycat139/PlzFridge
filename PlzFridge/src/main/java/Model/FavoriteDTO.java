package Model;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FavoriteDTO {

	
	private int fav_idx;
	
	private int recipe_idx;
	
	private String user_id;
	
	
	
	
	
	
	

	public int getFav_idx() {
		return fav_idx;
	}

	public void setFav_idx(int fav_idx) {
		this.fav_idx = fav_idx;
	}

	public int getRecipe_idx() {
		return recipe_idx;
	}

	public void setRecipe_idx(int recipe_idx) {
		this.recipe_idx = recipe_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
