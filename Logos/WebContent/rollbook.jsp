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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script> 
<style type="text/css">
label.error {
  font-size: 8pt;
  color: red;
  padding-left:10px;
}
</style>
</head>
<body>
	<div style="padding-top: 80px;width:80%;margin:auto; border:1px">
		<h3>
			&lt;오이코스
			<%=login_bean.getGroup_no()%>
			-
			<%=login_bean.getDepart_no()%>&gt;</h3>
			<br>
			<div align="right" style="width:100%"><%=sdf.format(date) %></div>
		<form id="joinForm" action="rollbook/rollbook_pro.jsp" method="post">
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
						<td><input type="text" name="SatWorshipCount" size="13"/></td>
						<td><input type="text" name="WedWorship" size="13"/></td>
						<td><input type="text" name="FriWorship" size="13"/></td>
						<td><input type="text" name="LastSunWorship" size="13"/></td>
						<td><input type="text" name="SatClean" size="13"/></td>
					</tr>
					<tr>
						<td width="100"><input type="text" name="SRName" size="13"/></td>
						<td><input type="text" name="SatWorshipCount2" size="13"/></td>
						<td><input type="text" name="WedWorship2" size="13"/></td>
						<td><input type="text" name="FriWorship2" size="13"/></td>
						<td><input type="text" name="LastSunWorship2" size="13"/></td>
						<td><input type="text" name="SatClean2" size="13"/></td>
					</tr>
				</tbody>
				</table>
			</div>
			<div class="hidden-sm hidden-lg">
				<table class="table" height="500" width="100%" border="1" style="text-align:center">
					<thead class="thead-inverse">
					<tr>
						<th></th>
						<td><%=login_bean.getUser_name()%></td>
						<td><input type="text" name="SRName" size="5" /></td>
					</tr>
					<tr>
						<th>새벽기도</th>
						<td><input type="text" name="SatWorshipCount" size="5"/></td>
						<td><input type="text" name="SatWorshipCount2" size="5"/></td>
					</tr>
					<tr>
						<th>수요예배</th>
						<td><input type="text" name="WedWorship" size="5"/></td>
						<td><input type="text" name="WedWorship2" size="5"/></td>
					</tr>
					<tr>
						<th>금요예배</th>
						<td><input type="text" name="FriWorship" size="5"/></td>
						<td><input type="text" name="FriWorship2" size="5"/></td>
					</tr>
					<tr>
						<th>주일예배</th>
						<td><input type="text" name="LastSunWorship" size="5" /></td>
						<td><input type="text" name="LastSunWorship2" size="5"/></td>
					</tr>
					<tr>
						<th>토요청소</th>
						<td><input type="text" name="SatClean" size="5"/></td>
						<td><input type="text" name="SatClean2" size="5"/></td>
					</tr>
					</thead>
				</table>
			</div>
			<br>
			<br>
			<div class="hidden-xs">
			<table class="table" width="100%" border="1" style="text-align:center">
				<thead class="thead-inverse">
				<tr>
					<th>남자</th>
					<th>여자</th>
					<th>합계</th>
					<th>성경</th>
					<th>새벽기도</th>
					<th>금요예배</th>
					<th>주일예배</th>
					<th>토요청소</th>
					<th>주일청소</th>
					<th>전도</th>
					<th>정회원</th>
					<th>새회원</th>
				</tr>
				</thead>
				<tr>
					<td><input type="text" name="ManCount" size="1"/></td>
					<td><input type="text" name="WomanCount" size="1"/></td>
					<td><input type="text" name="total" size="1"/></td>
					<td><input type="text" name="bible" size="1"/></td>
					<td><input type="text" name="TSatWorshipCount" size="4"/></td>
					<td><input type="text" name="TFriWorship" size="4"/></td>
					<td><input type="text" name="TLastSunWorship" size="4"/></td>
					<td><input type="text" name="TSatClean" size="4"/></td>
					<td><input type="text" name="TSunClean" size="4"/></td>
					<td><input type="text" name="invite" size="1"/></td>
					<td><input type="text" name="RegularMember" size="3"/></td>
					<td><input type="text" name="NewMember" size="3"/></td>
				</tr>
			</table>
			</div>
			<div class="hidden-sm hidden-lg">
			<table class="table" height="500" width="100%" border="1" style="text-align:center">
			<thead class="thead-inverse">
					<tr>
						<th>남자</th>
						<td><input type="text" name="ManCount" size="13" /></td>
					</tr>
					<tr>
						<th>여자</th>
						<td><input type="text" name="WomanCount" size="13"/></td>
					</tr>
					<tr>
						<th>합계</th>
						<td><input type="text" name="total" size="13"/></td>
					</tr>
					<tr>
						<th>성경</th>
						<td><input type="text" name="bible" size="13"/></td>
					</tr>
					<tr>
						<th>새벽기도</th>
						<td><input type="text" name="TSatWorshipCount" size="13" /></td>
					</tr>
					<tr>
						<th>금요예배</th>
						<td><input type="text" name="TFriWorship" size="13"/></td>
					</tr>
					<tr>
						<th>주일예배</th>
						<td><input type="text" name="TLastSunWorship" size="13"/></td>
					</tr>
					<tr>
						<th>토요청소</th>
						<td><input type="text" name="TSatClean" size="13"/></td>
					</tr>
					<tr>
						<th>주일청소</th>
						<td><input type="text" name="TSunClean" size="13"/></td>
					</tr>
					<tr>
						<th>전도</th>
						<td><input type="text" name="invite" size="13"/></td>
					</tr>
					<tr>
						<th>정회원</th>
						<td><input type="text" name="RegularMember" size="13"/></td>
					</tr>
					<tr>
						<th>새회원</th>
						<td><input type="text" name="NewMember" size="13"/></td>
					</tr>
					</thead>
				</table>
				</div>
			
			<div align="center" style="padding-top:30px">
			<input type="submit" value="전송">
			</div>
		</form>
		<script>
$("#joinForm").validate({ // joinForm에 validate를 적용
    rules:{
    	SatWorshipCount:{required:true}, 
    	WedWorship:{required:true},
    	FriWorship:{required:true},
    	LastSunWorship:{required:true},
    	SatClean:{required:true},
    	SatWorshipCount2:{required:true},
    	WedWorship2:{required:true},
    	FriWorship2:{required:true},
    	LastSunWorship2:{required:true},
    	SatClean2:{required:true},
    	ManCount:{required:true},
    	WomanCount:{required:true},
    	total:{required:true},
    	bible:{required:true},
    	TSatWorshipCount:{required:true},
    	TFriWorship:{required:true},
    	TLastSunWorship:{required:true},
    	TSatClean:{required:true},
    	TSunClean:{required:true},
    	invite:{required:true},
    	RegularMember:{required:true},
    	NewMember:{required:true}
    } ,
    messages:{ // rules에 해당하는 메시지를 지정하는 속성 (규칙이름과 메시지를 작성)
    	SatWorshipCount:{
            required:"없으면 0을 입력하세요" 
        },
        WedWorship:{
            required:"없으면 0을 입력하세요"
        },
        FriWorship:{
            required:"없으면 0을 입력하세요"
        },
        LastSunWorship:{
            required:"없으면 0을 입력하세요"
        },
        SatClean:{
            required:"없으면 0을 입력하세요"
        },
        SatWorshipCount2:{
            required:"없으면 0을 입력하세요"
        },
        WedWorship2:{
            required:"없으면 0을 입력하세요"
        },
        FriWorship2:{
            required:"없으면 0을 입력하세요"
        },
        LastSunWorship2:{
            required:"없으면 0을 입력하세요"
        },
        SatClean2:{
            required:"없으면 0을 입력하세요"
        },
        ManCount:{
            required:"없으면 0을 입력하세요"
        },
        WomanCount:{
            required:"없으면 0을 입력하세요"
        },
        total:{
            required:"없으면 0을 입력하세요"
        },
        bible:{
            required:"없으면 0을 입력하세요"
        },
        TSatWorshipCount:{
            required:"없으면 0을 입력하세요"
        },
        TFriWorship:{
            required:"없으면 0을 입력하세요"
        },
        TLastSunWorship:{
            required:"없으면 0을 입력하세요"
        },
        TSatClean:{
            required:"없으면 0을 입력하세요"
        },
        TSunClean:{
            required:"없으면 0을 입력하세요"
        },
        invite:{
            required:"없으면 0을 입력하세요"
        },
        RegularMember:{
            required:"없으면 0을 입력하세요"
        },
        NewMember:{
            required:"없으면 0을 입력하세요"
        }
    } 
});
</script>
	</div>
	
</body>
</html>
