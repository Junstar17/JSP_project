<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<%!// String 타입을 리턴하는 getParam() 메소드 정의
	public String getParam(HttpServletRequest request, String paramName) {
		if (request.getParameter(paramName) != null) {
			return request.getParameter(paramName);
		} else {
			return "";
		}
	}%>
<%
	request.setCharacterEncoding("utf-8");
	int filecounter = 0;
	if (request.getParameter("addcnt") != null) {
		filecounter = Integer.parseInt(request.getParameter("addcnt"));
	}
%>
<%@ include file="../include/login_check.jsp"%>
<%-- 로그인 체크 코드가 있는 jsp를 포함시킨다. --%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Write something else you want</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script language="javascript">
	function inputValue(form1, param, form2, idx) {
		var paramValue = form1.elements[idx].value;
		form2.elements[idx].value = paramValue;
		return;
	}
	function addFile(formName) {
		if (formName.addcnt.value == "") {
			alert("입력할 파일 갯수가 입력하고 학인 버튼을 눌러주세요!");
			formName.addcnt.focus();
			return;
		}
		formName.action = "write_board.jsp?addcnt="+formName.addcnt.value;
		formName.submit();

	}

	function elementCheck(formName) {
		paramIndex = 1;
		for (idx = 0; idx < formName.elements.length; idx++) {
			if (formName.elements[idx].type == "file") {
				if (formName.elements[idx].value == "") {
					var message = paramIndex
							+ "번째 파일정보가 없습니다.\n업로드할 파일을 선택하세요!";
					alert(message);
					formName.elements[idx].focus();
					return;
				}
				paramIndex++;
			}
		}
		formName.action = "write_board_pro.jsp?title="+formName.title.value+"&writer="+formName.writer.value;
		formName.submit();
	}
</script>
</head>
<body>
<%--
	<h1>글 작성하기</h1>
	<br />
	<form action="write_board_pro.jsp" name="fileForm" id="fileForm"
		method="post" enctype="multipart/form-data">
		작성자 :	<%=login_bean.getUser_name()%><br/> 
		<input type="hidden" name="writer" value="<%=login_bean.getUser_name() %>"><br /> 
		제목 :<input type="text" name="title"><br/> 
		업로드할 파일 수 입력<input type="text" name="addcnt" value="2" size="3" /> 
		<input type="button" value="확인" onclick="addFile(this.form)" /><br>
		<%
			for (int i = 0; i < filecounter; i++) {
		%>
		<input type="file" name="selectFile<%=i%>"/><br />
		<%
			}
		%>
		<input type="submit" value="전송"  onclick="elementCheck(this.form)" />
		<button type="button">취소</button>
	</form>

</body>
</html> 
 --%>
<div class="container">
<form action="write_board_pro.jsp" name="fileForm" id="fileForm" method="post" enctype="multipart/form-data">
<table class="table table-bordered">
    <thead>
        <caption> 글쓰기 </caption>
    </thead>
        <tbody>
            <tr>
                <th>작성자: </th>
                <td><%=login_bean.getUser_name()%></td>
                <input type="hidden" name="writer" value="<%=login_bean.getUser_name() %>" />
            </tr>
            <tr>
                <th>제목: </th>
                <td><input type="text" name="title" placeholder="제목을 입력하세요." class="form-control"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="10" placeholder="내용을 입력하세요. " name="content" class="form-control"></textarea></td>
            </tr>
            <tr>
                <th>업로드할 파일 수 입력: </th>
                <td><input type="text" name="addcnt" value="1" size="3" /> 
		<input type="button" value="확인" onclick="addFile(this.form)" /></td>
            </tr>
            <%
			for (int i = 0; i < filecounter; i++) {
		%>
			<tr>
				<th></th>
				<td><input type="file" name="selectFile<%=i%>"/><br /></td>
			</tr>
		<%
			}
		%>
            <tr>
            <td colspan="2">
                <input type="submit" value="전송"  onclick="elementCheck(this.form)" class="pull-right"/>
                <input type="button" value="reset" class="pull-left"/>
                <input type="button" value="글 목록으로" class="pull-right" onclick="javascript:location.href='../news.jsp'"/>
            </td>
            </tr>
      </tbody>
</table>
</form>
</div>
</body>
</html>










