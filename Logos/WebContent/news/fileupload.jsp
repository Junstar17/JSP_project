<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%!
// String 타입을 리턴하는 getParam() 메소드 정의
 public String getParam(HttpServletRequest request,String paramName){
  if(request.getParameter(paramName) != null){
   return request.getParameter(paramName);
  }else{
   return "";
  }
 }
%>
<%
 request.setCharacterEncoding("utf-8");
 int filecounter = 0;
 if(request.getParameter("addcnt") != null){
  filecounter = Integer.parseInt(request.getParameter("addcnt"));
 }
%>
<html>
 <head>
  <title>다중 파일 업로드</title>
  <script language="javascript">
   function inputValue(form1,param,form2,idx){
    var paramValue = form1.elements[idx].value;
    form2.elements[idx].value = paramValue;
    return;
   }
   function addFile(formName){
    if(formName.addcnt.value == ""){
     alert("입력할 파일 갯수가 입력하고 학인 버튼을 눌러주세요!");
     formName.addcnt.focus();
     return;
    }
    formName.submit();
   }
   function elementCheck(formName){
    paramIndex = 1;
    for(idx=0;idx<formName.elements.length;idx++){
     if(formName.elements[idx].type == "file"){
      if(formName.elements[idx].value == ""){
       var message = paramIndex+"번째 파일정보가 없습니다.\n업로드할 파일을 선택하세요!";
       alert(message);
       formName.elements[idx].focus();
       return;
      }
      paramIndex++;
     }
    }
    formName.action = "fileupload_pro.jsp";
    formName.submit();
   }
  </script>
 </head>
 <body>
  <form name="frmName1">
   업로드할 파일 수 입력<input type="text" name="addcnt" value="2" size="3" />
   <input type="button" value="확인" onClick="addFile(this.form)" />
  </form>
  <form name="frmName2" method="post" enctype="multipart/form-data">
   <% for(int i=0;i<filecounter;i++){ %>
   <input type="file" name="selectFile<%= i %>" /><br />
   <% } %>
   <input type="button" value="전송" onClick="elementCheck(this.form)" />
  </form>
 </body>
</html>

