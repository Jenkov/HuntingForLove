<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
     
    
    
<script language='javascript' type='text/javascript'>    
   var secs =15; //倒计时的秒数    
   var URL ;    
   function Load(url){    
       URL =url;    
       for(var i=secs;i>=0;i--){    
             window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000);    
       }   
   }   
   function doUpdate(num){    
            document.getElementById('ShowDiv').innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+'将在'+num+'秒后自动跳转'
            +'<a href ="WatchArticle.jsp">立即跳转</a>';    
            if(num == 0) { 
            	window.location=URL; 
            }   
   }    
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

</div>
	<h3>成功发表！快去查看吧</h3><br/>
	<div id="ShowDiv">
	</div>    
	<script language="javascript">   
		 Load("WatchArticle.jsp"); //要跳转到的页面    
	</script>   

	
	
	
	
	
</body>
</html>