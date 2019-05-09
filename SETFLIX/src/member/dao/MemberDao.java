
package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.db.DBManager;
import member.vo.Member;

/**
 * @author : 박예빈
 * @Date : 2019. 3. 15.
 * @변경이력 :
 */

public class MemberDao {
	private static MemberDao dao = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return dao;
	}

	ResultSet rs;
	PreparedStatement pstmt;
	Connection conn;

	public Member login(String id, String pw) {
		Member member = null;
		String sql = "SELECT USERNO, ID, NAME, AUTH, (SELECT ADMIN FROM S_USER_SUBINFO WHERE USERNO=(SELECT USERNO FROM S_USER WHERE ID = ?)) FROM S_USER WHERE ID = ? AND PW =?";
		conn = DBManager.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pw = common.util.SecurityUtil.encryptSHA256(pw);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int idx = 1;
				member = new Member();
				member.setUserNo(rs.getInt(idx++));
				member.setId(rs.getString(idx++));
				member.setName(rs.getString(idx++));
				member.setAuth(rs.getString(idx++));
				member.setAdmin(rs.getInt(idx++));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return member;
	}

	// 카카오 로그인
	public Member kakaoLogin(Member vo) {
		Member member = null;
		String sql = "SELECT USERNO, ID, NAME, ACTOKEN, RFTOKEN FROM S_USER WHERE ID =?";
		conn = DBManager.getConnection();
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new Member();
				int idx = 1;
				member.setUserNo(rs.getInt(idx++));
				member.setId(rs.getString(idx++));
				member.setName(rs.getString(idx++));
				member.setActoken(rs.getString(idx++));
				member.setRftoken(rs.getString(idx++));
				pstmt.close();
			} else {
				sql = "INSERT INTO S_USER VALUES(S_USER_SEQ.NEXTVAL,?,null,?,?,?,1)";
				pstmt = conn.prepareStatement(sql);
				int idx = 0;
				pstmt.setString(++idx, vo.getId());
				pstmt.setString(++idx, vo.getName());
				pstmt.setString(++idx, vo.getActoken());
				pstmt.setString(++idx, vo.getRftoken());
				pstmt.executeUpdate();
				conn.commit();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return member;
	}

	// 로그아웃
	public void logout(String id) {

	}

	// 회원가입
	public int join(Member vo) {
		int result = 0; // 1 성공
		String sql = "SELECT ID FROM S_USER WHERE ID = ?";
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return result = 2; // 중복 이메일
			} else if (!rs.next()) {
				sql = "INSERT INTO S_USER VALUES(S_USER_SEQ.NEXTVAL,?,?,?,null,null,null)";
				try {
					if (vo.getName() != null) {
						conn.setAutoCommit(false);
						PreparedStatement pstmt1 = conn.prepareStatement(sql);
						int idx = 0;
						pstmt1.setString(++idx, vo.getId());
						pstmt1.setString(++idx, common.util.SecurityUtil.encryptSHA256(vo.getPw()));
						pstmt1.setString(++idx, vo.getName());
						result = pstmt1.executeUpdate();
						pstmt1.close();
						sql = "INSERT INTO S_USER_SUBINFO VALUES(S_USER_SUBINFO_SEQ.NEXTVAL,null,SYSDATE,null,(SELECT USERNO FROM S_USER WHERE id = ?))";
						pstmt1 = conn.prepareStatement(sql);
						pstmt1.setString(1, vo.getId());
						pstmt1.executeUpdate();
						conn.commit();
					} else if (vo.getName() == null) {
						return result = 3;
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;

	}

	public void modify(String id, String pw) {
		String sql = "UPDATE S_USER SET PW = ? WHERE ID = ? ";
		conn = DBManager.getConnection();
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pw = common.util.SecurityUtil.encryptSHA256(pw);

			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			pstmt.close();
			sql = "UPDATE S_USER_SUBINFO SET UPDATE_DATE = SYSDATE WHERE USERNO = (SELECT USERNO FROM S_USER WHERE id=?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			conn.commit();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void resign(String id) {
		String sql = "DELETE FROM S_USER WHERE ID = ?";
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public Member getMember(String id) {
		Member member = null;
		String sql = "SELECT USERNO, ID, PW, NAME FROM S_USER WHERE ID = ?";
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setUserNo(rs.getInt(1));
				member.setId(rs.getString(2));
				member.setPw(rs.getString(3));
				member.setName(rs.getString(4));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);

		}
		return member;
	}

	public void emailAuth(String id) { // 1인증 o, null 인증 x
		String sql = "SELECT ID FROM S_USER WHERE ID = ?";
		conn = DBManager.getConnection();
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sql = "UPDATE S_USER SET AUTH = 1 WHERE ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
			}
			conn.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void heart(String id, int boardno) {
		String sql = "INSERT INTO S_USER_PICK VALUES(S_PICK_SEQ.NEXTVAL,SYSDATE,(SELECT USERNO FROM S_USER WHERE ID = ?), ?)";
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, boardno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void heartKill(String id, int boardno) {
		String sql = "DELETE FROM S_USER_PICK WHERE BOARDNO= ? AND USERNO = (SELECT USERNO FROM S_USER WHERE ID = ?)";
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardno);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public boolean getpickBoardNo(String id, int boardno) {
		List<Integer> list = new ArrayList<>();
		String sql = "SELECT BOARDNO FROM S_USER_PICK WHERE USERNO = (SELECT USERNO FROM S_USER WHERE ID = ?)";
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getInt(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return list.contains(boardno);
	}
}
