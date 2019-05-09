package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.MemberServiceImpl;
import member.vo.Member;

/**
 * @author : 박예빈
 * @Date : 2019. 3. 15.
 * @변경이력 :
 */

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id =(String) session.getAttribute("id"); 
		if(id == null) {
			req.getRequestDispatcher("member/login.jsp").forward(req, resp);			
		}else {
			req.getRequestDispatcher("common/main.jsp").forward(req, resp);			
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		Member member = new Member();
		member = MemberServiceImpl.getInstance().login(id, pw);

		if (member != null && member.getAuth() != null) {
			HttpSession session = req.getSession();
			session.setAttribute("member", member);
			session.setAttribute("id", id);
			session.setAttribute("pick", member.getPickBoardNo());

			resp.sendRedirect("main");

		} else if (member == null) {
			resp.sendRedirect("login?code=1");

		} else if (member.getAuth() == null) {
			resp.sendRedirect("login?code=2");

		}
	}

}
