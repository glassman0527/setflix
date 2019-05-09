package member.service;

import member.vo.Member;

/**
 * @author : 박예빈
 * @Date : 2019. 3. 15. 
 * @변경이력 :
 */

interface MemberService  {
	//로그인
	public Member login(String id, String pw);
	//카카오로그인
	public Member kakaoLogin(Member vo);
	//회원가입
	public int join(Member vo);
	//정보수정
	public void modify(String id, String pw);
	//회원탈퇴
	public void resign(String id);
	//마이페이지
	public Member getMember(String id);
	//로그아웃
	public void logout(String id);
	//이메일 인증
	public void emailAuth(String id);
	//찜하기
	public void heart(String id, int boardno);
	//찜취소
	public void heartKill(String id, int boardno);
	
	public boolean getpickBoardNo(String id, int boardno);
}
