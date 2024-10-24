package Model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import DataBase.SqlSessionManager;

public class CommentDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 댓글 등록
	public int insertComment(CommentDTO comment) {
		int result = 0;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			result = sqlSession.insert("CommentDAO.insertComment", comment);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 처리
		}
		return result;
	}

	public List<CommentDTO> allComment(int b_idx) {
		List<CommentDTO> comments = null;
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
			comments = sqlSession.selectList("CommentDAO.allComment", b_idx);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 처리
		}
		return comments;
	}

}