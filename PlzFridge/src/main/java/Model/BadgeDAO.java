package Model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import DataBase.SqlSessionManager;

public class BadgeDAO {

   SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

   
   public int insertBadge1(String userId) {
      int result = 0;
      System.out.println("뱃지추가: " + userId); 
      try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
         result = sqlSession.insert("MyPageMapper.insertBadge1", userId);
      } catch (Exception e) {
         e.printStackTrace(); // 예외 처리
      }
      return result;
   }
   
   public int insertBadge2(String userId) {
      int result = 0;
      try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
         result = sqlSession.insert("MyPageMapper.insertBadge2", userId);
      } catch (Exception e) {
         e.printStackTrace(); // 예외 처리
      }
      return result;
   }

   public int insertBadge3(String userId) {
      int result = 0;
      try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
         result = sqlSession.insert("MyPageMapper.insertBadge3", userId);
      } catch (Exception e) {
         e.printStackTrace(); // 예외 처리
      }
      return result;
   }
   
   public int insertBadge4(String userId) {
      int result = 0;
      try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
         result = sqlSession.insert("MyPageMapper.insertBadge4", userId);
      } catch (Exception e) {
         e.printStackTrace(); // 예외 처리
      }
      return result;
   }
   
   public int insertBadge5(String userId) {
      int result = 0;
      try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
         result = sqlSession.insert("MyPageMapper.insertBadge5", userId);
      } catch (Exception e) {
         e.printStackTrace(); // 예외 처리
      }
      return result;
   }
   
   
   public List<BadgeDTO> showBadge(String userId) {
      List<BadgeDTO> badges = new ArrayList<>();
      try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
         badges = sqlSession.selectList("MyPageMapper.showBadge", userId);
      } catch (Exception e) {
         e.printStackTrace(); // 예외 처리
      }
      return badges;
   }
   
   
   
   

}
