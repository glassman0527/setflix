package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.MemberServiceImpl;

/**
 * @author : 박예빈
 * @Date : 2019. 3. 25.
 * @변경이력 :
 */

@SuppressWarnings("serial")
@WebServlet("/mypage")
public class MyPageServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		if (id == null) {
			resp.sendRedirect("login");

		} else {
			req.getRequestDispatcher("member/mypage.jsp").forward(req, resp);

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String newpw = req.getParameter("password"); // 새 비번
		String newpwCk = req.getParameter("confirm_password"); // 새 비번 확인
		if (newpw != null && newpwCk != null && newpw.equals(newpwCk)) {
			MemberServiceImpl.getInstance().modify(id, newpw);
			resp.sendRedirect("main");
		} else {
			resp.sendRedirect("mypage?code=2");
		}

	}
}
