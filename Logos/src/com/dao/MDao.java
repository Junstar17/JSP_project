package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.bean.MemberBean;
import com.common.Common;


public class MDao {
	
	DataSource dataSource;
	public MDao() {
		Context context;
		try {
			context = new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/Oracle11g_rollbook");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void add_member_info(String uId,String uPw,String uName,int groupNo,int departNo) {
		
		MemberBean bean = new MemberBean();
		
		Connection conn=null;
		PreparedStatement stmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="Insert into member (user_no,user_id,user_pw,user_name,user_level,group_no,depart_no) values "
					+ "(member_seq.nextval, ?, ?, ?, 'G', ?, ?)";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, uId);
			stmt.setString(2, uPw);
			stmt.setString(3, uName);
			stmt.setInt(4, groupNo);
			stmt.setInt(5, departNo);
			int rd=stmt.executeUpdate();
	
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
	}
	public int check_login(MemberBean bean) throws Exception{
		Connection conn=null;
		PreparedStatement stmt=null;
		
	
		conn=dataSource.getConnection();
		String sql = "select user_pw from member where user_id=?";
		stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, bean.getUser_id());
		
		ResultSet rs = stmt.executeQuery();
		int result = 0;
		
		boolean chk = rs.next();
		
		if(chk == true){
			
			String user_pw = rs.getString("user_pw");

			if(user_pw.equals(bean.getUser_pw())){
				result = Common.LOGIN_SUCCESS;
			} else {
				result = Common.WRONG_USER_PASSWORD;
			}
		} else {
			result = Common.NOT_EXIST_USER_ID;
		}
		conn.close();
		
		return result;
	
	}
	public MemberBean getUserInfo(String user_id) throws Exception{
		Connection conn=null;
		PreparedStatement stmt=null;
		
	
		conn=dataSource.getConnection();
		String sql = "select user_no,user_id, user_name,user_pw,group_no,depart_no,user_level,groupName from member "
				   + " where user_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		MemberBean bean = new MemberBean();
		bean.setUser_no(rs.getInt("user_no"));
		bean.setUser_name(rs.getString("user_name"));
		bean.setUser_id(rs.getString("user_id"));
		bean.setUser_pw(rs.getString("user_pw"));
		bean.setGroup_no(rs.getInt("group_no"));
		bean.setDepart_no(rs.getInt("depart_no"));
		bean.setUser_level(rs.getString("user_level"));
		bean.setGroupName(rs.getString("groupName"));
		conn.close();
		
		return bean;
	}
	/*
	public void modify(String bId,String bName,String bTitle,String bContent) {
		BDto dto=new BDto();
		
		Connection conn=null;
		PreparedStatement stmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="Update mvc_board set bName = ?, bTitle = ?, bContent = ? where bId = ?";
					
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, bName);
			stmt.setString(2, bTitle);
			stmt.setString(3, bContent);
			stmt.setInt(4, Integer.parseInt(bId));
			int rd=stmt.executeUpdate();
			
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
	}
	
	public void delete(String bId) {
		BDto dto=new BDto();
		
		Connection conn=null;
		PreparedStatement stmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="Delete from mvc_board where bId = ?";
					
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(bId));
			int rd=stmt.executeUpdate();
			
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
	}
	
	
	public ArrayList<BDto> list(){
		ArrayList<BDto> dtos=new ArrayList<BDto>();
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="select bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from mvc_board order by bGroup desc, bStep asc";
			stmt=conn.prepareStatement(sql);
			rs=stmt.executeQuery();

			while(rs.next()) {
				BDto bto=new BDto();
				
				bto.setbId(rs.getInt("bId"));
				bto.setbName(rs.getString("bName"));
				bto.setbTitle(rs.getString("bTitle"));
				bto.setbContent(rs.getString("bContent"));
				bto.setbDate(rs.getTimestamp("bDate"));
				bto.setbHit(rs.getInt("bHit"));
				bto.setbGroup(rs.getInt("bGroup"));
				bto.setbStep(rs.getInt("bStep"));
				bto.setbIndent(rs.getInt("bIndent"));
				
				dtos.add(bto);
			}
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
		return dtos;
	}
	public BDto contentView(String bId) {
		upHit(bId);
		BDto dto=new BDto();
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			conn=dataSource.getConnection();
			String sql="select * from mvc_board where bId = ?";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(bId));
			rs=stmt.executeQuery();

			if(rs.next()) {
				dto.setbId(rs.getInt("bId"));
				dto.setbName(rs.getString("bName"));
				dto.setbTitle(rs.getString("bTitle"));
				dto.setbContent(rs.getString("bContent"));
				dto.setbDate(rs.getTimestamp("bDate"));
				dto.setbHit(rs.getInt("bHit"));
				dto.setbGroup(rs.getInt("bGroup"));
				dto.setbStep(rs.getInt("bStep"));
				dto.setbIndent(rs.getInt("bIndent"));
				
			}
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
		return dto;
		}

	public BDto replyView(String bId) {
		
		
		BDto dto=new BDto();
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			conn=dataSource.getConnection();
			String sql="select * from mvc_board where bId = ?";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(bId));
			rs=stmt.executeQuery();

			if(rs.next()) {
				dto.setbId(rs.getInt("bId"));
				dto.setbName(rs.getString("bName"));
				dto.setbTitle(rs.getString("bTitle"));
				dto.setbContent(rs.getString("bContent"));
				dto.setbDate(rs.getTimestamp("bDate"));
				dto.setbHit(rs.getInt("bHit"));
				dto.setbGroup(rs.getInt("bGroup"));
				dto.setbStep(rs.getInt("bStep"));
				dto.setbIndent(rs.getInt("bIndent"));
				
			}
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
		return dto;
		}
	
	public void reply(String bId,String bName,String bTitle,String bContent,String bGroup,String bStep,String bIndent) {
		
		replyShape(bGroup, bStep);
		
		Connection conn=null;
		PreparedStatement stmt=null;
		
		try {
			conn = dataSource.getConnection();
			String query = "insert into mvc_board (bId, bName, bTitle, bContent, bGroup, bStep, bIndent) values (mvc_board_seq.nextval, ?, ?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, bName);
			stmt.setString(2, bTitle);
			stmt.setString(3, bContent);
			stmt.setInt(4, Integer.parseInt(bGroup));
			stmt.setInt(5, Integer.parseInt(bStep) + 1);
			stmt.setInt(6, Integer.parseInt(bIndent) + 1);
			
			int rn = stmt.executeUpdate();
			
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
	}
	private void replyShape( String strGroup, String strStep) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update mvc_board set bStep = bStep + 1 where bGroup = ? and bStep > ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(strGroup));
			preparedStatement.setInt(2, Integer.parseInt(strStep));
			
			int rn = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	public void upHit(String bId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update mvc_board set bHit = bHit + 1 where bId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(bId));
			
			int rn = preparedStatement.executeUpdate();
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}*/
}
