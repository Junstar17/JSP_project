<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.bean.*, com.common.*, com.dao.*"%>
<%@ include file="../include/login_check.jsp" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<%
	request.setCharacterEncoding("utf-8");
	String user_no9=request.getParameter("user_no");
	int user_no=Integer.parseInt(user_no9);
	String SatWorshipCount9=request.getParameter("SatWorshipCount");
	int SatWorshipCount=Integer.parseInt(SatWorshipCount9);
	String WedWorship9=request.getParameter("WedWorship");
	int WedWorship=Integer.parseInt(WedWorship9);
	String FriWorship9=request.getParameter("FriWorship");
	int FriWorship=Integer.parseInt(FriWorship9);
	String LastSunWorship9=request.getParameter("LastSunWorship");
	int LastSunWorship=Integer.parseInt(LastSunWorship9);
	String SatClean9=request.getParameter("SatClean");
	int SatClean=Integer.parseInt(SatClean9);
	
	String SRName=request.getParameter("SRName");
	
	String SatWorshipCount29=request.getParameter("SatWorshipCount2");
	int SatWorshipCount2=Integer.parseInt(SatWorshipCount29);
	String WedWorship29=request.getParameter("WedWorship2");
	int WedWorship2=Integer.parseInt(WedWorship29);
	String FriWorship29=request.getParameter("FriWorship2");
	int FriWorship2=Integer.parseInt(FriWorship29);
	String LastSunWorship29=request.getParameter("LastSunWorship2");
	int LastSunWorship2=Integer.parseInt(LastSunWorship29);
	String SatClean29=request.getParameter("SatClean2");
	int SatClean2=Integer.parseInt(SatClean29);
	String ManCount9=request.getParameter("ManCount");
	int ManCount=Integer.parseInt(ManCount9);
	String WomanCount9=request.getParameter("WomanCount");
	int WomanCount=Integer.parseInt(WomanCount9);
	String total9=request.getParameter("total");
	int total=Integer.parseInt(total9);
	String bible9=request.getParameter("bible");
	int bible=Integer.parseInt(bible9);
	String TSatWorshipCount9=request.getParameter("TSatWorshipCount");
	int TSatWorshipCount=Integer.parseInt(TSatWorshipCount9);
	String TFriWorship9=request.getParameter("TFriWorship");
	int TFriWorship=Integer.parseInt(TFriWorship9);
	String TLastSunWorship9=request.getParameter("TLastSunWorship");
	int TLastSunWorship=Integer.parseInt(TLastSunWorship9);
	String TSatClean9=request.getParameter("TSatClean");
	int TSatClean=Integer.parseInt(TSatClean9);
	String TSunClean9=request.getParameter("TSunClean");
	int TSunClean=Integer.parseInt(TSunClean9);
	String invite9=request.getParameter("invite");
	int invite=Integer.parseInt(invite9);
	String RegularMember9=request.getParameter("RegularMember");
	int RegularMember=Integer.parseInt(RegularMember9);
	String NewMember9=request.getParameter("NewMember");
	int NewMember=Integer.parseInt(NewMember9);
	
	RDao dao=new RDao();
	dao.modifyData(user_no, SatWorshipCount, WedWorship, FriWorship, LastSunWorship, SatClean, SRName, SatWorshipCount2, WedWorship2, FriWorship2, LastSunWorship2, SatClean2, ManCount, WomanCount, total, bible, TSatWorshipCount, TFriWorship, TLastSunWorship, TSatClean, TSunClean, invite, RegularMember, NewMember);
	
	response.sendRedirect("../read_rollbook.jsp?user_no="+user_no);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>