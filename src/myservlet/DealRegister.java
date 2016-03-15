package myservlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.Register;

public class DealRegister extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1518575704875371348L;

	public void init(ServletConfig config) throws ServletException{
	      super.init(config);
	      try {  
	            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	      }
	      catch(Exception e){} 
	   }
	
	public String encodeString(String str){
	      try{ 
	            str=new String(str.getBytes("iso-8859-1"),"UTF-8");
	      }
	      catch(Exception ee){} 
	      return str;  
	   }
	/**
	 * Constructor of the object.
	 */
	public DealRegister() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Register  registerbean = new Register();
		request.setAttribute("register",registerbean);
		
		
		
		
		String logname = request.getParameter("logname").trim();
		String password = request.getParameter("password").trim();
		String realname = request.getParameter("realname").trim();
		String gender = request.getParameter("gender").trim();
		String age = request.getParameter("age").trim();
		String location = request.getParameter("location").trim();
		String phone = request.getParameter("phone").trim();
		String QQ = request.getParameter("QQ").trim();
		String email = request.getParameter("email").trim();
		String othercontactway = request.getParameter("othercontactway").trim();
		String message = request.getParameter("message");
		String pic = "public.jpg";
		String feedback ="";
		Connection conn = null;
		Statement stmt =null;
		String url="";
		String sql;
		try {
			
			logname=encodeString(logname);
			password=encodeString(password);
			realname=encodeString(realname);
			gender=encodeString(gender);
			age=encodeString(age);
			location=encodeString(location);
			phone=encodeString(phone);
			QQ=encodeString(QQ);
			email=encodeString(email);
			othercontactway=encodeString(othercontactway);
			pic=encodeString(pic);
			message=encodeString(message);
			feedback=encodeString(feedback);
			
			
			url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=loveontheway";
			
			conn = DriverManager.getConnection(url,"sa","sa2014");
			stmt = conn.createStatement();
			sql ="insert into userinfo(logname,password,realname,gender,age,location,phone,QQ,email,othercontactway,message,pic) values('"+logname+"','"+password+"','"+realname+"','"+gender+"','"+age+"','"+location+"','"+phone+"','"+QQ+"','"+email+"','"+othercontactway+"','"+message+"','"+pic+"')";
			int count = stmt.executeUpdate(sql);
			
			if(count!=0){
				feedback ="注册成功，以下是您的注册信息：<br/>...10秒后自动跳转到首页<br/>";
				registerbean.setFeedback(feedback);
				registerbean.setLogname(logname);
				registerbean.setPassword(password);
				registerbean.setRealname(realname);
				registerbean.setGender(gender);
				registerbean.setAge(age);
				registerbean.setLocation(location);
				registerbean.setPhone(phone);
				registerbean.setQQ(QQ);
				registerbean.setEmail(email);
				registerbean.setOthercontactway(othercontactway);
				registerbean.setMessage(message);
				registerbean.setPic(pic);
			}
			conn.close();
			stmt.close();
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("RegisterRes.jsp");
			dispatcher.forward(request,response);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	
	

}
