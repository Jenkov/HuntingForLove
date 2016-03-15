package myservlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.Login;

public class DealLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 101953697069167113L;


	public void init(ServletConfig config ) throws ServletException {
		super.init(config);
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		}catch(Exception e){}
	}

	public String encodeString(String str){
	      try{ 
	            str=new String(str.getBytes("iso-8859-1"),"UTF-8");
	      }
	      catch(Exception ee){} 
	      return str;  
	   }
	public DealLogin() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Login loginbean =null;
		Connection conn = null;
		Statement stmt =null;
		String url="";
		String sql;
		
		
		HttpSession session =request.getSession(true);
		try{
			loginbean= (Login) session.getAttribute("login");
			if(loginbean==null){
				loginbean = new Login();
				session.setAttribute("login", loginbean);
			}
		}catch(Exception e){
			loginbean = new Login();
			session.setAttribute("login", loginbean);
		}
		
		String logname = request.getParameter("logname").trim();
		String password = request.getParameter("password").trim();
		Boolean status = loginbean.getStatus();
		String feedback="";
		
		if(status==true&&logname.equals(loginbean.getLogname())){
			feedback = logname+"has been logged";
			loginbean.setFeedback(feedback);
			
		}else{
			
			try {
				
				logname=encodeString(logname);
				password=encodeString(password);
				feedback= encodeString(feedback);
				
				
				url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=loveontheway";
				conn = DriverManager.getConnection(url,"sa","sa2014");
				stmt = conn.createStatement();
				sql = "select * from userinfo where logname = '"+logname+
                        "' and password ='"+password+"'";
				
				ResultSet res = stmt.executeQuery(sql);
				if(res.next()){
					feedback= logname+"	已成功登录！...3秒钟后自动跳转到首页";
					loginbean.setFeedback(feedback);
					loginbean.setLogname(logname);
					loginbean.setPassword(password);
					loginbean.setStatus(true);
				}
				
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				
				feedback =e.toString();
				loginbean.setFeedback(feedback);
				loginbean.setStatus(false);
			}
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("LoginRes.jsp");
		dispatcher.forward(request, response);
	}
	
}
