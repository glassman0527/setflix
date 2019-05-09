package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;

/**
 * @since 2019-03-29
 * @author 이호재, 정공명
 * @data serachMovie 검색 결과 출력 화면
 */

@SuppressWarnings("serial")
@WebServlet("/searchmovie")
public class searchMovie extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String result = req.getParameter("seachmovieBtn");
		req.setAttribute("searchM", BoardServiceImpl.GetInstance().searchMain(result));
		
		if (result != null) {
			req.getRequestDispatcher("common/searchMovie.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("main");
		}

	}

}
