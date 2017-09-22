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
import com.bean.FileBean;
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
	
	public int addBoardInfo(String btitle,String bname,ArrayList<String> fileName) throws Exception{

		BoardBean bean = new BoardBean();
		
		Connection conn=null;
		PreparedStatement stmt=null;
		int idx=0;
		try {
			conn=dataSource.getConnection();
			
			//conn.setAutoCommit(false);
			
			String sql="Insert into board (board_no,bdate,btitle,bname)  "
					+ " select board_seq.nextval,sysdate, ?, ? from dual";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1,btitle );
			stmt.setString(2, bname);
			
			int rd=stmt.executeUpdate();
			
			
			for(int i=0;i<fileName.size() ; i++) {
				sql="Insert into board_file (board_no,file_no,filename) "
						+ " select board_seq.currval,file_seq.nextval, ? from dual ";
				stmt=conn.prepareStatement(sql);
				stmt.setString(1,(String)fileName.get(i));
				
				System.out.println((String)fileName.get(i));
				int rd2=stmt.executeUpdate();
			}
			
			conn.commit();
			
			String sql2 = "select max(board_no) from board";
			stmt=conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery(sql2);
			if(rs.next())
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
			bean.setBoard_no(rs.getInt("board_no"));
			bean.setBtitle(rs.getString("btitle"));
			bean.setBname(rs.getString("bname"));
			bean.setBdate(rs.getDate("bdate"));
			list.add(bean);
		}
		conn.close();
		
		return list;
	}
	public BoardBean getSelectedBoard(String board_no) throws Exception{
			
			Connection conn=null;
			PreparedStatement stmt=null;
			
			conn=dataSource.getConnection();
			
			String sql = "select bname,bdate,btitle from board where board_no=?";	 
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board_no);
			
			ResultSet rs = pstmt.executeQuery();
			BoardBean bean = new BoardBean();
			if(rs.next()){
				bean.setBname(rs.getString("bname"));
				bean.setBdate(rs.getDate("bdate"));
				bean.setBtitle(rs.getString("btitle"));
			}
			conn.close();
			
			return bean;
		}
	public ArrayList<FileBean> getSelectedFile(String board_no) throws Exception{
		
		ArrayList<FileBean> list=new ArrayList<FileBean>();
		Connection conn=null;
		PreparedStatement stmt=null;
		
		conn=dataSource.getConnection();
		
		String sql = "select file_no,filename from board_file where board_no=?";	 
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board_no);
		
		ResultSet rs = pstmt.executeQuery();
		FileBean bean = null;
		
		while(rs.next()){
			bean = new FileBean();
			bean.setFile_no(rs.getInt("file_no"));
			bean.setFilename(rs.getString("filename"));
			list.add(bean);
		}
		conn.close();
		
		return list;
	}
	public void deleteBoard(int board_no) throws Exception{
		
		Connection conn=null;
		PreparedStatement stmt=null;
		
		conn=dataSource.getConnection();
		
		String sql = "delete from board where board_no=?";	 
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, board_no);
		
		int rs = pstmt.executeUpdate();
		
		conn.close();
		
		
	}
}
