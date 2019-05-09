package member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberServiceImpl;
import member.vo.Member;

@SuppressWarnings("serial")
@WebServlet("/findPw")
public class FindPwServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("member/findPw.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String useremail = req.getParameter("id");
		Member lostuser = new Member();
		lostuser = MemberServiceImpl.getInstance().getMember(useremail);

		if (lostuser != null) {
			char pwCollection[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'a', 'b', 'c', 'd',
					'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
					'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };

			String ranPw = "";

			for (int i = 0; i < 10; i++) {
				int selectRandomPw = (int) (Math.random() * (pwCollection.length));
				ranPw += pwCollection[selectRandomPw];
			}

			Properties p = System.getProperties();
			p.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
			p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
			p.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
			p.put("mail.smtp.port", "587"); // gmail 포트

			Authenticator auth = new MyAuthentication();

			// session 생성 및 MimeMessage생성
			Session session = Session.getDefaultInstance(p, auth);
			MimeMessage msg = new MimeMessage(session);

			try {
				// 편지보낸시간
				msg.setSentDate(new Date());

				InternetAddress from = new InternetAddress();

				from = new InternetAddress("setflix0@gmail.com");

				// 이메일 발신자
				msg.setFrom(from);

				// 이메일 수신자
				InternetAddress to = new InternetAddress(useremail);
				msg.setRecipient(Message.RecipientType.TO, to);

				// 이메일 제목
				msg.setSubject("SETFLIX 임시 비밀번호 안내", "UTF-8");

				// 이메일 내용
				msg.setText("임시 비밀번호 : " + ranPw, "UTF-8");

				// 이메일 헤더
				msg.setHeader("content-Type", "text/html");

				// 메일보내기
				javax.mail.Transport.send(msg);

			} catch (Exception e) {
				e.printStackTrace();
			}
			MemberServiceImpl.getInstance().modify(useremail, ranPw);
			resp.sendRedirect("findPwCk");
		} else {
			resp.sendRedirect("findPw?code=1");
		}
		
	}


class MyAuthentication extends Authenticator {

	PasswordAuthentication pa;

	public MyAuthentication() {

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
