package Model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mindrot.jbcrypt.BCrypt;

import DataBase.SqlSessionManager;

public class UserDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int join(UserDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		String encryptedPassword = BCrypt.hashpw(dto.getUserPw(), BCrypt.gensalt());
		dto.setUserPw(encryptedPassword);
		int result = sqlSession.insert("join", dto);
		if (result > 0) {
			System.out.println("회원 가입 성공!");
		}
		sqlSession.close();
		return result;
	}

	public boolean logIn(UserDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true); // 세션 열기
		int result;

		try {
			result = sqlSession.selectOne("UserDAO.logIn", dto);
			if (result > 0) {
				return true;
			} else {
				return false;
			}
		} finally {
			sqlSession.close(); // 세션 닫기
		}
	}

	public String getProfileImage(String userId) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		String profileImage = null;

		profileImage = sqlSession.selectOne("UserDAO.getprofileImage", userId);

		// 세션 종료는 finally에서 해야지, 예외가 발생해도 세션이 안전하게 닫힘
		sqlSession.close();
		return profileImage;
	}

	public String getUserName(String userId) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		String userName = null;

		try {
			userName = sqlSession.selectOne("UserDAO.getUserName", userId);
		} finally {
			sqlSession.close();
		}

		return userName;
	}

	public boolean checkUserId(String userId) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int count = sqlSession.selectOne("UserDAO.checkUserId", userId);

		return count > 0; // ID가 존재하면 true 반환

	}

	public boolean loginCheck(String userId, String userPw) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		String hashPw = sqlSession.selectOne("UserDAO.checkPW", userId);
		if (BCrypt.checkpw(userPw, hashPw)) {
			return true; // 비밀번호 일치
		} else {
			return false; // 비밀번호 불일치
		}

	}
	public String profileImage(int b_idx) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
	      String user_profile_img = null;
	      user_profile_img = sqlSession.selectOne("UserDAO.profileImage", b_idx);
	      return user_profile_img;

	   }
}