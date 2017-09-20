<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bean.* , com.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	Boolean isLogin;
	MemberBean login_bean = (MemberBean) session.getAttribute("login_bean");
	DataBean enroll_bean=null;
	if (login_bean != null){
		isLogin = login_bean.isLogin();
		RDao dao =new RDao();
		enroll_bean=dao.getselectata(login_bean.getUser_no());
	}
	else
		isLogin = false;
	
	 
%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/carousel.css" rel="stylesheet" media="screen">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
	<a class="navbar-brand" href="main.jsp">Logos</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarCollapse" aria-controls="navbarCollapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="news.jsp">뉴스
					보기 <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item">
			
				 <%
					if (isLogin) {
						
						if(enroll_bean!=null){
							%><a class="nav-link" href="read_rollbook.jsp?user_no=<%=enroll_bean.getUser_no() %>">출석관리</a><%
						}
						else{
				%> <a class="nav-link" href="rollbook.jsp">출석관리</a> <%
 							}
					} else {
 %> <a class="nav-link" href="login.jsp?next=rollbook">출석관리</a>
				<%
					}
				%> 
			</li>
		</ul>
		<%
			if (isLogin) {
		%>
		<h4><%=login_bean.getUser_name()%>
			님 환영합니다.
		</h4>
		<form action="member/sessionLogout.jsp" method="post">
			<input type="submit" name="logout" value="로그아웃" />
		</form>
		<%
			} else {
		%>

		<form action="login.jsp" class="form-inline mt-2 mt-md-0">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">로그인</button>
		</form>
		<%
			}
		%>
	</div>
	</nav>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/jquery-3.2.1.min.js"><\/script>')
	</script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script src="js/holder.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>