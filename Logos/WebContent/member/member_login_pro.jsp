<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.bean.*,com.dao.*,com.common.*" %>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
	
	// member/member_login_pro.jsp
	// 파라미터 데이터 추출
	request.setCharacterEncoding("utf-8");
	DataBean enroll_bean = (DataBean) session.getAttribute("enroll_bean");
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String next=null;
	next=request.getParameter("next");
	// 빈객체 생성
	MemberBean bean = new MemberBean();
	bean.setUser_id(user_id);
	bean.setUser_pw(user_pw);
	MDao dao=new MDao();
	// 로그인 체크
	int result = dao.check_login(bean);
		
	if(result == Common.LOGIN_SUCCESS) {
		// 사용자 정보를 가져온다.
		MemberBean login_bean = dao.getUserInfo(user_id);
		// 로그인 여부값을 넣어준다.
		login_bean.setLogin(true);
		// 세션에 사용자 정보 객체를 저장한다.
		session.setAttribute("login_bean", login_bean);
		RDao rdao =new RDao();
		enroll_bean=rdao.getselectata(login_bean.getUser_no());
		
		if(next.equals(null)){
			if(enroll_bean.isEnrolled()){
				response.sendRedirect("../read_rollbook.jsp?user_no="+login_bean.getUser_no());
			}
			else
			response.sendRedirect("../rollbook.jsp");
		}
		else
			response.sendRedirect("../main.jsp");
	} 
	else {
		response.sendRedirect("../loginBT.jsp?login=" + result);
	}
%>









