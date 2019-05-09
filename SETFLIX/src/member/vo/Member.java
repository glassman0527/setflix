package member.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : 박예빈
 * @Date : 2019. 3. 15. 
 * @변경이력 :
 */

@Data @NoArgsConstructor @AllArgsConstructor
public class Member {
	//회원정보
	private int userNo;
	private String id;
	private String pw;
	private String name;
	private String actoken;
	private String rftoken;
	private String auth;
	
	//다본거
	private int completedNo;
	private String completedDate;
	
	
	//찜
	private List<Integer> pickBoardNo;
	private String pickDate;
	
	
	//회원부가정보번호
	private int subinfoNo;
	//관리자
	private int admin;
	//회원가입일
	private String joinDate;
	//회원정보수정일
	private String updateDate;
	
	
	//봤던거
	private int watchedNo;
	private String watchedDate;
	private String watchedTime;
	
}
