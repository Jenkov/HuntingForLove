<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybean.UserInfo" %>
<%@ page import="java.util.*" %>
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

	
	
	<jsp:useBean id="userinfo" type="mybean.UserInfo" scope ="request"></jsp:useBean>
	<!-- 
		<ul>
			<li><a href="PageDealCouple?gender='男'">只看男士</a></li>
			<li><a href="PageDealCouple?gender='女'">只看女士</a></li>
			
		</ul>
	 -->
	<table>
		<tr>
			<td colspan="2"><a href="PageDealFindHimOrHer?name=<jsp:getProperty property="logname" name="userinfo"/>"><img src="image/<jsp:getProperty property="pic" name="userinfo"/>" width="280" height="400" /></a></td>			
		</tr>
		<tr>
			<td colspan ="2"><jsp:getProperty property="logname" name="userinfo"/></td>
		</tr>
		<tr>
			<td><a href="PageDealFindHimOrHer?name=<jsp:getProperty property="logname" name="userinfo"/>"><img src="image/good.gif" width="50" height="50"/>感兴趣,进一步了解</a></td>
			<td><a href="PageDealCouple"><img src="image/bad.gif" width="50" height="50"/>没兴趣，下一个</a></td>
		</tr>
		
	</table>
	
	
	
	
	</div>
</body>
</html>