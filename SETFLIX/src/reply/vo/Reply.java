package reply.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/** 
 * @since 2019-03-29
 * @author 박인영
 * 댓글 VO 생성
 */

@Data @AllArgsConstructor @NoArgsConstructor
public class Reply {
	private int replyno;
	private String content;
	private String regdate;
	private int rgroup;
	private int rdepth;
	private int userno;
	private String username;
	private int boardno;
	private int rlevel;
	private int creply;
	private int recommend;
	private int preply;
}
