package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("게시판번호 :: " + Integer.parseInt(request.getParameter("boardno")));
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		
		
		BoardServiceImpl.GetInstance().deleteBoard(boardno);
		response.sendRedirect("main");
	}
}
