<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
	
	response.sendRedirect("../main.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join_complate.jsp</title>
</head>
<body>
	회원 가입이 완료되었습니다<br/>
	<a href="../main.jsp">로그인하기</a>
</body>
</html>








