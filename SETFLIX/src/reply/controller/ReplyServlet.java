package reply.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import reply.service.ReplyServiceImpl;
import reply.vo.Reply;

@SuppressWarnings("serial")
@WebServlet("/reply")
public class ReplyServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("application/json; charset=utf-8");
		System.out.println("is get");
		/*Enumeration<String> param = req.getParameterNames();
		while(param.hasMoreElements()) {
			System.out.println(param.nextElement());
		}*/
		String type = req.getParameter("type");
		
		if (type!=null) {
			if (type.equals("like")) {
				ReplyServiceImpl.getInstance().likeReply(Integer.parseInt(req.getParameter("replyno")));
			}else if(type.equals("del")){
				ReplyServiceImpl.getInstance().deleteReply(Integer.parseInt(req.getParameter("replyno")));
			}
		}
		
		String strbno = req.getParameter("boardno");
		int boardno = Integer.parseInt(strbno);

		List<Reply> replys = ReplyServiceImpl.getInstance().selectBoardReplys(boardno);
		req.setAttribute("replys", replys);
		
		ObjectMapper mapper = new ObjectMapper();
		String jreplys = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(replys);
		resp.getWriter().println(jreplys);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String str =req.getParameter("rfrm");
		String[] rfrms = str.split("&");
		Map<String, String> param = new HashMap<>();
		for (String string : rfrms) {
			param.put(string.substring(0,string.indexOf("=")), string.substring(string.indexOf("=")+1));
		}
		System.out.println("is post");
		@SuppressWarnings("deprecation")
		String content = URLDecoder.decode(param.get("reply"));
		int rgroup = param.get("rgroup")==null||param.get("rgroup").equals("")?0:Integer.parseInt(param.get("rgroup"));
		int rdepth = param.get("rdepth")==null||param.get("rdepth").equals("")?0:Integer.parseInt(param.get("rdepth"));
		int userno = Integer.parseInt(param.get("userno"));
		int boardno = Integer.parseInt(param.get("boardno"));
		int rlevel = param.get("rlevel")==null||param.get("rlevel").equals("")?0:Integer.parseInt(param.get("rlevel"));
		int preply = param.get("preply")==null||param.get("preply").equals("")?0:Integer.parseInt(param.get("preply"));
		
		ReplyServiceImpl.getInstance().writeReply(new Reply(
														0, // replyno 
														content, // content 
														null, // regdate 
														rgroup, // rgroup 
														rdepth, // rdepth 
														userno, // userno 
														null, //username
														boardno, // boardno 
														rlevel, // rlevel 
														0, // creply 
														0, // recommend
														preply // preply 
														)
													);
	}
	
}
