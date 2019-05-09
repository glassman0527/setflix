package main.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/index")
public class Index extends HttpServlet{
	/**
	 * @since 2019-04-03
	 * @author 이호재,정공명
	 * @data forward 추가 및 기존 send 주석
	 */
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.getRequestDispatcher("index.jsp").forward(req, resp);
	
	}
	
}
