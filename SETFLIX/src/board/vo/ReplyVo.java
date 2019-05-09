package board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class ReplyVo {
	private int replyno;
	private String content;
	private String regdate;
	private int rgroup;
	private int rdepth;
	private int userno;
	private int boardno;
	private int preply;
	private int recommend;
}
