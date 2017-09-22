<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="com.bean.*, com.common.*, com.dao.*, java.util.List"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
	Calendar now = new GregorianCalendar();
	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH) + 1;
	int day = now.get(Calendar.DAY_OF_MONTH);
	int hour = now.get(Calendar.HOUR_OF_DAY);
	int minute = now.get(Calendar.MINUTE);
	int second = now.get(Calendar.SECOND);
	int MILLISECOND = now.get(Calendar.MILLISECOND);
	StringBuffer str = new StringBuffer();
	str.append(year).append(month).append(day).append(hour).append(minute).append(second).append(MILLISECOND);


	String filename = str.toString();
	response.setHeader("Content-Type", "application/vnd.ms-xls");
	response.setHeader("Content-Disposition", "inline; filename=Download_" + filename + ".xls");
%>​ 
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<th>수요예배(부리더)</th>
			<th>금요예배(부리더)</th>
			<th>새벽기도(부리더)</th>
			<th>토요청소(부리더)</th>
			<th>주일예배(부리더)</th>
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
				<td align="center">${li.wedworship2}</td>
				<td align="center">${li.friworship2}</td>
				<td align="center">${li.satworshipcount2}</td>
				<td align="center">${li.satclean2}</td>
				<td align="center">${li.lastsunworship2}</td>
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