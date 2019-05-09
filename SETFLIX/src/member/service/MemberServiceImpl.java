package member.service;

import member.dao.MemberDao;
import member.vo.Member;

/**
 * @author : 박예빈
 * @Date : 2019. 3. 15. 
 * @변경이력 :
 */

public class MemberServiceImpl implements MemberService{
	private static MemberServiceImpl service = new MemberServiceImpl();
	
	private MemberServiceImpl() {};
	
	public static MemberServiceImpl getInstance() {
		// TODO Auto-generated constructor stub
		return service;
	}

	@Override
	public Member login(String id, String pw) {
		// TODO Auto-generated method stub
		return MemberDao.getInstance().login(id, pw);
	}
	
	
	@Override
	public Member kakaoLogin(Member vo) {
		// TODO Auto-generated method stub
		return MemberDao.getInstance().kakaoLogin(vo);
	}
	
	

	@Override
	public void logout(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int join(Member vo) {
		// TODO Auto-generated method stub
		return MemberDao.getInstance().join(vo);
	}

	@Override
	public void modify(String id, String pw) {
		// TODO Auto-generated method stub
		MemberDao.getInstance().modify(id, pw);
	}

	@Override
	public void resign(String id) {
		// TODO Auto-generated method stub
		MemberDao.getInstance().resign(id);
	}

	@Override
	public Member getMember(String id) {
		// TODO Auto-generated method stub
		return MemberDao.getInstance().getMember(id);
	}

	@Override
	public void emailAuth(String id) {
		// TODO Auto-generated method stub
		MemberDao.getInstance().emailAuth(id);
	}

	@Override
	public void heart(String id, int boardno) {
		// TODO Auto-generated method stub
		MemberDao.getInstance().heart(id, boardno);
	}

	@Override
	public void heartKill(String id, int boardno) {
		// TODO Auto-generated method stub
		MemberDao.getInstance().heartKill(id, boardno);
	}

	@Override
	public boolean getpickBoardNo(String id, int boardno) {
		// TODO Auto-generated method stub
		return MemberDao.getInstance().getpickBoardNo(id, boardno);
	}
	
}
