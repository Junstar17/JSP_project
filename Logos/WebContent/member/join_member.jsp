<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" type="text/css" href="../new.css" />
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join_member.jsp</title>
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
<div id="bgd"></div>
    <div  id="content" class="container-max">
	<h1>회원가입</h1><br/>
	<form id="joinForm" method="post" action="join_member_pro.jsp">
    <table border="1" cellspacing="0" cellpadding="5" style="width:550px;">
        <tr><th colspan="2" >회원 가입</th></tr>
        <tr><td>아이디</td><td><input type="text" id="user_id" name="user_id"/></td></tr>
        <tr><td>패스워드</td><td><input type="password" id="user_pw" name="user_pw"/></td></tr>
        <tr><td>패스워드확인</td><td><input type="password" id="pwdConfirm" name="pwdConfirm"/></td></tr>
        <tr><td>이름</td><td><input type="text" id="user_name" name="user_name"/></td></tr>
        <tr><td>오이코스번호<br>(ex 오이코스 1-1)</td><td><input type="text" id="group_no" name="group_no"/>
        - <input type="text" id="depart_no" name="depart_no"/></td></tr>
        <tr><td colspan="2" style="text-align:right;"><input type="submit" value="JOIN!"/></td></tr>
    </table>
</form>
<script>
$("#joinForm").validate({ // joinForm에 validate를 적용
    rules:{
    	user_id:{required:true, rangelength:[3,10]}, // required는 필수, rangelength는 글자 개수(5~10개 사이)
    	user_pw:{required:true, rangelength:[3,15]},
        pwdConfirm:{required:true, equalTo:"#user_pw"}, // equalTo : id가 pwd인 값과 같아야함
        user_name:"required" // 검증값이 하나일 경우 이와 같이도 가능
    } ,
    messages:{ // rules에 해당하는 메시지를 지정하는 속성 (규칙이름과 메시지를 작성)
    	user_id:{
            required:"ID를 입력하세요", 
            rangelength:"3글자 이상, 10글자 이하여야 합니다."
        },
        user_pw:{
            required:"패스워드를 입력하세요",
            rangelength:"5글자 이상, 15글자 이하여야 합니다"
        },
        pwdConfirm:{
            required:"패스워드를 다시 입력하세요",
            equalTo:"패스워드가 다릅니다"
        },
        user_name:{
            required:"이름을 입력하세요"
        }
    } 
});
</script>
</body>
</html>










