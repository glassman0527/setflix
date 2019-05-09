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
import javax.servlet.http.HttpSession;

import board.service.BoardServiceImpl;
import board.vo.Board;
import member.service.MemberServiceImpl;
import member.vo.Member;

/**
 * @since 2019-04-09
 * @author 이호재, 정공명
 * @data main 페이지 출력 
 * 		 내가 찜한 목록 추가
 * 		 main 찜 기능 추가
 */
@SuppressWarnings("serial")
@WebServlet("/main")
public class Main extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("member") == null) {
			resp.sendRedirect("login");
		} else {
			List<List<Board>> result = new ArrayList<>();
			List<String> genreList = new ArrayList<>();
			genreList = BoardServiceImpl.GetInstance().cateGenre();
	
			Collections.shuffle(genreList);
			
	
			for (String genre : genreList) {
				result.add(BoardServiceImpl.GetInstance().viewMain(genre));
			}
	
			req.setAttribute("genreList", genreList);
			req.setAttribute("result", result);
			
			HttpSession session = req.getSession();
			if (session.getAttribute("member") != null) {
				Member member = (Member) session.getAttribute("member");
				req.setAttribute("heartCk", MemberServiceImpl.getInstance().getpickBoardNo(member.getId(), 2403));
				
				req.setAttribute("pickmovie",BoardServiceImpl.GetInstance().pickmovie(member.getUserNo()));
			}
	
			req.getRequestDispatcher("common/main.jsp").forward(req, resp);
		}
	}
}
