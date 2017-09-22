<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String[] values=request.getParameterValues("check");

	BDao dao =new BDao();
	for(int i=0; i<values.length ; i++){
		int checkValues=Integer.parseInt(values[i]);
		dao.deleteBoard(checkValues);
		
	}
	response.sendRedirect("../news.jsp");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>