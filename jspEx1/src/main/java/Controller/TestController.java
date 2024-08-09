package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.User;
import dao.TestDAO;

@WebServlet("/qqq")
public class TestController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	TestDAO dao = new TestDAO();
		String name = dao.userName(); 
        // 모델 데이터를 request 객체에 저장
		request.setAttribute("name", name); 
        // 뷰(JSP)로 포워딩
        request.getRequestDispatcher("/day5/zzz.jsp").forward(request, response);
    }
}


/*
 * @WebServlet("/qqq") public class TestController extends HttpServlet {
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * 
 * request.getRequestDispatcher("/프로젝트명/연결 jsp 파일").forward(request, response); }
 * }
 */


