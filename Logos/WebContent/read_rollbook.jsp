<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/top.jsp"%>
<%@ page import="com.bean.*,com.dao.*"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);

	Date date=new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String user_no9=request.getParameter("user_no");
	int user_no=Integer.parseInt(user_no9);
	
	RDao dao=new RDao();
	DataBean bean=dao.getBoardData(user_no);
	bean.setEnrolled(true);
	session.setAttribute("enroll_bean", bean);
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="padding-top: 80px;width:80%;margin:auto; border:1px">
		<h3>
			오이코스
			<%=login_bean.getGroup_no()%>
			-
			<%=login_bean.getDepart_no()%></h3>
			<br>
			<div align="right" style="width:100%"><%=sdf.format(date) %></div>
		<form action="rollbook/modify_rollbook_pro.jsp?user_no=<%=login_bean.getUser_no() %>" method="post">
			<div class="hidden-xs">
				<table class="table" width="100%" border="1" style="text-align:center">
				<thead class="thead-inverse">
					<tr>
						<td width="100"></td>
						<td>새벽기도</td>
						<td>수요예배</td>
						<td>금요예배</td>
						<td>주일예배</td>
						<td>토요청소</td>
					</tr>
					</thead>
					<tbody>
					<tr>
						<input type="hidden" name="user_no" value="<%=login_bean.getUser_no() %>"/>
						<td width="100"><%=login_bean.getUser_name ()%></td>
						<td><input type="text" name="SatWorshipCount" value="<%=bean.getSatworshipcount() %>" /></td>
						<td><input type="text" name="WedWorship" value="<%=bean.getWedworship() %>" /></td>
						<td><input type="text" name="FriWorship" value="<%=bean.getFriworship() %>"/></td>
						<td><input type="text" name="LastSunWorship" value="<%=bean.getLastsunworship() %>"/></td>
						<td><input type="text" name="SatClean" value="<%=bean.getSatclean() %>"/></td>
					</tr>
					<tr>
						<td width="100"><input type="text" name="SRName" size="15" value="<%=bean.getSrname() %>"/></td>
						<td><input type="text" name="SatWorshipCount2" value="<%=bean.getSatworshipcount2() %>"/></td>
						<td><input type="text" name="WedWorship2" value="<%=bean.getWedworship2() %>"/></td>
						<td><input type="text" name="FriWorship2" value="<%=bean.getFriworship2() %>"/></td>
						<td><input type="text" name="LastSunWorship2" value="<%=bean.getLastsunworship2() %>"/></td>
						<td><input type="text" name="SatClean2" value="<%=bean.getSatclean2() %>"/></td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="hidden-sm hidden-lg">
				<table height="500" width="300" border="1" style="text-align:center">
					<tr>
						<td></td>
						<td><%=login_bean.getUser_name()%></td>
						<td><input type="text" name="SRName" size="13" value="<%=bean.getSrname() %>"/></td>
					</tr>
					<tr>
						<td>새벽기도</td>
						<td><input type="text" name="SatWorshipCount" size="13" value="<%=bean.getSatworshipcount() %>"/></td>
						<td><input type="text" name="SatWorshipCount2" size="13" value="<%=bean.getSatworshipcount2() %>"/></td>
					</tr>
					<tr>
						<td>수요예배</td>
						<td><input type="text" name="WedWorship" size="13" value="<%=bean.getWedworship() %>"/></td>
						<td><input type="text" name="WedWorship2" size="13" value="<%=bean.getWedworship2() %>"/></td>
					</tr>
					<tr>
						<td>금요예배</td>
						<td><input type="text" name="FriWorship" size="13" value="<%=bean.getFriworship() %>"/></td>
						<td><input type="text" name="FriWorship2" size="13" value="<%=bean.getFriworship2() %>"/></td>
					</tr>
					<tr>
						<td>주일예배</td>
						<td><input type="text" name="LastSunWorship" size="13" value="<%=bean.getLastsunworship() %>"/></td>
						<td><input type="text" name="LastSunWorship2" size="13" value="<%=bean.getLastsunworship2() %>"/></td>
					</tr>
					<tr>
						<td>토요청소</td>
						<td><input type="text" name="SatClean" size="13" value="<%=bean.getSatclean() %>"/></td>
						<td><input type="text" name="SatClean2" size="13" value="<%=bean.getSatclean2() %>"/></td>
					</tr>

				</table>
			</div>
			<br>
			<br>
			<div class="hidden-xs">
			<table width="100%" border="1" style="text-align:center">
				<tr>
					<td>남자</td>
					<td>여자</td>
					<td>합계</td>
					<td>성경</td>
					<td>새벽기도</td>
					<td>금요예배</td>
					<td>주일예배</td>
					<td>토요청소</td>
					<td>주일청소</td>
					<td>전도</td>
					<td>정회원</td>
					<td>새회원</td>
				</tr>
				<tr>
					<td><input type="text" name="ManCount" size="5" value="<%=bean.getMancount() %>"/></td>
					<td><input type="text" name="WomanCount" size="5" value="<%=bean.getWomancount() %>"/></td>
					<td><input type="text" name="total" size="5" value="<%=bean.getTotal() %>"/></td>
					<td><input type="text" name="bible" size="5" value="<%=bean.getBible() %>"/></td>
					<td><input type="text" name="TSatWorshipCount" size="7" value="<%=bean.getTsatworshipcount() %>"/></td>
					<td><input type="text" name="TFriWorship" size="7" value="<%=bean.getTfriworship() %>"/></td>
					<td><input type="text" name="TLastSunWorship" size="7" value="<%=bean.getTlastsunworship() %>"/></td>
					<td><input type="text" name="TSatClean" size="8" value="<%=bean.getTsatclean() %>"/></td>
					<td><input type="text" name="TSunClean" size="8" value="<%=bean.getTsunclean() %>"/></td>
					<td><input type="text" name="invite" size="8" value="<%=bean.getInvite() %>"/></td>
					<td><input type="text" name="RegularMember" size="8" value="<%=bean.getRegularmember() %>"/></td>
					<td><input type="text" name="NewMember" size="8" value="<%=bean.getNewmember() %>"/></td>
				</tr>
			</table>
			</div>
			<div class="hidden-sm hidden-lg">
			<table height="500" width="300" border="1" style="text-align:center">
					<tr>
						<td>남자</td>
						<td><input type="text" name="ManCount" size="13" value="<%=bean.getMancount() %>"/></td>
					</tr>
					<tr>
						<td>여자</td>
						<td><input type="text" name="WomanCount" size="13" value="<%=bean.getWomancount() %>"/></td>
					</tr>
					<tr>
						<td>합계</td>
						<td><input type="text" name="total" size="13" value="<%=bean.getTotal() %>"/></td>
					</tr>
					<tr>
						<td>성경</td>
						<td><input type="text" name="bible" size="13" value="<%=bean.getBible() %>"/></td>
					</tr>
					<tr>
						<td>새벽기도</td>
						<td><input type="text" name="TSatWorshipCount" size="13" value="<%=bean.getTsatworshipcount() %>"/></td>
					</tr>
					<tr>
						<td>금요예배</td>
						<td><input type="text" name="TFriWorship" size="13" value="<%=bean.getTfriworship() %>"/></td>
					</tr>
					<tr>
						<td>주일예배</td>
						<td><input type="text" name="TLastSunWorship" size="13" value="<%=bean.getTlastsunworship() %>"/></td>
					</tr>
					<tr>
						<td>토요청소</td>
						<td><input type="text" name="TSatClean" size="13" value="<%=bean.getTsatclean() %>"/></td>
					</tr>
					<tr>
						<td>주일청소</td>
						<td><input type="text" name="TSunClean" size="13" value="<%=bean.getTsunclean() %>"/></td>
					</tr>
					<tr>
						<td>전도</td>
						<td><input type="text" name="invite" size="13" value="<%=bean.getInvite() %>"/></td>
					</tr>
					<tr>
						<td>정회원</td>
						<td><input type="text" name="RegularMember" size="13" value="<%=bean.getRegularmember() %>"/></td>
					</tr>
					<tr>
						<td>새회원</td>
						<td><input type="text" name="NewMember" size="13" value="<%=bean.getNewmember() %>"/></td>
					</tr>

				</table>
				</div>
			
			<div align="center" style="padding-top:30px">
			<input type="submit" value="수정">
			</div>
			
		</form>
	</div>
	
</body>
</html>
