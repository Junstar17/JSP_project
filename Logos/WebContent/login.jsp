<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/top.jsp" %>
<%@ page import="com.bean.*, com.common.*, com.dao.*"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
	String next=request.getParameter("next");
	// 로그인 결과 파라미터 추출
	String result_str = request.getParameter("login");
	int result = 0;
	if(result_str != null){
		result = Integer.parseInt(result_str);
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(result_str != null){ %>
	<%  if(result == Common.NOT_EXIST_USER_ID){ %>
	<font color="red">등록되지 않은 아이디 입니다</font>
	<br/>
	<% } else if(result == Common.WRONG_USER_PASSWORD){ %>
	<font color="red">비밀번호가 잘못되었습니다</font>
	<br/>
	<% } %>
	<% } %>
	<div id="bgd"></div>
    <div  id="content" class="container-max">
        
		<form action="member/member_login_pro.jsp" method="post">
		<input type="hidden" name=next value="<%=next %>" />
		<p><strong>아 이 디 </strong><input type="text" name="user_id" autocomplete="off"></p>
		<p><strong>비밀번호</strong><input type="password" name="user_pw"/></p>
		<br/>
		<button type="submit" id="your-move" ><strong>로그인</strong></button>
		<a href="member/join_member.jsp" id="your-move"><strong>회원가입</strong></a>
	</form>
	</div>
</body>
</html>
