<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.bean.*, com.dao.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<%-- board/write_board_pro.jsp --%>
<%@ include file="../include/login_check.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String board_subject = request.getParameter("board_subject");
	String board_writer = request.getParameter("board_writer");

	BDao dao=new BDao();
	int board_no =dao.addBoardInfo(board_subject,board_writer);
	
	response.sendRedirect("read_board.jsp?board_no=" + board_no);

	
	
	int maxSize  = 1024*1024*10;		

	// 웹서버 파일 저장 경로
	String savePath = request.getSession().getServletContext().getRealPath("/") + "fileUpload";	
	//out.print(savePath);
	out.print(savePath);
	
	MultipartRequest multi = null;
	multi = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		
	
%>









