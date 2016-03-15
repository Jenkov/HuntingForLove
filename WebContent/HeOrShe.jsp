<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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




<jsp:useBean id="userinfo" type="mybean.UserInfo" scope="request"></jsp:useBean>
  	<div>
  	<h1>以下是ta的详细信息，心动就快快拿起手机吧^.^</h1>
    <table border ="1">

		<tr>
			<td>图片</td>
			<td><img src="image/<jsp:getProperty property="pic" name="userinfo"/>" width="400" height="300"/></td>    	
    	</tr>
    	<tr>
			<td>昵称</td>
			<td><jsp:getProperty property="logname" name="userinfo"/></td>    	
    	</tr>
    	<tr>
			<td>真实姓名</td>
			<td><jsp:getProperty property="realname" name="userinfo"/></td>    	
    	</tr>
    	<tr>
			<td>性别</td>
			<td><jsp:getProperty property="gender" name="userinfo"/></td>    	
    	</tr>
    	<tr>
			<td>年龄</td>
			<td><jsp:getProperty property="age" name="userinfo"/></td>    	
    	</tr>
    	<tr>
			<td>位置</td>
			<td><jsp:getProperty property="location" name="userinfo"/></td>    	
    	</tr>
    	
    	<tr>
			<td>电话</td>
			<td><jsp:getProperty property="phone" name="userinfo"/></td>    	
    	</tr>
    	<tr>
			<td>QQ</td>
			<td><jsp:getProperty property="QQ" name="userinfo"/></td>    	
    	</tr>
    	<tr>
			<td>email</td>
			<td><jsp:getProperty property="email" name="userinfo"/></td>    	
    	</tr>
    	<tr>
			<td>其他联系方式</td>
			<td><jsp:getProperty property="othercontactway" name="userinfo"/></td>    	
    	</tr>

    	<tr>
			<td>Ta的简单自我介绍</td>
			<td><textarea rows="5" cols="100"><jsp:getProperty property="message" name="userinfo"/></textarea></td>    	
    	</tr>
    	
    </table>
    <a href="PageDealCouple">返回缘分页，继续查看自己的缘分~</a>
  	</div>
  	
  	
  	
  	
  	</div>
</body>
</html>