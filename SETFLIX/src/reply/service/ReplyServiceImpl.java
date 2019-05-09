package reply.service;

import java.util.List;

import reply.dao.ReplyDao;
import reply.vo.Reply;

/** 
 * @since 2019-03-29
 * @author 박인영
 * 댓글 service interface implements class 생성
 */

public class ReplyServiceImpl implements ReplyService{
	static ReplyServiceImpl service = new ReplyServiceImpl();
	private  ReplyServiceImpl() {}
	public static ReplyServiceImpl getInstance() {
		return service;
	}
	@Override
	public List<Reply> selectBoardReplys(int boardno) {
		// TODO Auto-generated method stub
		return ReplyDao.getInstance().selectBoardReplys(boardno);
	}

	@Override
	public void writeReply(Reply vo) {
		// TODO Auto-generated method stub
		ReplyDao.getInstance().writeReply(vo);
	}

	@Override
	public void deleteReply(int replyno) {
		// TODO Auto-generated method stub
		ReplyDao.getInstance().deleteReply(replyno);
	}

	@Override
	public Reply modifyReply(int replyno) {
		// TODO Auto-generated method stub
		return ReplyDao.getInstance().modifyReply(replyno);
	}

	@Override
	public void likeReply(int replyno) {
		// TODO Auto-generated method stub
		ReplyDao.getInstance().likeReply(replyno);
	}
	
}
