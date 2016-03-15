package myservlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.Login;
import mybean.UserInfo;


public class DealFindHimOrHer extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1625312381613461919L;


	public void init(ServletConfig config) throws ServletException{
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
    public DealFindHimOrHer() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
	      Login login=(Login)session.getAttribute("login"); 
	      boolean status=true; 
	      if(login==null){
	         status=false; 
	         response.sendRedirect("Login.jsp"); 
	      }
	      if(status==true){
	         String logname=login.getLogname();
	         findHimOrHer(request,response,logname);   
	      } 
		
	}


	public void findHimOrHer(HttpServletRequest request, HttpServletResponse response, String logname) {
		UserInfo userinfo = new UserInfo();
		request.setAttribute("userinfo", userinfo);
		String name=request.getParameter("name");
		String url;
		Connection conn;
		Statement stmt1,stmt2;
		String sql1 ="";
		String sql2 ="";
		try{
			name = encodeString(name);
			url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=loveontheway";
			
			conn = DriverManager.getConnection(url,"sa","sa2014");
			stmt1 = conn.createStatement();
			
			sql1 ="select * from userinfo where logname ='"+name+"'";
			ResultSet rs = stmt1.executeQuery(sql1);
			while(rs.next()){
				userinfo.setLogname(rs.getString("logname"));
				userinfo.setRealname(rs.getString("realname"));
				userinfo.setGender(rs.getString("gender"));
				userinfo.setAge(rs.getString("age"));
				userinfo.setLocation(rs.getString("location"));
				userinfo.setPhone(rs.getString("phone"));
				userinfo.setQQ(rs.getString("QQ"));
				userinfo.setEmail(rs.getString("email"));
				userinfo.setOthercontactway(rs.getString("othercontactway"));
				userinfo.setMessage(rs.getString("message"));
				userinfo.setPic(rs.getString("pic"));
			}
			stmt1.close();
			stmt2=conn.createStatement();
			sql2 = "update userinfo set vote = vote+1 where logname='"+name+"'";
			stmt2.executeUpdate(sql2);
			stmt2.close();
			conn.close();
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("HeOrShe.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e){}
		
		
	}

}
