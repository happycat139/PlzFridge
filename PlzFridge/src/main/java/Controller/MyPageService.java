package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import Model.UserDAO;
import Model.UserDTO;
import Model.BadgeDAO;
import Model.BadgeDTO;
import Model.UserBadgeDTO;


public class MyPageService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        System.out.println("마이페이지 get user_id: " + userId);
        
        
        
		 if (userId != null) {
		        UserDAO dao = new UserDAO();
		        String profileImage = dao.getProfileImage(userId);
		        String userName = dao.getUserName(userId);
		        BadgeDAO badgeDAO = new BadgeDAO();
				badgeDAO.insertBadge1(userId);
				badgeDAO.insertBadge2(userId);
				badgeDAO.insertBadge3(userId);
				badgeDAO.insertBadge4(userId);
		        

		        
		        if (profileImage != null) {
		            // 프로필 이미지 경로가 유효한 경우
		            request.setAttribute("userProfileImg", profileImage);
		            request.setAttribute("getUserName", userName);
		            System.out.println("Mypage->getUserName: " + userName);
		        } else {
		            // 프로필 이미지가 없는 경우
		            System.out.println("No profile image found for user ID: " + userId);
		        }
		        
		        response.sendRedirect("MyPage.jsp");

		        
		        
        } else {
            // 로그인되지 않은 경우 처리
            response.sendRedirect("test.jsp");
        }
	

 
	}



}
