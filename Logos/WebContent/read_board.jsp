<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/top.jsp"%>
<%@ page import="com.bean.*,com.dao.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.common.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<%
	// 페이지 번호를 추출한다.
	BDao dao=new BDao();
	String page_num_str = request.getParameter("page_num");
	String board_no = request.getParameter("board_no");
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
	BoardBean bean=dao.getSelectedBoard(board_no);
	ArrayList<FileBean> fbean=dao.getSelectedFile(board_no);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
</head>
<body>
<table class="table" align="center"  width="100%" >
	<thead class="thead-inverse">
		<tr>
			<th width="20%">글번호</th>
			<th width="40%">글제목</th>
			<th width="20%">작성자</th>
			<th width="30%">작성일</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td><%=board_no%></td>
			<td><%=bean.getBtitle()%></td>
			<td><%=bean.getBname()%></td>
			<td><%=bean.getBdate()%></td>
		</tr>
		</tbody>
</table>

	<hr class="featurette-divider">
	<div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">여름 캠프 사진 <br><span class="text-muted">It'll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-fluid mx-auto" src="/Logos/fileUpload/<%=fbean.get(0).getFilename() %>" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5 order-md-1">
          <img class="featurette-image img-fluid mx-auto" src="/Logos/fileUpload/<%=fbean.get(1).getFilename() %>" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-fluid mx-auto" src="/Logos/fileUpload/<%=fbean.get(2).getFilename() %>" alt="Generic placeholder image">
        </div>
      </div>
</body>
</html>