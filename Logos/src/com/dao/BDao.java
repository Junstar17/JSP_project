package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.bean.BoardBean;
import com.common.Common;

public class BDao {

	DataSource dataSource;
	public BDao() {
		Context context;
		try {
			context = new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/Oracle11g_rollbook");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int addBoardInfo(String btitle,String bname) throws Exception{

		BoardBean bean1 = new BoardBean();
		
		Connection conn=null;
		PreparedStatement stmt=null;
		int idx=0;
		try {
			conn=dataSource.getConnection();
			
			conn.setAutoCommit(false);
			
			String sql="Insert into board (board_no,bdate,btitle,bname) values "
					+ "(board_seq.nextval,sysdate, ?, ?)";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1,btitle );
			stmt.setString(2, bname);
			
			int rd=stmt.executeUpdate();
			
			sql="Insert into board_file (board_no,file_no,filename) values "
					+ "(board_seq.currval,file_seq.nextval, ?)";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1,btitle );
			stmt.setString(2, bname);
			
			int rd2=stmt.executeUpdate();
			
			conn.commit();
			
			String sql2 = "select max(board_no) from board";
			stmt=conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery(sql2);
			rs.next();
			
			idx = rs.getInt(1);
			
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}

		return idx;
		
	}
	public int getBoardCntAll() throws Exception{
		
		Connection conn=null;
		PreparedStatement stmt=null;
		
		conn=dataSource.getConnection();
		
		String sql = "select count(*) from board";
		stmt=conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		int cnt = rs.getInt(1);
		conn.close();

		return cnt;
	}
	public ArrayList<BoardBean> getBoardAll(int page_num) throws Exception{
		
		Connection conn=null;
		PreparedStatement stmt=null;
		
		conn=dataSource.getConnection();
		
		int min = 1 + ((page_num - 1) * Common.BOARD_CNT_ONE_PAGE);
		int max = min + Common.BOARD_CNT_ONE_PAGE;
				
		String sql = "select b.* from "
				   + "(select rownum rnum, a.* from "
				   + "(select b.board_no, b.btitle, b.bname, b.bdate "
				   + "from board b "
                   + "order by b.board_no desc) a) b "
                   + "where b.rnum >= ? and b.rnum <= ? ";	 
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, min);
		pstmt.setInt(2, max); //Common.BOARD_CNT_ONE_PAGE);
		
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		while(rs.next()){
			BoardBean bean = new BoardBean();
			// 寃뚯떆湲� �젙蹂대�� �떞�뒗�떎.
			bean.setBoard_no(rs.getInt("board_no"));
			bean.setBtitle(rs.getString("btitle"));
			bean.setBname(rs.getString("bname"));
			bean.setBdate(rs.getDate("bdate"));
			list.add(bean);
		}
		conn.close();
		
		return list;
	}
	/*
	public static synchronized GujikBean getBoardData(int gujik_idx) throws Exception{
		Connection db = DBConnector.getOracleConnection();
		String sql = "select b.gujik_subject, b.gujik_info,b.gujik_age, m.user_name, b.gujik_writer_idx "
				   + "from GUJIK b, MEMBER m "
				   + "where m.user_idx=b.gujik_writer_idx and b.gujik_idx=?";
				
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setInt(1, gujik_idx);
		
		ResultSet rs = pstmt.executeQuery();
		
		// �뜲�씠�꽣 異붿텧
		rs.next();
		GujikBean bean = new GujikBean();
		bean.setGujik_subject(rs.getString("Gujik_subject"));
		bean.setGujik_info(rs.getString("Gujik_info"));
		bean.setGujik_age(rs.getInt("Gujik_age"));
		bean.setGujik_writer_name(rs.getString("user_name"));
		bean.setGujik_writer_idx(rs.getInt("Gujik_writer_idx"));
		
		db.close();
		
		return bean;
	}
	
	
	
	public static synchronized void remove_board(int gujik_idx) throws Exception{
		Connection db = DBConnector.getOracleConnection();
		
		String sql = "delete from GUJIK where gujik_idx=?";
		
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setInt(1, gujik_idx);
		
		pstmt.execute();
		
		db.close();
	}
	
	public static synchronized void updateBoard(GujikBean bean) throws Exception{
		Connection db = DBConnector.getOracleConnection();
		
		String sql = "update Gujik "
				   + "   set gujik_subject=?, gujik_info=? "
				   + " where gujik_idx=?";
		
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, bean.getGujik_subject());
		pstmt.setString(2, bean.getGujik_info());
		pstmt.setInt(3, bean.getGujik_idx());
		
		pstmt.execute();
		
		db.close();
	}
	
	// 寃뚯떆湲� �엫�쓽濡� ���옣�븯�뒗 硫붿꽌�뱶
	public static synchronized void tempAddBoard() throws Exception{
		Connection db = DBConnector.getOracleConnection();
		
		String sql = "insert into GUJIK "
				+ "(gujik_subject, gujik_age, gujik_info, gujik_writer_idx)"
				+ "values (?, 0, ?, 1)";
		PreparedStatement pstmt = db.prepareStatement(sql);
		
		for(int i = 0 ; i < 158 ; i++){
			pstmt.setString(1, "寃뚯떆湲�" + i);
			pstmt.setString(2, "寃뚯떆湲� 蹂몃Ц" + i);
			pstmt.execute();
		}
		
		db.close();
	}
	
	// 寃뚯떆湲��쓽 媛쒖닔瑜� 諛섑솚
	*/
}
