package board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @since 2019-04-02
 * @author 이호재,정공명
 * @code thumbnail , categoryno, pickno, userno 추가
 */

@Data @AllArgsConstructor @NoArgsConstructor
public class Board {
	private int boardno;
	private String title;
	private String regdate;
	private String content;
	private String contentDescription;
	private String detailDescription;
	private String runningTime;
	private int hits;
	private int recommend;
	private String seriseName;
	private String genre;
	private String thumbnail;
	private int categoryno;
	private int pickno;
	private int userno;
}
