<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.bean.*, com.dao.*" %>
<%@ include file="../include/login_check.jsp" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<%@ page import="com.oreilly.servlet.MultipartRequest"
	import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
	import="java.util.*" import="java.net.*" import="java.io.*"%>
<%
	String realPath = "";
	String savePath = "fileUpload";
	String type = "utf-8";
	int maxSize = 5 * 1024 * 1024;

	ServletContext context = getServletContext();
	realPath = context.getRealPath(savePath);
	//out.print("the realpath is : " + realPath + "<br />");
	
	String btitle=request.getParameter("title");
	String bname=request.getParameter("writer");
	ArrayList<String> saveFiles = new ArrayList<String>();
	//ArrayList origFiles = new ArrayList();
	BDao dao=new BDao();
	
	try {
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, type,
				new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			saveFiles.add(multi.getFilesystemName(name));
		}
		
		int board_no=dao.addBoardInfo(btitle, bname, saveFiles);
		response.sendRedirect("../news.jsp?board_no="+board_no);
		
	
	} catch (IOException e) {
		System.out.print(e);
	} catch (Exception e) {
		System.out.print(e);
	}
%>








