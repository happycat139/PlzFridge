package Model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionManager;



public class FavoriteDAO {

	
	SqlSessionFactory sqlSessionManager = DataBase.SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionManager.openSession(true);
	
	// 찜 여부 확인
    public boolean isRecipeFavorited(String userId, int recipeIdx) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", userId);
        params.put("recipe_idx", recipeIdx);
        return sqlSession.selectOne("isRecipeFavorited", params);
    }

    // 찜 추가
    public void addFavorite(String userId, int recipeIdx) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", userId);
        params.put("recipe_idx", recipeIdx);
        sqlSession.insert("addFavorite", params);
    }

    // 찜 삭제
    public void removeFavorite(String userId, int recipeIdx) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", userId);
        params.put("recipe_idx", recipeIdx);
        sqlSession.delete("removeFavorite", params);
    }
	
	
	
	
	
	
	
	
	
}
