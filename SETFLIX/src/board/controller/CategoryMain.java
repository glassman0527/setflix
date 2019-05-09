package board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.vo.Board;

/**
 * @since 2019-04-01
 * @author 이호재, 정공명
 * @data CategoryMain 페이지 출력
 */
@SuppressWarnings("serial")
@WebServlet("/categoryMain")
public class CategoryMain extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<List<Board>> result = new ArrayList<>();
		List<String> genreList = new ArrayList<>();
		genreList = BoardServiceImpl.GetInstance().cateGenre();
		
		Collections.shuffle(genreList);
		
		for(String genre : genreList) {
			result.add(BoardServiceImpl.GetInstance().viewMain(genre));
		}
		
		req.setAttribute("genreList", genreList);
		req.setAttribute("result", result);
			
		req.getRequestDispatcher("common/categoryMain.jsp").forward(req, resp);
	}



}
