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
 * @Date : 2019. 3. 25.
 * @변경이력 :
 */

@SuppressWarnings("serial")
@WebServlet("/pwCk")
public class PwCkServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");

		String pw = req.getParameter("nowPw"); //현재 비번
	
		Member member = null;
		member = MemberServiceImpl.getInstance().login(id, pw);
		
		System.out.println(member);
		if (member != null) { // DAO 현재비밀번호확인 성공
			resp.getWriter().println("success"); // 성공 msg
			// if (newpw != null && newpwCk != null && newpw==newpwCk) {
			// MemberServiceImpl.getInstance().modify(id, newpw);
			// resp.sendRedirect("main");
			// }
		} else if (member == null) { // DAO 현재비밀번호틀림(실패)
			resp.getWriter().println("fail"); // 실패 msg
		}


	}
}
