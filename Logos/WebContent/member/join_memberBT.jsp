<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>bootstrap template</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="../css/font-awesome.min.css" media="screen"
	title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../css/style.css" media="screen"
	title="no title" charset="utf-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<style type="text/css">
label.error {
  font-size: 8pt;
  color: red;
  padding-left:10px;
}
</style>
<script>
		function page_back(){

				history.go(-1)();

		}
</script>
</head>

<body>
	<article class="container">
	<div class="col-md-12">
		<div class="page-header">
			<h1>회원가입</h1>
		</div>
		<form id="joinForm" method="post" class="form-horizontal" action="join_member_pro.jsp">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="user_id">아이디</label>
				<div class="col-sm-6">
					<input class="form-control" id="user_id" name="user_id"
						placeholder="아이디">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="user_pw">비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" name="user_pw" id="user_pw"
						type="password" placeholder="비밀번호">
					<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="pwdConfirm">비밀번호
					확인</label>
				<div class="col-sm-6">
					<input class="form-control" id="pwdConfirm" name="pwdConfirm"
						type="password" placeholder="비밀번호 확인">
					<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="user_name">이름</label>
				<div class="col-sm-6">
					<input class="form-control" name="user_name" id="user_name"
						type="text" placeholder="이름">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="group_no">오이코스번호</label>
				<div class="col-sm-6">
					<input class="form-control" name="group_no" id="group_no"
						type="text" size="30" placeholder="ex 그룹번호"> - <input
						class="form-control" name="depart_no" id="depart_no" size="30"
						type="text" placeholder="ex 부번호">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="tel" class="form-control" id="inputNumber"
							placeholder="- 없이 입력해 주세요" /> <span class="input-group-btn">
							<button class="btn btn-success">
								인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
							</button>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumberCheck">인증번호
					확인</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input class="form-control" id="inputNumberCheck" type="text"
							placeholder="인증번호"> <span class="input-group-btn">
							<button class="btn btn-success" type="button">
								인증번호 확인<i class="fa fa-edit spaceLeft"></i>
							</button>
						</span>
					</div>
					<p class="help-block">전송된 인증번호를 입력해주세요.</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
				<div class="col-sm-6" data-toggle="buttons">
					<label class="btn btn-warning active"> <input id="agree"
						type="checkbox" autocomplete="off" chacked> <span
						class="fa fa-check"></span>
					</label> <a href="#">이용약관</a> 에 동의 합니다.
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="button" class="btn btn-dark" onclick="page_back();">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</div>
		</form>
		<script>
			$("#joinForm").validate({ // joinForm에 validate를 적용
				rules : {
					user_id : {
						required : true,
						rangelength : [ 3, 10 ]
					}, // required는 필수, rangelength는 글자 개수(5~10개 사이)
					user_pw : {
						required : true,
						rangelength : [ 3, 15 ]
					},
					pwdConfirm : {
						required : true,
						equalTo : "#user_pw"
					}, // equalTo : id가 pwd인 값과 같아야함
					user_name : "required", // 검증값이 하나일 경우 이와 같이도 가능
					group_no : "required",
					depart_no: "required"
				},
				messages : { // rules에 해당하는 메시지를 지정하는 속성 (규칙이름과 메시지를 작성)
					user_id : {
						required : "ID를 입력하세요",
						rangelength : "3글자 이상, 10글자 이하여야 합니다."
					},
					user_pw : {
						required : "패스워드를 입력하세요",
						rangelength : "5글자 이상, 15글자 이하여야 합니다"
					},
					pwdConfirm : {
						required : "패스워드를 다시 입력하세요",
						equalTo : "패스워드가 다릅니다"
					},
					user_name : {
						required : "이름을 입력하세요"
					},
					group_no : {
						required : "그룹번호를 입력하세요"
					},
					depart_no : {
						required : "부 번호를 입력하세요"
					}
					
				}
			});
		</script>
		<hr>
	</div>
	</article>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
