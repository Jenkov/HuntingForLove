package myservlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.Login;
import mybean.UserInfo;


@WebServlet("/DealCouple")
public class DealCouple extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5097354159743484451L;


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
    public DealCouple() {
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
	         randomCouple(request,response,logname);   
	      } 
	}

	
	public void randomCouple(HttpServletRequest request, HttpServletResponse response, String logname) {
		UserInfo userinfo = new UserInfo();
		request.setAttribute("userinfo", userinfo);
		
		Random rand = new Random();
		String url="";
		Connection conn;
		Statement stmt;
		String sql1 ="";
		String sql2 ="";
		//String sql3="";
		//String g="";
		try{
			//g=request.getParameter("gender");
			//g=encodeString(g);
			//sql3=" and gender='"+g+"'";
			url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=loveontheway";
			
			conn = DriverManager.getConnection(url,"sa","sa2014");
			stmt = conn.createStatement();
			
			sql1 ="select max(id) as maxid from userinfo";
			ResultSet rs1 = stmt.executeQuery(sql1);
			int maxid =1;
			while(rs1.next()){
				maxid = rs1.getInt("maxid");
			}
			int randnum = rand.nextInt(maxid)+1;
			sql2 ="select logname,pic from userinfo where id="+randnum+" and logname!='"+logname+"'"/*+sql3*/;
			ResultSet rs2 = stmt.executeQuery(sql2);
			/*String lgstr=rs2.getString("logname");
			while(rs2==null||logname.equals(lgstr)){
				randnum = rand.nextInt(maxid)+1;
				sql2 ="select logname,pic from userinfo where id="+randnum;
				rs2 = stmt.executeQuery(sql2);
			}*/
			/*while(!rs2.next()){
				randnum = rand.nextInt(maxid)+1;
				sql2 ="select logname,pic from userinfo where id="+randnum+"and logname!='"+logname+"'";
				rs2 = stmt.executeQuery(sql2);
			}*/
			/*do{
				randnum = rand.nextInt(maxid)+1;
				sql2 ="select logname,pic from userinfo where id="+randnum+"and logname!='"+logname+"'";
				rs2 = stmt.executeQuery(sql2);
			}while(!rs2.next());*/
			String lgname="";
			String picture="";
		
			/*if(rs2.next()){
				lgname = "这个人被外星人掳走了";
				picture = "nopicture.jpg";
			}
			rs2.previous();*/
			while(rs2.next()){
				if(rs2.getString("logname")!=null&&!(rs2.getString("logname").equals(""))){
					lgname = rs2.getString("logname");
				}
				else{
					
					lgname = "这个人被外星人掳走了";
				}
				if(rs2.getString("pic")!=null&&!(rs2.getString("pic").equals(""))){
					picture = rs2.getString("pic");
				}
				else{
					picture = "nopicture.jpg";
				}
				
				userinfo.setLogname(lgname);
				userinfo.setPic(picture);
			}
			
			rs2.close();
			rs1.close();
			stmt.close();
			conn.close();
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Couple.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e){}
		
		
	}

}
