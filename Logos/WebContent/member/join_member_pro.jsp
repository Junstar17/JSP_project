<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.bean.*" %>
<%@ page import="com.dao.*" %>
<%@ page import="java.sql.*" %>
<%-- member/join_member_pro.jsp --%>
<%
	// 파라미터 데이터를 추출
	request.setCharacterEncoding("utf-8");
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String user_name = request.getParameter("user_name");
	String group_no1 = request.getParameter("group_no");
	int group_no=Integer.parseInt(group_no1);
	String depart_no1 = request.getParameter("depart_no");
	int depart_no=Integer.parseInt(depart_no1);
	
	MDao dao = new MDao();
	dao.add_member_info(user_id,user_pw,user_name,group_no,depart_no);
	
	// 이동
	response.sendRedirect("join_complate.jsp");
%>







