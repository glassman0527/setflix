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

import com.fasterxml.jackson.databind.ObjectMapper;

import board.service.BoardServiceImpl;
import board.vo.Board;
import common.filter.ValueFilter;
import member.service.MemberServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/view")
public class ViewServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("member") == null) {
			resp.sendRedirect("login");
		} else {
			// TODO Auto-generated method stub
			String strbno = req.getParameter("boardno");
			int boardno = Integer.parseInt(strbno);
			
			if (strbno == null || strbno.equals("") || strbno.isEmpty() || !(ValueFilter.getInstance().isNumber(strbno))) {
				resp.sendRedirect("main");
			} else {
	
				Board board = BoardServiceImpl.GetInstance().selectBoard(boardno);
				List<String> genres = new ArrayList<>();
				List<Board> list = new ArrayList<>();
				List<Board> serise = new ArrayList<>();
	
				if (board == null) {
					resp.sendRedirect("main");
				}
	
				genres = BoardServiceImpl.GetInstance().getGenres(boardno);
				list = BoardServiceImpl.GetInstance().getGenreBoards(genres);
				Collections.shuffle(list);
//				List<Reply> replys = ReplyServiceImpl.getInstance().selectBoardReplys(boardno);
	
				req.setAttribute("list", list);
				req.setAttribute("video", board);
				req.setAttribute("genres", genres);
				req.setAttribute("serise", serise);
//				req.setAttribute("replys", replys);
	
				/**
				 * @author : 박예빈
				 * @Date : 2019. 4. 08.
				 * @변경이력 :
				 */
				
				HttpSession session = req.getSession();
				String id = (String) session.getAttribute("id");
				boolean heartCk= MemberServiceImpl.getInstance().getpickBoardNo(id, boardno);
				req.setAttribute("heartCk", heartCk);
	
				req.getRequestDispatcher("board/view.jsp").forward(req, resp);
	
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("application/json; charset=utf-8");
		String strbno = req.getParameter("boardno");
		int boardno = Integer.parseInt(strbno);

		List<String> genres = new ArrayList<>();
		List<Board> list = new ArrayList<>();

		genres = BoardServiceImpl.GetInstance().getGenres(boardno);
		list = BoardServiceImpl.GetInstance().getGenreBoards(genres);
		Collections.shuffle(list);

		req.setAttribute("list", list);

		ObjectMapper mapper = new ObjectMapper();
		String json2 = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(list);
		resp.getWriter().println(json2);
	}
}
