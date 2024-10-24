package Model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class TalkDAO {

	SqlSessionFactory sqlSessionManager = DataBase.SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionManager.openSession(true);

	public int insertTalk(TalkDTO talk) {
		int result = 0;
		try {
			sqlSession.insert("TalkMapper.insertTalk", talk);
			// 자동 커밋이 설정되어 있으므로 따로 session.commit()을 호출할 필요 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 모든 글을 조회하는 메서드
	public List<TalkDTO> selectAllTalks() {
		List<TalkDTO> talks = null;
		try {
			talks = sqlSession.selectList("TalkMapper.selectAllTalks");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return talks;
	}

}
