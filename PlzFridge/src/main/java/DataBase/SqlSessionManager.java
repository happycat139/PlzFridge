package DataBase;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

	public static SqlSessionFactory sqlSessionFactory;

	// 데이터베이스와 연결, SQL 실행에 대한 모든 것을 가진 중요한 객체
	static {

		String resource = "DataBase/mybatis-config.xml";
		Reader reader;

		try {
			// 파일 읽기
			reader = Resources.getResourceAsReader(resource);
			// DB관련 기능을 가진 SQLSessionFactory 만들기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {

			e.printStackTrace();
		}

	}

	public static SqlSessionFactory getSqlSession() {

		return sqlSessionFactory;
	}
}
