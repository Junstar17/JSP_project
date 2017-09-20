<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="include/top.jsp"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);

	Date date=new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
		<form action="rollbook/rollbook_pro.jsp" method="post">
			<div class="hidden-xs">
				<table class="table" width="100%" border="1" style="text-align:center">
					<thead class="thead-inverse">
					<tr>
						<th width="100"></th>
						<th>새벽기도</th>
						<th>수요예배</th>
						<th>금요예배</th>
						<th>주일예배</th>
						<th>토요청소</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<input type="hidden" name="user_no" value="<%=login_bean.getUser_no() %>"/>
						<td width="100"><%=login_bean.getUser_name()%></td>
						<td><input type="text" name="SatWorshipCount" /></td>
						<td><input type="text" name="WedWorship" /></td>
						<td><input type="text" name="FriWorship" /></td>
						<td><input type="text" name="LastSunWorship" /></td>
						<td><input type="text" name="SatClean" /></td>
					</tr>
					<tr>
						<td width="100"><input type="text" name="SRName" size="15"/></td>
						<td><input type="text" name="SatWorshipCount2" /></td>
						<td><input type="text" name="WedWorship2" /></td>
						<td><input type="text" name="FriWorship2" /></td>
						<td><input type="text" name="LastSunWorship2" /></td>
						<td><input type="text" name="SatClean2" /></td>
					</tr>
				</tbody>
				</table>
			</div>
			<div class="hidden-sm hidden-lg">
				<table height="500" width="300" border="1" style="text-align:center">
					<tr>
						<td></td>
						<td><%=login_bean.getUser_name()%></td>
						<td><input type="text" name="SRName" size="13" /></td>
					</tr>
					<tr>
						<td>새벽기도</td>
						<td><input type="text" name="SatWorshipCount" size="13"/></td>
						<td><input type="text" name="SatWorshipCount2" size="13"/></td>
					</tr>
					<tr>
						<td>수요예배</td>
						<td><input type="text" name="WedWorship" size="13"/></td>
						<td><input type="text" name="WedWorship2" size="13"/></td>
					</tr>
					<tr>
						<td>금요예배</td>
						<td><input type="text" name="FriWorship" size="13"/></td>
						<td><input type="text" name="FriWorship2" size="13"/></td>
					</tr>
					<tr>
						<td>주일예배</td>
						<td><input type="text" name="LastSunWorship" size="13" /></td>
						<td><input type="text" name="LastSunWorship2" size="13"/></td>
					</tr>
					<tr>
						<td>토요청소</td>
						<td><input type="text" name="SatClean" size="13"/></td>
						<td><input type="text" name="SatClean2" size="13"/></td>
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
					<td><input type="text" name="ManCount" size="5"/></td>
					<td><input type="text" name="WomanCount" size="5"/></td>
					<td><input type="text" name="total" size="5"/></td>
					<td><input type="text" name="bible" size="5"/></td>
					<td><input type="text" name="TSatWorshipCount" size="7"/></td>
					<td><input type="text" name="TFriWorship" size="7"/></td>
					<td><input type="text" name="TLastSunWorship" size="7"/></td>
					<td><input type="text" name="TSatClean" size="8"/></td>
					<td><input type="text" name="TSunClean" size="8"/></td>
					<td><input type="text" name="invite" size="8"/></td>
					<td><input type="text" name="RegularMember" size="8"/></td>
					<td><input type="text" name="NewMember" size="8"/></td>
				</tr>
			</table>
			</div>
			<div class="hidden-sm hidden-lg">
			<table height="500" width="300" border="1" style="text-align:center">
					<tr>
						<td>남자</td>
						<td><input type="text" name="ManCount" size="13" /></td>
					</tr>
					<tr>
						<td>여자</td>
						<td><input type="text" name="WomanCount" size="13"/></td>
					</tr>
					<tr>
						<td>합계</td>
						<td><input type="text" name="total" size="13"/></td>
					</tr>
					<tr>
						<td>성경</td>
						<td><input type="text" name="bible" size="13"/></td>
					</tr>
					<tr>
						<td>새벽기도</td>
						<td><input type="text" name="TSatWorshipCount" size="13" /></td>
					</tr>
					<tr>
						<td>금요예배</td>
						<td><input type="text" name="TFriWorship" size="13"/></td>
					</tr>
					<tr>
						<td>주일예배</td>
						<td><input type="text" name="TLastSunWorship" size="13"/></td>
					</tr>
					<tr>
						<td>토요청소</td>
						<td><input type="text" name="TSatClean" size="13"/></td>
					</tr>
					<tr>
						<td>주일청소</td>
						<td><input type="text" name="TSunClean" size="13"/></td>
					</tr>
					<tr>
						<td>전도</td>
						<td><input type="text" name="invite" size="13"/></td>
					</tr>
					<tr>
						<td>정회원</td>
						<td><input type="text" name="RegularMember" size="13"/></td>
					</tr>
					<tr>
						<td>새회원</td>
						<td><input type="text" name="NewMember" size="13"/></td>
					</tr>

				</table>
				</div>
			
			<div align="center" style="padding-top:30px">
			<input type="submit" value="전송">
			</div>
			
		</form>
	</div>
	
</body>
</html>
