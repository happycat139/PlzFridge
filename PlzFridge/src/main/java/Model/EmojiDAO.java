package Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import DataBase.SqlSessionManager;

public class EmojiDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 사용자가 해당 게시글에 이미 좋아요 또는 웃겨요를 눌렀는지 확인
	public boolean isEmojiGiven(int b_idx, String user_id, String emoji_type) {
		boolean result = false;
		try (SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> params = new HashMap<>();
			params.put("b_idx", b_idx);
			params.put("user_id", user_id);
			params.put("emoji_type", emoji_type);
			int count = session.selectOne("EmojiMapper.isEmojiGiven", params);
			result = (count > 0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 좋아요/웃겨요 추가
	public int addEmoji(int b_idx, String user_id, String emoji_type) {
		int result = 0;
		try (SqlSession session = sqlSessionFactory.openSession(true)) {
			Map<String, Object> params = new HashMap<>();
			params.put("b_idx", b_idx);
			params.put("user_id", user_id);
			params.put("emoji_type", emoji_type);
			result = session.insert("EmojiMapper.insertEmoji", params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 좋아요/웃겨요 삭제
	public int removeEmoji(int b_idx, String user_id, String emoji_type) {
		int result = 0;
		try (SqlSession session = sqlSessionFactory.openSession(true)) {
			Map<String, Object> params = new HashMap<>();
			params.put("b_idx", b_idx);
			params.put("user_id", user_id);
			params.put("emoji_type", emoji_type);
			result = session.delete("EmojiMapper.deleteEmoji", params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 게시글의 좋아요/웃겨요 수 가져오기
	public int getEmojiCount(int b_idx, String emoji_type) {
		int result = 0;
		try (SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> params = new HashMap<>();
			params.put("b_idx", b_idx);
			params.put("emoji_type", emoji_type);
			result = session.selectOne("EmojiMapper.getEmojiCount", params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<EmojiDTO> emojiTypeCount(int b_idx) {

		SqlSession session = sqlSessionFactory.openSession(true);
		List<EmojiDTO> emojidto = session.selectList("EmojiMapper.emojiTypeCount", b_idx);

		return emojidto;
	}

}
