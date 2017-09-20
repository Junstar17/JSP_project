package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.bean.BoardBean;
import com.bean.DataBean;

public class RDao {
	DataSource dataSource;
	public RDao() {
		Context context;
		try {
			context = new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/Oracle11g_rollbook");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
public void addData(int user_no,int SatWorshipCount,int WedWorship,int FriWorship,int LastSunWorship,int SatClean
		,String SRName,int SatWorshipCount2 ,int WedWorship2, int FriWorship2,int LastSunWorship2,int SatClean2
		,int ManCount,int WomanCount,int total,int bible,int TSatWorshipCount
		,int TFriWorship,int TLastSunWorship,int TSatClean,int TSunClean,int invite,int RegularMember,int NewMember) {
		
		Connection conn=null;
		PreparedStatement stmt=null;
		
		
		try {
			conn=dataSource.getConnection();
			String sql="Insert into rollbookdata (USER_NO,TODAY, SRNAME,WEDWORSHIP,FRIWORSHIP, " + 
					"SATWORSHIPCOUNT,SATCLEAN,LASTSUNWORSHIP,MANCOUNT,WOMANCOUNT,TOTAL,BIBLE, " + 
					"TSatWorshipCount,TFRIWORSHIP,TLastSunWorship,TSATCLEAN,TSUNCLEAN,INVITE,REGULARMEMBER, " + 
					"NEWMEMBER,WEDWORSHIP2,FRIWORSHIP2,SATWORSHIPCOUNT2,SATCLEAN2, " + 
					"LASTSUNWORSHIP2) values(?,sysdate,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, user_no);
			stmt.setString(2, SRName);
			stmt.setInt(3, WedWorship);
			stmt.setInt(4, FriWorship);
			stmt.setInt(5, SatWorshipCount);
			stmt.setInt(6, SatClean);
			stmt.setInt(7, LastSunWorship);
			stmt.setInt(8, ManCount);
			stmt.setInt(9, WomanCount);
			stmt.setInt(10, total);
			stmt.setInt(11, bible);
			stmt.setInt(12, TSatWorshipCount);
			stmt.setInt(13, TFriWorship);
			stmt.setInt(14, TLastSunWorship);
			stmt.setInt(15, TSatClean);
			stmt.setInt(16, TSunClean);
			stmt.setInt(17, invite);
			stmt.setInt(18, RegularMember);
			stmt.setInt(19, NewMember);
			stmt.setInt(20, WedWorship2);
			stmt.setInt(21, FriWorship2);
			stmt.setInt(22, SatWorshipCount2);
			stmt.setInt(23, SatClean2);
			stmt.setInt(24, LastSunWorship2);
			
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

	public DataBean getBoardData(int user_no) throws Exception{
		Connection conn=null;
		PreparedStatement stmt=null;
		
		DataBean bean = new DataBean();
		
		try {
			conn=dataSource.getConnection();
			String sql = "select USER_NO,TODAY, SRNAME,WEDWORSHIP,FRIWORSHIP,SATWORSHIPCOUNT, "
					+ "SATCLEAN,LASTSUNWORSHIP,MANCOUNT,WOMANCOUNT,TOTAL,BIBLE,TSatWorshipCount,"
					+ "TFRIWORSHIP,TLastSunWorship,TSATCLEAN,TSUNCLEAN,INVITE,REGULARMEMBER,"
					+ "NEWMEMBER,WEDWORSHIP2,FRIWORSHIP2,SATWORSHIPCOUNT2,SATCLEAN2,"
					+ "LASTSUNWORSHIP2 from rollbookdata where user_no=?";
				
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, user_no);
		
		ResultSet rs = stmt.executeQuery();
		
		rs.next();
		
		bean.setUser_no(rs.getInt("USER_NO"));
		bean.setSrname(rs.getString("SRNAME"));
		bean.setTsatworshipcount(rs.getInt("TSatWorshipCount"));
		bean.setToday(rs.getDate("TODAY"));
		bean.setWedworship(rs.getInt("WEDWORSHIP"));
		bean.setFriworship(rs.getInt("FRIWORSHIP"));
		bean.setSatworshipcount(rs.getInt("SATWORSHIPCOUNT"));
		bean.setSatclean(rs.getInt("SATCLEAN"));
		bean.setLastsunworship(rs.getInt("LASTSUNWORSHIP"));
		bean.setMancount(rs.getInt("MANCOUNT"));
		bean.setWomancount(rs.getInt("WOMANCOUNT"));
		bean.setTotal(rs.getInt("TOTAL"));
		bean.setBible(rs.getInt("BIBLE"));
		bean.setTfriworship(rs.getInt("TFRIWORSHIP"));
		bean.setTsatclean(rs.getInt("TSATCLEAN"));
		bean.setTlastsunworship(rs.getInt("TLastSunWorship"));
		bean.setInvite(rs.getInt("INVITE"));
		bean.setRegularmember(rs.getInt("REGULARMEMBER"));
		bean.setNewmember(rs.getInt("NEWMEMBER"));
		bean.setTsunclean(rs.getInt("TSUNCLEAN"));
		bean.setWedworship2(rs.getInt("WEDWORSHIP2"));
		bean.setFriworship2(rs.getInt("FRIWORSHIP2"));
		bean.setSatworshipcount2(rs.getInt("SATWORSHIPCOUNT2"));
		bean.setSatclean2(rs.getInt("SATCLEAN2"));
		bean.setLastsunworship2(rs.getInt("LASTSUNWORSHIP2"));
		
		
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
		return bean;
	}
	public DataBean getselectata(int user_no) throws Exception{
		Connection conn=null;
		PreparedStatement stmt=null;
		
		DataBean bean = new DataBean();
		
		try {
			conn=dataSource.getConnection();
			String sql = "select USER_NO,TODAY, SRNAME,WEDWORSHIP,FRIWORSHIP,SATWORSHIPCOUNT, "
					+ "SATCLEAN,LASTSUNWORSHIP,MANCOUNT,WOMANCOUNT,TOTAL,BIBLE,TSatWorshipCount,"
					+ "TFRIWORSHIP,TLastSunWorship,TSATCLEAN,TSUNCLEAN,INVITE,REGULARMEMBER,"
					+ "NEWMEMBER,WEDWORSHIP2,FRIWORSHIP2,SATWORSHIPCOUNT2,SATCLEAN2,"
					+ "LASTSUNWORSHIP2 from rollbookdata where user_no=? and to_char(today, 'yyMMdd')=to_char(sysdate, 'yyMMdd')";
				
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, user_no);
		
		ResultSet rs = stmt.executeQuery();
		
		rs.next();
		
		bean.setUser_no(rs.getInt("USER_NO"));
		bean.setSrname(rs.getString("SRNAME"));
		bean.setTsatworshipcount(rs.getInt("TSatWorshipCount"));
		bean.setToday(rs.getDate("TODAY"));
		bean.setWedworship(rs.getInt("WEDWORSHIP"));
		bean.setFriworship(rs.getInt("FRIWORSHIP"));
		bean.setSatworshipcount(rs.getInt("SATWORSHIPCOUNT"));
		bean.setSatclean(rs.getInt("SATCLEAN"));
		bean.setLastsunworship(rs.getInt("LASTSUNWORSHIP"));
		bean.setMancount(rs.getInt("MANCOUNT"));
		bean.setWomancount(rs.getInt("WOMANCOUNT"));
		bean.setTotal(rs.getInt("TOTAL"));
		bean.setBible(rs.getInt("BIBLE"));
		bean.setTfriworship(rs.getInt("TFRIWORSHIP"));
		bean.setTsatclean(rs.getInt("TSATCLEAN"));
		bean.setTlastsunworship(rs.getInt("TLastSunWorship"));
		bean.setInvite(rs.getInt("INVITE"));
		bean.setRegularmember(rs.getInt("REGULARMEMBER"));
		bean.setNewmember(rs.getInt("NEWMEMBER"));
		bean.setTsunclean(rs.getInt("TSUNCLEAN"));
		bean.setWedworship2(rs.getInt("WEDWORSHIP2"));
		bean.setFriworship2(rs.getInt("FRIWORSHIP2"));
		bean.setSatworshipcount2(rs.getInt("SATWORSHIPCOUNT2"));
		bean.setSatclean2(rs.getInt("SATCLEAN2"));
		bean.setLastsunworship2(rs.getInt("LASTSUNWORSHIP2"));
		
		
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
		return bean;
	}
	public void modifyData(int user_no,int SatWorshipCount,int WedWorship,int FriWorship,int LastSunWorship,int SatClean
			,String SRName,int SatWorshipCount2 ,int WedWorship2, int FriWorship2,int LastSunWorship2,int SatClean2
			,int ManCount,int WomanCount,int total,int bible,int TSatWorshipCount
			,int TFriWorship,int TLastSunWorship,int TSatClean,int TSunClean,int invite,int RegularMember,int NewMember) {
			
			Connection conn=null;
			PreparedStatement stmt=null;
			
			try {
				conn=dataSource.getConnection();
				String sql="update rollbookdata set SRNAME=?,WEDWORSHIP=?,FRIWORSHIP=?, " + 
						"SATWORSHIPCOUNT=?,SATCLEAN=?,LASTSUNWORSHIP=?,MANCOUNT=?,WOMANCOUNT=?,TOTAL=?,BIBLE=?, " + 
						"TSatWorshipCount=?,TFRIWORSHIP=?,TLastSunWorship=?,TSATCLEAN=?,TSUNCLEAN=?,INVITE=?,REGULARMEMBER=?, " + 
						"NEWMEMBER=?,WEDWORSHIP2=?,FRIWORSHIP2=?,SATWORSHIPCOUNT2=?,SATCLEAN2=?, " + 
						"LASTSUNWORSHIP2=? where user_no=?";
				stmt=conn.prepareStatement(sql);
				
				stmt.setString(1, SRName);
				stmt.setInt(2, WedWorship);
				stmt.setInt(3, FriWorship);
				stmt.setInt(4, SatWorshipCount);
				stmt.setInt(5, SatClean);
				stmt.setInt(6, LastSunWorship);
				stmt.setInt(7, ManCount);
				stmt.setInt(8, WomanCount);
				stmt.setInt(9, total);
				stmt.setInt(10, bible);
				stmt.setInt(11, TSatWorshipCount);
				stmt.setInt(12, TFriWorship);
				stmt.setInt(13, TLastSunWorship);
				stmt.setInt(14, TSatClean);
				stmt.setInt(15, TSunClean);
				stmt.setInt(16, invite);
				stmt.setInt(17, RegularMember);
				stmt.setInt(18, NewMember);
				stmt.setInt(19, WedWorship2);
				stmt.setInt(20, FriWorship2);
				stmt.setInt(21, SatWorshipCount2);
				stmt.setInt(22, SatClean2);
				stmt.setInt(23, LastSunWorship2);
				stmt.setInt(24, user_no);
				
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

}
