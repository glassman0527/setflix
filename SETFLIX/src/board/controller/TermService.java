package board.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @since 2019-04-10
 * @author 이호재, 정공명
 * @data 이용약관 sevlet 생성
 */

@SuppressWarnings("serial")
@WebServlet("/termsConditions")
public class TermService extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("common/termsConditions.jsp").forward(req, resp);
	}
}
