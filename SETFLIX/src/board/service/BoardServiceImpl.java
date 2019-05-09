package board.service;

import java.util.List;

import board.dao.BoardDao;
import board.vo.Board;

public class BoardServiceImpl implements BoardService{
	static BoardService service = new BoardServiceImpl();
	private  BoardServiceImpl() {}
	public static BoardService GetInstance() {
		return service;
	}
	
	/**
	 * @since 2019-03-28
	 * @author 이호재, 정공명
	 * @data main 페이지 화면 출력   
	 */	
	@Override
	public List<Board> viewMain(String genre) {
		return BoardDao.getInstance().viewMain(genre);
	}

	/**
	 * @since 2019-03-28
	 * @author 이호재, 정공명
	 * @data 검색 페이지 화면 출력   
	 */
	@Override
	public List<Board> searchMain(String title) {
		return BoardDao.getInstance().searchMain(title);
	}
	
	/**
	 * @since 2019-04-02
	 * @author 이호재, 정공명
	 * @data main 페이지 화면 카테고리 출력 
	 */
	@Override
	public List<String> cateGenre() {
		// TODO Auto-generated method stub
		return BoardDao.getInstance().cateGenre();
	}
	
	/**
	 * @author 이호재, 정공명
	 * @since 2019-04-03
	 * @return 내가 찜한 목록 노출
	 * 
	 */
	@Override
	public List<Board> pickmovie(int userno) {
		// TODO Auto-generated method stub
		return BoardDao.getInstance().pickmovie(userno);
	}

	/**
	 * @author 이유진
	 * @since 2019-04-02
	 * @param boardno db s_board table의 고유키 값
	 * @return 입력받은 boardno로 상세정보출력
	 * 
	 */
	@Override
	public Board selectBoard(int boardno) {
		// TODO Auto-generated method stub
		return BoardDao.getInstance().selectBoard(boardno);
	}
	/**
	 * @author 이유진
	 * @since 2019-04-02
	 * @param boardno
	 * @return 입력받은 boardno로 장르리스트 출력
	 * 
	 */
	@Override
	public List<String> getGenres(int boardno) {
		// TODO Auto-generated method stub
		return BoardDao.getInstance().getGenres(boardno);
	}
	/**
	 * @author 이유진
	 * @since 2019-04-02
	 * @param boardno
	 * @return 특정 장르의 동영상 리스트
	 * 
	 */
	@Override
	public List<Board> getGenreBoards(List<String> genres) {
		// TODO Auto-generated method stub
		return BoardDao.getInstance().getGenreBoards(genres);
	}
	
	@Override
	public void deleteBoard(int boardno) {
		// TODO Auto-generated method stub
		BoardDao.getInstance().deleteBoard(boardno);
	}
}
