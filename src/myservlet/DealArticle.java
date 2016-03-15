package myservlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.Login;


@WebServlet("/DealArticle")
public class DealArticle extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 815033578264864664L;


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

    public DealArticle() {
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
	         saveArticle(request,response,logname);   
	      } 
	}


	public void saveArticle(HttpServletRequest request, HttpServletResponse response, String logname) throws ServletException, IOException {
		
		String title = request.getParameter("title").trim();
		String author=logname;
		String pic="" ;
		String contents = request.getParameter("contents");
		String feedback ="";
		String url;
		Connection conn;
		Statement stmt;
		String sql1 ="";
		String sql2="";
		try{
			
			title=encodeString(title);
			author = encodeString(author);
			pic = encodeString(pic);
			contents = encodeString(contents);
			feedback =encodeString(feedback);
			url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=loveontheway";
			
			conn = DriverManager.getConnection(url,"sa","sa2014");
			stmt = conn.createStatement();
			
			sql1 ="select pic from userinfo where logname ='"+author+"'";
			ResultSet rs = stmt.executeQuery(sql1);
			while(rs.next()){
				pic = rs.getString("pic");
			}
			
			sql2 ="insert into article values('"+title+"','"+author+"','"+pic+"','"+contents+"')";
			int t =stmt.executeUpdate(sql2);
			if(t!=0){
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("ArticleRes.jsp");
				dispatcher.forward(request, response);
			}
		}catch(Exception e){}
		
		
	}

}
