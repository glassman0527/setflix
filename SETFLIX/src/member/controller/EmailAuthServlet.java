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
 * @Date : 2019. 04. 03.
 * @변경이력 :
 */

@SuppressWarnings("serial")
@WebServlet("/emailAuth")
public class EmailAuthServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("member/emailAuth.jsp").forward(req, resp);
		String email = req.getParameter("user_email");
		String userKey = req.getParameter("user_key");
		System.out.println(email +" :: " + userKey);
		
		HttpSession session = req.getSession();
		String authKey = (String) session.getAttribute("authKey");
		if (authKey.equals(userKey)) {
			MemberServiceImpl.getInstance().emailAuth(email);

		}
	}
}
