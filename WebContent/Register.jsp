<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Register.jsp' starting page</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
       <link href="css/style.css" rel="stylesheet" type="text/css" />
       <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
       <script src="js/bootstrap.js" type="text/javascript"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  <body>


   <!---Start-to-nav---->
        <div class="header">
            <nav class="nav1">
                    <a id="A1" class="anchor-link" href="#"></a>
                    <ul class="simple-toggle" id="Ul1">
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
  
 
	<div id="Div1" class="basicdiv">
     <ul  class="nav navbar-nav">
                       <li ><a href="right.jsp" target="_parent">欢迎-首页</a></li>
                      <li class="active"><a href="Upload.jsp" target="_parent">上传个人头像</a></li>
	                  <li><a href="WriteArticle.jsp" target="_parent">发表征婚交友帖</a></li>
		              <li><a href="WatchArticle.jsp" target="_parent">情感天地</a></li>
		              <li><a href="PageDealCouple" target="_parent">搜一搜你的缘分</a></li>
		              <li><a href="FindHimOrHer.jsp" target="_parent">查找指定用户</a></li>
		              <li><a href="PopularityRank.jsp" target="_parent">人气排行榜</a></li>	
	               </ul>
    <img  src="image/welcome/1.jpg" class="img-circle headimag" />
	<form action="PageDealRegister" method="post">
			<table  class="table-center">
				<tr class="tr-input">
					<td>昵称</td>
					<td><input type = "text" name = "logname" />*</td>
				</tr>
				<tr class="tr-input">
					<td>密码</td>
					<td><input type ="password" name ="password" />*</td>
				</tr>
				<tr class="tr-input">
					<td>真实姓名</td>
					<td><input type ="text" name ="realname" />*</td>
				</tr>
				<tr class="tr-input">
					<td>性别</td>
					<td><input type ="text" name ="gender" />*</td>
				</tr>
				<tr class="tr-input">
					<td>年龄</td>
					<td><input type ="text" name ="age" />*</td>
				</tr>
				<tr class="tr-input">
					<td>位置</td>
					<td><input type ="text" name ="location" />*</td>
				</tr>
				<tr class="tr-input">
					<td>手机（电话）</td>
					<td><input type ="text" name = "phone" /></td>
				</tr>
				<tr class="tr-input">
					<td>QQ</td>
					<td><input type ="text" name = "QQ" /></td>
				</tr>
				<tr class="tr-input">
					<td>email</td>
					<td><input type ="text" name= "email" /></td>
				</tr>
				<tr class="tr-input">
					<td>其他联系方式</td>
					<td><input type ="text" name = "othercontactway" /></td>
				</tr>
				<tr class="tr-input">
					<td>简单介绍下自己</td>
					<td><textarea rows="5" cols="20" name="message"></textarea></td>
				</tr>
				
				<tr class="tr-input">
					<td><input type="submit" name="submit" value="提交" /></td>
					<td><input type="reset" name="reset" value="重置" /></td>
					
				</tr>
				<tr class="tr-input">
					<td colspan="2"><a href="Login.jsp">已有账号，直接登录！</a></td>
				</tr>
				
			</table>

		</form>
		</div>
</body>
</html>

