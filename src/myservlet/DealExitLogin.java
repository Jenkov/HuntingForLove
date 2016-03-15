package myservlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.Login;


public class DealExitLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3135883664674724159L;

	public void init(ServletConfig config) throws ServletException{
	      super.init(config);
	      try{  
	           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	      }catch(Exception e){}
	}   
    
    public DealExitLogin() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Login login =  (Login) session.getAttribute("login");
		
		 boolean status=true; 
	      if(login==null){
	         status=false; 
	         response.sendRedirect("Login.jsp"); 
	      }
	      if(status==true){
	         String logname=login.getLogname();
	         exitLogin(request,response,logname);   
	      } 
	}

	public void exitLogin(HttpServletRequest request, HttpServletResponse response, String logname) throws IOException {
		HttpSession session = request.getSession(true);
		session.invalidate();//销毁当前会话
		response.sendRedirect("right.jsp");
		
	}

}
