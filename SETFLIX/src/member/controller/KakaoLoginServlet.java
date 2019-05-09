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
 * @Date : 2019. 3. 26.
 * @변경이력 :
 */

@SuppressWarnings("serial")
@WebServlet("/kakao")
public class KakaoLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("kaccount_email");
		String name = req.getParameter("nickname");
		String actoken = req.getParameter("access_token");
		String rftoken = req.getParameter("refresh_token");

//		System.out.println(actoken);
//		System.out.println(rftoken);
//		System.out.println(id);
//		System.out.println(name);

		Member vo = new Member();
		vo.setId(id);
		vo.setName(name);
		vo.setActoken(actoken);
		vo.setRftoken(rftoken);

		Member member = new Member();
		member = MemberServiceImpl.getInstance().kakaoLogin(vo);

		if (member != null) {
			HttpSession session = req.getSession();
			session.setAttribute("member", member);
			resp.getWriter().println("success");

		} else if (member == null) {
			resp.getWriter().println("fail");
		}

	}

}
