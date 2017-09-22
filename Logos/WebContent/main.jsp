<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="include/top.jsp" %>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
	
%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
</head>
<body>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="first-slide" src="images/main.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption d-none d-md-block text-left">
              <!-- <h1>로고스 올인원 행사</h1>
              <p>백지영 & 최강희와 함께하는 행사</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p> -->
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <img class="second-slide" src="images/main1.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption d-none d-md-block">
              <!-- <h1>오시는 길</h1>
              <p>서초구 방배동</p> 
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>-->
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <img class="third-slide" src="images/main2.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption d-none d-md-block text-right">
              <!-- <h1>주일 오후 2시 청년예배</h1>
              <p>Cras </p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p> -->
            </div>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel <p>'로고스'란 헬라어로 '하나님, 말씀, 성육신 하신 예수님'을 뜻합니다.진리의 말씀 위에 세워진 교회이며, 성육신 하신 예수님을 삶의 현장에서 체험하는 교회라는 뜻입니다. </p>-->
      <div class="row">
        <div class="col-lg-4">
          <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
          <h2>로고스 교회</h2>
          <p>'로고스'란 헬라어로 '하나님, 말씀, 성육신 하신 예수님'을 뜻합니다.진리의 말씀 위에 세워진 교회이며, 성육신 하신 예수님을 삶의 현장에서 체험하는 교회라는 뜻입니다. </p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
          <h2>오시는 길</h2>
          <p>위치는 서울시 서초구 방배4동 이수역 바로 앞에 위치하여 있습니다. 이수역 11번 출구로 나와 직진후 삼거리에서 좌회전하시면 바로 보실수 있는 거리에 위치해있습니다.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="rounded-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
          <h2>담임 목사</h2>
          <p>전준구 목사님 .  id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->


      <!-- START THE FEATURETTES -->



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
  </body>
</html>