package board.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.controller.NaverVideo;
import board.vo.Board;
import common.db.DBManager;

/**
 * @since 2019-03-27
 * @author 이호재, 정공명
 * @data Connection, PreparedStatement, ResultSet 생성
 */

public class BoardDao {
	private static BoardDao instance = new BoardDao();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private BoardDao() {
	};

	public static BoardDao getInstance() {
		return instance;
	}

	/**
	 * @since 2019-03-30
	 * @author 이호재, 정공명
	 * @data main 화면 영상 출력 페이지 기능 구현
	 * @code finally code 추가
	 */
	public List<Board> viewMain(String genre) {
		String sql = "SELECT BOARDNO, THUMBNAIL, GENRE,TITLE FROM S_BOARD JOIN S_BOARD_CATEGORY USING (BOARDNO) JOIN S_CATEGORY USING (CATEGORYNO) WHERE GENRE = ? AND ROWNUM <= 15";
		ArrayList<Board> list = new ArrayList<>();

		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, genre);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board vo = new Board();
				int idx = 0;
				vo.setBoardno(rs.getInt(++idx));
				vo.setThumbnail(rs.getString(++idx));
				vo.setGenre(rs.getString(++idx));
				vo.setTitle(rs.getString(++idx));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	/**
	 * @since 2019-03-30
	 * @author 이호재, 정공명
	 * @data main에서 검색 기능 구현
	 * @code finally code 추가
	 */
	public List<Board> searchMain(String title) {
		String sql = "SELECT BOARDNO, TITLE, THUMBNAIL FROM S_BOARD WHERE TITLE LIKE ?";
		ArrayList<Board> search = new ArrayList<>();

		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + title + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board vo = new Board();
				int idx = 0;
				vo.setBoardno(rs.getInt(++idx));
				vo.setTitle(rs.getString(++idx));
				vo.setThumbnail(rs.getString(++idx));
				search.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return search;
	}
	/**
	 * @since 2019-04-02
	 * @author 이호재, 정공명
	 * @data category에서 genre 불러오기
	 */
	public List<String> cateGenre() {
		String sql = "SELECT GENRE FROM S_CATEGORY";
		ArrayList<String> cateGenre = new ArrayList<>();

		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int idx = 0;
				cateGenre.add(rs.getString(++idx));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return cateGenre;
	}
	
	/**
	 * @since 2019-04-03
	 * @author 이호재, 정공명
	 * @data 내가 찜한 목록 불러오기
	 */
	public List<Board> pickmovie(int userno) {
		String sql = "SELECT DISTINCT a.boardno, a.title,a.thumbnail\r\n" + 
				"FROM S_BOARD a,s_user_pick b, s_user c \r\n" + 
				"WHERE b.USERNO=c.userno AND a.BOARDNO=b.boardno and b.userno = ? and rownum<=15";
		ArrayList<Board> pick = new ArrayList<>();
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board vo = new Board();
				int idx = 0;
				vo.setBoardno(rs.getInt(++idx));
				vo.setTitle(rs.getString(++idx));
				vo.setThumbnail(rs.getString(++idx));
				pick.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return pick;
	}

	/**
	 * @author 이유진
	 * @since 2019-04-02
	 * @param boardno
	 * @return Board객체
	 */

	public Board selectBoard(int boardno) {
		Board board = null;

		String sql = "SELECT * FROM s_board WHERE boardno=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int idx = 0;
				board = new Board(rs.getInt(++idx), // boardno
						rs.getString(++idx), // title
						rs.getString(++idx), // regdate
						NaverVideo.getInstance().GetSrc(rs.getString(++idx)), // content
						rs.getString(++idx), // contnetDescription
						rs.getString(++idx), // detailDescription
						rs.getString(++idx), // runningTime
						rs.getInt(++idx), // hits
						rs.getInt(++idx), // recommend
						null, // seriseName
						null, // genre
						rs.getString(++idx), // thumbnail
						0, // categoryno
						0, // pickno
						0 // userno
				);
			}

		} catch (SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return board;
	}

	/**
	 * @author 이유진
	 * @since 2019-04-02
	 * @param boardno
	 * @return Boardno의 board의 장르리스트
	 */
	public List<String> getGenres(int boardno) {
		List<String> genres = new ArrayList<>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(
					"SELECT s_category.genre,categoryno FROM s_board_category NATURAL JOIN s_category WHERE s_board_category.boardno = ?");
			pstmt.setInt(1, boardno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				genres.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return genres;
	}

	/**
	 * @author 이유진
	 * @since 2019-04-02
	 * @param sting
	 *            genres
	 * @return 특정 장르의 board list 출력
	 */
	public List<Board> getGenreBoards(List<String> genres) {

		List<Board> list = new ArrayList<>();
		String sql = "SELECT boardno, title, thumbnail FROM s_board NATURAL join s_board_category NATURAL join s_category WHERE genre = ?";

		try {
			conn = DBManager.getConnection();
			for (String genre : genres) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, genre);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int idx = 0;
					list.add(new Board(rs.getInt(++idx), // boardno
							rs.getString(++idx), // title
							null, // regdate
							null, // content
							null, // contnetDescription
							null, // detailDescription
							null, // runningTime
							0, // hits
							0, // recommend
							null, // seriseName
							null, // genre
							rs.getString(++idx), // thumbnail
							0, // categoryno
							0, // pickno
							0 // userno
					));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		return list;
	}
	public void deleteBoard(int boardno) {
		String sql = "DELETE FROM S_BOARD WHERE BOARDNO = ?";
		int idx = 0;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(++idx, boardno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBManager.close(conn, pstmt);
		}
	}


}
