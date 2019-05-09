package reply.service;

import java.util.List;

import reply.vo.Reply;

/** 
 * @since 2019-03-29
 * @author 박인영
 * 댓글 service interface 생성
 */

public interface ReplyService {
	
	List<Reply> selectBoardReplys(int boardno);
	
	void writeReply(Reply vo);
	
	void deleteReply(int replyno);
	
	Reply modifyReply(int replyno);
	
	void likeReply(int replyno);
}
