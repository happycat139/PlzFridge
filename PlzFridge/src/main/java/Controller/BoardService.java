package Controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.BoardDAO;
import Model.BoardDTO;

public class BoardService extends HttpServlet {

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String savePath = getServletContext().getRealPath("/uploads");
      System.out.println("저장 경로: " + savePath);

      File uploadDir = new File(savePath);
      if (!uploadDir.exists()) {
         uploadDir.mkdirs(); // 디렉토리가 없으면 생성
      }
      
     
      // 파일 업로드 설정
      int maxSize = 1024 * 1024 * 10; // 최대 파일 크기 10MB
      String encoding = "UTF-8";

      DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

      // 파일 업로드 및 중복 처리
      MultipartRequest multi;
      try {
         multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
         // 요청 데이터 받아오기
         // 세션에서 사용자 ID를 가져오기
         HttpSession session = request.getSession();
         String user_id = (String) session.getAttribute("user_id");
         String b_content = multi.getParameter("content");
         String b_file = multi.getFilesystemName("filename"); // 업로드된 파일의 이름

    
         BoardDTO board = new BoardDTO(user_id, b_file, b_content);

         // 게시글 데이터베이스 저장
         int result = new BoardDAO().writeBoard(board);

         if (result > 0) {
            System.out.println("게시글 작성 성공");
         } else {
            System.out.println("게시글 작성 실패");
         }

      } catch (IOException e) {
         e.printStackTrace();
      }

      response.sendRedirect("Post_Main.jsp");
   }

}
