<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.bean.*"%>	
<%
	//로그인 여부 확인
	MemberBean login_bean = (MemberBean)session.getAttribute("login_bean");
	if(login_bean == null || login_bean.isLogin() == false){
		//response.sendRedirect("../main.jsp");
		return;
	}
%>