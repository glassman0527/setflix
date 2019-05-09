package reply.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.db.DBManager;
import reply.vo.Reply;

/** 
 * @since 2019-03-29
 * @author 박인영
 * 댓글 dao 생성
 */

public class ReplyDao {
	
	/** 
	 * @since 2019-03-29
	 * @author 박인영
	 * dao 싱글턴, 전역 sql 인터페이스 생성
	 */
	private static ReplyDao instance = new ReplyDao();
	private ReplyDao() {}
	public static ReplyDao getInstance() {return instance;}
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	/** 
	 * @since 2019-03-29
	 * @author 박인영
	 * @return List<Reply> 
	 * 게시판 번호를 매개로 작성된 댓글 출력
	 */
	/** 
	 * @since 2019-04-03
	 * @author 이유진
	 * @param boardno
	 * @return List<Reply> 특정 보드에 달린 댓글 리스트 출력
	 */
	public List<Reply> selectBoardReplys(int boardno) {
		List<Reply> list = new ArrayList<>();
		String sql = "SELECT replyno, content, regdate, r_group, r_depth, userno, name, boardno, r_level, recommend, p_reply FROM S_REPLY NATURAL join s_user WHERE BOARDNO = ? ORDER by r_group desc, r_level";
		conn = DBManager.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int idx = 0;
				Reply reply = new Reply(
						rs.getInt(++idx), //replyno, 
						rs.getString(++idx), //content, 
						rs.getString(++idx), //regdate, 
						rs.getInt(++idx), //rgroup, 
						rs.getInt(++idx), //rdepth, 
						rs.getInt(++idx), //userno,
						rs.getString(++idx), //username
						rs.getInt(++idx), //boardno, 
						rs.getInt(++idx), //rlevel, 
						0, //creply, 
						rs.getInt(++idx), //recommend
						rs.getInt(++idx) //preply, 
						);
				list.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return setChildReply(list);
	}
	
	/** 
	 * @since 2019-04-03
	 * @author 이유진
	 * @param replyno
	 * @return List<Reply> 댓글에 달린 댓글 갯수
	 */
	public List<Reply> setChildReply(List<Reply> replys) {
		for (Reply reply : replys) {
			reply.setCreply(getChildReply(reply.getReplyno()));
		}
		return replys;
	}
	
	/** 
	 * @since 2019-04-03
	 * @author 이유진
	 * @param replyno
	 * @return List<Reply> replyno댓글에 달린 댓글 갯수
	 */
	public int getChildReply(int replyno) {
		String sql = "select COUNT(*) from s_reply where p_reply = ?";
		conn = DBManager.getConnection();
		int idx = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				idx = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return idx;
	}

	/** 
	 * @since 2019-03-29
	 * @author 박인영
	 * @return void
	 * 댓글을 매개로 댓글 입력
	 */
	/** 
	 * @since 2019-04-03
	 * @author 이유진
	 * @param reply
	 * @return void reply db에 추가
	 */
	public void writeReply(Reply reply) {
		String sql;
		System.out.println(reply);
		if (reply.getRgroup()==0) {
			sql = "INSERT INTO s_reply VALUES (S_REPLY_SEQ.nextval,?,sysdate,S_REPLY_SEQ.currval,?,?,?,?,0,?)";
		}else {
			sql = "INSERT INTO s_reply VALUES (S_REPLY_SEQ.nextval,?,sysdate,?,?,?,?,?,0,?)";
		}
		conn = DBManager.getConnection();
		
		try {
			conn.setAutoCommit(false);
			
			pstmt= conn.prepareStatement("UPDATE s_reply SET r_level = r_level+1 WHERE boardno = ? and r_group = ? and r_level >= ?");
			pstmt.setInt(1, reply.getBoardno());
			pstmt.setInt(2, reply.getRgroup());
			pstmt.setInt(3, reply.getRlevel());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql);
			int idx = 0;
			pstmt.setString(++idx, reply.getContent());
			if (reply.getRgroup()==0) {
				
			}else {
				pstmt.setInt(++idx, reply.getRgroup());
			}
			pstmt.setInt(++idx, reply.getRdepth());
			pstmt.setInt(++idx, reply.getUserno());
			pstmt.setInt(++idx, reply.getBoardno());
			pstmt.setInt(++idx, reply.getRlevel());
			pstmt.setInt(++idx, reply.getPreply());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}

	/** 
	 * @since 2019-03-29
	 * @author 박인영
	 * @return void
	 * 댓글 번호 매개로 댓글 삭제
	 */
	public void deleteReply(int replyno) {
		conn = DBManager.getConnection();
		String delsql="DELETE from s_reply WHERE replyno = ?";
		String upsql="UPDATE s_reply set content = '삭제된 댓글입니다.' WHERE replyno = ?";
		int count = 0;
		try {
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM s_reply WHERE p_reply = ?");
			pstmt.setInt(1, replyno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			if(count>0) {
				pstmt =	conn.prepareStatement(upsql);
				pstmt.setInt(1, replyno);
				pstmt.executeUpdate();
			}else {
				pstmt =	conn.prepareStatement(delsql);
				pstmt.setInt(1, replyno);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	/** 
	 * @since 2019-03-29
	 * @author 박인영
	 * @return Reply
	 * 댓글 번호 매개로 댓글 수정
	 */
	public Reply modifyReply(int replyno) {
		return null;
	}
	public void likeReply(int replyno) {
		conn = DBManager.getConnection();
		String sql="UPDATE s_reply SET recommend = recommend+1 WHERE replyno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		
	}
}
