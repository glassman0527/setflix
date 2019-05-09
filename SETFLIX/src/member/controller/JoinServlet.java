package member.controller;

import java.io.IOException;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
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
@WebServlet("/join")
public class JoinServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("member/join.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id = req.getParameter("id");
		String pw = req.getParameter("password");
		String name = req.getParameter("name");
		String pwCk = req.getParameter("confirm_password"); // 비번 확인

		if (pw != null && pwCk != null && name != null && pw.equals(pwCk)) {
			Member member = new Member();
			member.setId(id);
			member.setPw(pw);
			member.setName(name);
			int result = MemberServiceImpl.getInstance().join(member);
			switch (result) {
			case 0: // 실패
				resp.sendRedirect("join?code=0");
				break;
			case 1: // 성공
				HttpSession session = req.getSession();
				session.setAttribute("id", id);
				resp.sendRedirect("sendEmail");
				break;
			case 2: // 이메일 중복
				resp.sendRedirect("join?code=3");
				break;
			}
		} else if (pw == null) {
			resp.sendRedirect("join?code=2");
		}

	}

	class Authentication extends Authenticator {

		PasswordAuthentication pa;

		public Authentication() {

			String id = "setflix0@gmail.com"; // 구글 ID
			String pw = "hisetflix78!"; // 구글 비밀번호

			// ID와 비밀번호를 입력한다.
			pa = new PasswordAuthentication(id, pw);

		}

		// 시스템에서 사용하는 인증정보
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	}
}
