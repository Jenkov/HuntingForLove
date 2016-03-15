<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
  </head>
  
  <body>
  	  <!---Start-to-nav---->
        <div class="header">
            <nav class="nav1">
                    <a id="menu-toggle" class="anchor-link" href="#"></a>
                    <ul class="simple-toggle" id="menu">
			        	<li ><a href="Login.jsp" target="_parent">登录</a></li>
			        	 <li ><a href="Register.jsp" target="_parent">注册</a></li>
		                <li><a href="PageDealExitLogin" target="_parent">退出登录</a></li>
			        </ul>
            </nav>
				<div class="clearfix"> </div>
				<script type="text/javascript">
				    $(document).ready(function () {

				        $('#menu-toggle').click(function () {
				            $('#menu').toggleClass('open');
				            e.preventDefault();
				        });

				    });
				</script>
		    	
        </div>   
        <!---End-top-nav---->
        <div class="basicdiv">
            <table class="table-full">
              <tr>
                <td class="td-nav">
                   <ul  class="nav navbar-nav">
                       <li ><a href="right.jsp" target="_parent">欢迎-首页</a></li>
                      <li class="active"><a href="Upload.jsp" target="_parent">上传个人头像</a></li>
	                  <li><a href="WriteArticle.jsp" target="_parent">发表征婚交友帖</a></li>
		              <li><a href="WatchArticle.jsp" target="_parent">情感天地</a></li>
		              <li><a href="PageDealCouple" target="_parent">搜一搜你的缘分</a></li>
		              <li><a href="FindHimOrHer.jsp" target="_parent">查找指定用户</a></li>
		              <li><a href="PopularityRank.jsp" target="_parent">人气排行榜</a></li>	
	               </ul>
                </td>        
              </tr>
              <tr>
                <td>
                <!-- Begin of carouse-->
                <div class="cardiv">
		            <div id="carousel-ad" class="carousel slide" data-ride="carousel" data-interval="1600">
                       <ol class="carousel-indicators">
                          <li data-target="#carousel-ad" data-slide-to="0" class="active"></li>
                          <li data-target="#carousel-ad" data-slide-to="1"></li>
                          <li data-target="#carousel-ad" data-slide-to="2"></li>
                       </ol>
                       <div class="carousel-inner">
                           <div class="item active"><a href="right.jsp" target="_parent"><img class="img-responsive img-rounded" src="image/welcome/1.jpg"></a></div>
                           <div class="item"> <a href="right.jsp" target="_parent"><img class="img-responsive img-rounded" src="image/welcome/2.jpg"></a></div>
                           <div class="item"> <a href="right.jsp" target="_parent"><img class="img-responsive img-rounded" src="image/welcome/3.jpg"></a></div>
                       </div>
                       <a class="carousel-control left" href="#carousel-ad"  data-slide="prev">&lsaquo;</a>
                       <a class="carousel-control right" href="#carousel-ad" data-slide="next">&rsaquo;</a>
                   </div>
		        </div>	 
                <!-- End of carouse-->
                </td>    
             </tr>        
           </table>
        </div>
        
  
  </body>
</html>
