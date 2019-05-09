package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * @author : 박예빈
 * @Date : 2019. 3. 25.
 * @변경이력 :
 */

@SuppressWarnings("serial")
@WebServlet("/mypageKakao")
public class MyPageKaKaoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		if (id == null) {
			resp.sendRedirect("login");

		} else {
			req.getRequestDispatcher("member/mypageKakao.jsp").forward(req, resp);

		}

	}

}
