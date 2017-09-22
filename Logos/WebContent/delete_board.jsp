<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.bean.*" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.common.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="include/top.jsp" %>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<%-- 로그인 체크 코드가 있는 jsp를 포함시킨다. --%>

<%
	// 페이지 번호를 추출한다.
	BDao dao=new BDao();
	String page_num_str = request.getParameter("page_num");
	
	int page_num = 1;
	if(page_num_str != null){
		page_num = Integer.parseInt(page_num_str);
	}
	// 전체 글의 개수를 가져온다.
	int board_cnt_all = dao.getBoardCntAll();
	// 페이지의 수를 구한다.
	int page_cnt = board_cnt_all / Common.BOARD_CNT_ONE_PAGE;
	if(board_cnt_all % Common.BOARD_CNT_ONE_PAGE > 0){
		page_cnt++;
	}
	// 페이지 번호가 페이지의 수보다 많을 때를 대비
	// 사용자가 직접 주소를 입력하고 들어온 경우를 대비
	if(page_num > page_cnt){
		page_num = page_cnt;
	}
	// 글 목록 데이터를 가져온다.
	ArrayList<BoardBean> list = new ArrayList<BoardBean>();
	list=dao.getBoardAll(page_num);
%>

<html>
<head>
<meta charset="UTF-8">
<title>board/main.jsp</title>
</head>
<script>
		function page_back(){

				history.go(-1)();

		}
</script>
<body>
	
	<div align="center" style="color:white; background-color:#04B4AE; padding:20px;">
	<h1>소식지 게시판</h1>
	</div>
	
	<table class="table" align="center" border="1" width="800" style="text-align:center">
			<thead class="thead-inverse">
			<tr>
				<th width="10%">글번호</th>
				<th>글제목</th>
				<th width="20%">작성자</th>
				<th width="20%">작성일</th>
			</tr>
			</thead>
			<form action="news/delete_board_pro.jsp" method="post">
			<% for(BoardBean bean : list){ %>
			<tr>
				
				<td><input type="checkbox" name="check" value="<%=bean.getBoard_no() %>"><%=bean.getBoard_no() %></td>
				<td><a href="read_board.jsp?board_no=<%=bean.getBoard_no()%>&page_num=<%=page_num%>">
						<%=bean.getBtitle() %>
					</a>
				</td>
				<td><%=bean.getBname() %></td>
				<td><%=bean.getBdate() %></td>
			</tr>
			<% } %>
			
		</table>
		<div align="center">
		<button type="submit" class="btn btn-dark" >삭제</button>
		<input type="button" class="btn btn-dark" onclick="page_back();" value="취소">
		</div>
	</form>
</body>
</html>