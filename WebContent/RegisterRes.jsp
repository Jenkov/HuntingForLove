<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mybean.Register" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'RegisterRes.jsp' starting page</title>
    
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
	<script type ="text/javascript">
		setTimeout('window.location="right.jsp"',10000);
	</script>
	
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

  
  
  
  
  
  
  <jsp:useBean id="register" type="mybean.Register" scope="request"></jsp:useBean>
  	<div>
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...10秒后自动跳转
	<a href ="right.jsp">立即跳转</a>
  	<h1><jsp:getProperty property="feedback" name="register"/></h1>
    <table border ="1">

    	<tr>
			<td>昵称</td>
			<td><jsp:getProperty property="logname" name="register"/></td>    	
    	</tr>
    	<tr>
			<td>真实姓名</td>
			<td><jsp:getProperty property="realname" name="register"/></td>    	
    	</tr>
    	<tr>
			<td>性别</td>
			<td><jsp:getProperty property="gender" name="register"/></td>    	
    	</tr>
    	<tr>
			<td>年龄</td>
			<td><jsp:getProperty property="age" name="register"/></td>    	
    	</tr>
    	<tr>
			<td>位置</td>
			<td><jsp:getProperty property="location" name="register"/></td>    	
    	</tr>
    	
    	<tr>
			<td>注册电话</td>
			<td><jsp:getProperty property="phone" name="register"/></td>    	
    	</tr>
    	<tr>
			<td>注册QQ</td>
			<td><jsp:getProperty property="QQ" name="register"/></td>    	
    	</tr>
    	<tr>
			<td>注册email</td>
			<td><jsp:getProperty property="email" name="register"/></td>    	
    	</tr>
    	<tr>
			<td>其他联系方式</td>
			<td><jsp:getProperty property="othercontactway" name="register"/></td>    	
    	</tr>
    	<tr>
			<td>简单介绍下自己</td>
			<td><textarea rows="5" cols="20"><jsp:getProperty property="message" name="register"/></textarea></td>    	
    	</tr>
    </table>
  	</div>
  	
  	
  	</div>
  </body>
</html>
