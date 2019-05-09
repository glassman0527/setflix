package board.service;

import java.util.List;

import board.vo.Board;


public interface BoardService {
	/**
	 * @since 2019-03-28
	 * @author 이호재, 정공명
	 * @data main 페이지 화면 출력   
	 */
	List<Board> viewMain(String genre);
	/**
	 * @since 2019-03-28
	 * @author 이호재, 정공명
	 * @data 검색 페이지 화면 출력   
	 */
	List<Board> searchMain(String title);
	/**
	 * @since 2019-04-02
	 * @author 이호재, 정공명
	 * @data main 페이지 화면 카테고리 출력 
	 */
	List<String> cateGenre();
	/**
	 * @since 2019-04-03
	 * @author 이호재, 정공명
	 * @data 내가 찜한 목록 구현 
	 */
	List<Board> pickmovie(int userno);
	
	/**
	 * @author 이유진
	 * @since 2019-04-02
	 * @param boardno
	 * @return Board객체
	 */
	Board selectBoard(int boardno);
	
	/**
	 * @author 이유진
	 * @since 2019-04-02
	 * @param boardno
	 * @return boardno받아서 동영상의 장르를 return
	 * 
	 */
	List<String> getGenres(int boardno);
	
	/**
	 * @author 이유진
	 * @since 2019-04-02
	 * @param boardno
	 * @return 특정 장르의 동영상 리스트
	 * 
	 */
	public List<Board> getGenreBoards(List<String> genres);
	
	void deleteBoard(int boardno);
	
}
