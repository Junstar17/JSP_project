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
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<%-- 로그인 체크 코드가 있는 jsp를 포함시킨다. --%>

<%
	RDao dao=new RDao();
	Date date=new Date();
	
	String selectDate=request.getParameter("datepicker");
	if(selectDate==null){
		selectDate="";
	}
	else{
			
		ArrayList<DataBean> list = new ArrayList<DataBean>();
		list=dao.getDataAll(selectDate);
		request.setAttribute("allData", list);
	}
%>

<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>board/main.jsp</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat : "yy/mm/dd"
    });
    
  } );
  </script>
  <script>
	function exportToExcel(frm){
		
		//document.searchForm.submit();
		location.href="rollbook/exportToExcel.jsp?datepicker="+frm.datepicker.value;
	}
</script>
</head>
<body>

	<div align="center" style="color:white; background-color:#04B4AE; padding:20px;">
	<h1>출석부 리스트</h1>
	</div>
	<form action="merge_rollbook.jsp" method="post">
	<p>Date: <input type="text" id="datepicker" name="datepicker" value="<%=selectDate %>"><input type="submit" value="선택" />
	<button type="button" onclick="exportToExcel(form)">엑셀다운로드</button></p>
	</form>
	<table align="center" width="100%">
		<tr bgcolor="#ccffcc" height="30">
			<th width="5%">오이코스 이름</th>
			<th width="5%">리더</th>
			<th width="5%">부리더</th>
			<th width="5%">수요예배(리더)</th>
			<th width="5%">금요예배(리더)</th>
			<th width="5%">새벽기도(리더)</th>
			<th width="5%">토요청소(리더)</th>
			<th width="5%">주일예배(리더)</th>
			<!-- <th>수요예배(부리더)</th>
			<th>금요예배(부리더)</th>
			<th>새벽기도(부리더)</th>
			<th>토요청소(부리더)</th>
			<th>주일예배(부리더)</th> -->
			<th>남자</th>
			<th>여자</th>
			<th>총합</th>
			<th>성경</th>
			<th>새기</th>
			<th>토요청소</th>
			<th>주일청소</th>
			<th>저녁예배</th>
			<th>금요기도</th>
			<th>전도</th>
			<th>정회원</th>
			<th>새회원</th>
		</tr>

		<c:forEach items="${allData}" var="li">
			<tr>
				<td align="center">${li.groupName}</td>
				<td align="center">${li.user_name}</td>
				<td align="center">${li.srname}</td>
				<td align="center">${li.wedworship}</td>
				<td align="center">${li.friworship}</td>
				<td align="center">${li.satworshipcount}</td>
				<td align="center">${li.satclean}</td>
				<td align="center">${li.lastsunworship}</td>
				<%-- <td align="center">${li.wedworship2}</td>
				<td align="center">${li.friworship2}</td>
				<td align="center">${li.satworshipcount2}</td>
				<td align="center">${li.satclean2}</td>
				<td align="center">${li.lastsunworship2}</td> --%>
				<td align="center">${li.mancount}</td>
				<td align="center">${li.womancount}</td>
				<td align="center">${li.total}</td>
				<td align="center">${li.bible}</td>
				<td align="center">${li.tsatworshipcount}</td>
				<td align="center">${li.tsatclean}</td>
				<td align="center">${li.tsunclean}</td>
				<td align="center">${li.tlastsunworship}</td>
				<td align="center">${li.tfriworship}</td>
				<td align="center">${li.invite}</td>
				<td align="center">${li.regularmember}</td>
				<td align="center">${li.newmember}</td>
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>