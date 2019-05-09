package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.MemberServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/pick")
public class PickServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		int boardno = Integer.parseInt(req.getParameter("boardno"));
		String heart = req.getParameter("heart");

		if (heart.equals("false")) {
			MemberServiceImpl.getInstance().heart(id, boardno);

		} else if (heart.equals("true")) {
			MemberServiceImpl.getInstance().heartKill(id, boardno);
		}
		resp.getWriter().println("success");

	}

}
