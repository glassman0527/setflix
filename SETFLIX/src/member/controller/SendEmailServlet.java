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
import javax.servlet.http.HttpSession;

/**
 * @author : 박예빈
 * @Date : 2019. 04. 03.
 * @변경이력 :
 */

@SuppressWarnings("serial")
@WebServlet("/sendEmail")
public class SendEmailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session1 = req.getSession();
		String useremail = (String) session1.getAttribute("id");

		char pwCollection[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'a', 'b', 'c', 'd', 'e',
				'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
				'!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };

		String key = "";

		for (int i = 0; i < 10; i++) {
			int selectRandomPw = (int) (Math.random() * (pwCollection.length));
			key += pwCollection[selectRandomPw];
		}

		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		p.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
		p.put("mail.smtp.port", "587"); // gmail 포트

		Authenticator auth = new Authentication();

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
			msg.setSubject("SETFLIX 이메일 인증 안내", "UTF-8");

			// 이메일 내용
			msg.setText("안녕하세요. SETFLIX 이메일 인증 이메일입니다. ", "UTF-8");
			msg.setText(new StringBuffer().append(
					"<a href='http://setflix.shop/emailAuth?user_email=" + useremail + "&user_key=" + key)
					.append("' target='_blank'>이메일 인증</a>").toString(), "UTF-8");

			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");

			// 메일보내기
			javax.mail.Transport.send(msg);
			session1.setAttribute("authKey", key);

		} catch (Exception e) {
			e.printStackTrace();
		}

		req.getRequestDispatcher("member/sendEmail.jsp").forward(req, resp);
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
