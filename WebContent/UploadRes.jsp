<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="mybean.UploadFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
       <link href="css/style.css" rel="stylesheet" type="text/css" />
       <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
       <script src="js/bootstrap.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
	body{
		background:url('image/top/top.jpg') repeat 0px 0px;
	}
</style>
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
<ul  class="nav navbar-nav">
                       <li ><a href="right.jsp" target="_parent">欢迎-首页</a></li>
                      <li class="active"><a href="Upload.jsp" target="_parent">上传个人头像</a></li>
	                  <li><a href="WriteArticle.jsp" target="_parent">发表征婚交友帖</a></li>
		              <li><a href="WatchArticle.jsp" target="_parent">情感天地</a></li>
		              <li><a href="PageDealCouple" target="_parent">搜一搜你的缘分</a></li>
		              <li><a href="FindHimOrHer.jsp" target="_parent">查找指定用户</a></li>
		              <li><a href="PopularityRank.jsp" target="_parent">人气排行榜</a></li>	
	               </ul>




<jsp:useBean id="uploadfile" type="mybean.UploadFile" scope="request"/>
   <font size=2 color=blue>
   <BR> <jsp:getProperty name="uploadfile"  property="feedback"/>
   </font> 
   <br/><font size=2>
   文件名称：<jsp:getProperty name="uploadfile" property="fileName"/>
   <br/>保存后的文件名:<jsp:getProperty name="uploadfile" property="savedFileName"/>
   <br/>
    <img src="D:/eclipse/eclipse-jee-mars-1-win32/workspace/ThinkingInJava/HuntingForLove/WebContent/image/<jsp:getProperty name="uploadfile" property="savedFileName"/>"
     width=120 height=150 />
    </font>



</div>

</body>
</html>