package Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import DataBase.SqlSessionManager;

public class BoardDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<BoardDTO> allBoard() {
		List<BoardDTO> boards = new ArrayList<>();
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			boards = sqlSession.selectList("BoardDAO.allBoard");
		} catch (Exception e) {
			e.printStackTrace(); // 예외 처리
		}
		return boards;
	}

	public int writeBoard(BoardDTO board) {
		int result = 0;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			result = sqlSession.insert("BoardDAO.writeBoard", board);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 처리
		}
		return result;
	}

	public List<BoardDTO> myPost(String userId) {
		List<BoardDTO> boards = new ArrayList<>();
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			boards = sqlSession.selectList("BoardDAO.myPost", userId);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 처리
		}
		return boards;
	}

	public boolean deleteBoard(int boardIdx, String userId) {
		SqlSession session = sqlSessionFactory.openSession(true);
		try {
			System.out.println("dao도착");
			Map<String, Object> paramMap = new HashMap<>();

			paramMap.put("postId", boardIdx);
			paramMap.put("userId", userId);

			int result = session.delete("BoardDAO.deletePost", paramMap);

			System.out.println(result);

			return result > 0;

		} finally {
			session.close(); // 세션 닫기
		}
	}

	public List<BoardDTO> userBoard(int b_idx, String user_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("bIdx", b_idx);
		paramMap.put("userId", user_id);

		List<BoardDTO> result = session.selectList("BoardDAO.userboard", paramMap);

		return result;
	}

}
