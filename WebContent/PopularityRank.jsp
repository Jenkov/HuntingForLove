<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@ page import="java.util.*" %>
<%@ page import="mybean.Article" %>
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

</div>


<h3>对他/她感兴趣，快快点击他/她的头像吧！</h3>
<hr/>
<hr/>
<%Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=loveontheway"; 

String user="sa"; 
String password="sa2014"; 

Connection conn= DriverManager.getConnection(url,user,password); 
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE); 
String sql="select logname,pic from userinfo order by vote desc,id asc"; 
ResultSet rs=stmt.executeQuery(sql); 
int i=0;%> 
<table>
<% 
while(rs.next()&&i++<10) {
%>
	
	<tr>
		<td>第<%=i %>名：</td>
		<td>
			<a href="PageDealFindHimOrHer?name=<%=rs.getString("logname")%>"><%=rs.getString("logname")%> </a>
		</td>
		<td>
			<a href="PageDealFindHimOrHer?name=<%=rs.getString("logname")%>"><img src="image/<%=rs.getString("pic")%>" width="50" height="50" /></a>
		</td>
	</tr>		
	
<%}%>
</table>
<%
out.print("****************人气排行榜前十名********************");
%> 
<%
rs.close(); 
stmt.close(); 
conn.close(); 
%> 



</body> 
</html> 