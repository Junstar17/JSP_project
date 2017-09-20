<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<%-- 로그인 체크 코드가 있는 jsp를 포함시킨다. --%>
<%@ include file="../include/login_check.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/write_board.jsp</title>
</head>
<body>

	<h1>글 작성하기</h1><br/>
	<form action="write_board_pro.jsp" name="fileForm" id="fileForm" method="post" enctype="multipart/form-data">
		작성자 : <%=login_bean.getUser_name() %><br/>
				<input type="hidden" name="board_writer"><br/>
		제목 : <input type="text" name="board_subject"><br/>
		<input type="file" name="uploadFile" id="uploadFile"> <br/>
		<button type="submit">작성완료</button>
		<button type="button">취소</button>
	</form>
</body>
</html>









