package myservlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
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
import mybean.UploadFile;


public class DealUpload extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8359745781335411189L;



	public void init(ServletConfig config) throws ServletException{
	      super.init(config);
	      try{  
	           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	      }catch(Exception e){}
	}
	      
       

    public DealUpload() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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
	         uploadFileMethod(request,response,logname);   
	      } 
		
	}



	public void uploadFileMethod(HttpServletRequest request, HttpServletResponse response, String logname)throws ServletException,IOException {
		UploadFile uploadfile=new UploadFile(); 
	      String feedback="";
	      try{
	           HttpSession session=request.getSession(true);
	           request.setAttribute("uploadfile",uploadfile);
	           String tempFileName=(String)session.getId();
	           File f1=new File(tempFileName);
	           FileOutputStream o=new FileOutputStream(f1);
	           InputStream in=request.getInputStream();
	           byte b[]=new byte[1024];
	           int n;
	           while( (n=in.read(b))!=-1)  
	              o.write(b,0,n);  
	           o.close();
	           in.close();
	           RandomAccessFile random=new RandomAccessFile(f1,"r");
	           int second=1;   
	           String secondLine=null;
	           while(second<=2){  
	              secondLine=random.readLine();
	              second++;
	           }
	           int position=secondLine.lastIndexOf('\\');
	           if(position==-1){
	                response.sendRedirect("Upload.jsp"); 
	           }
	           String fileName=secondLine.substring(position+1,secondLine.length()-1);
	           byte  cc[]=fileName.getBytes("ISO-8859-1");
	           fileName=new String(cc);
	           fileName=fileName.replaceAll(" ","");
	           String checkedStr=fileName.substring(0,fileName.indexOf("."));
	           boolean isLetterOrDigit=true; 
	           for(int i=0;i<checkedStr.length();i++){
	             char c=checkedStr.charAt(i);
	             if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0'))){ 
	                isLetterOrDigit=false;
	                break;
	             } 
	           } 
	           if(isLetterOrDigit==false){
	                response.sendRedirect("Upload.jsp"); 
	           }
	           String savedFileName=logname.concat(fileName); 
	           random.seek(0); 
	           long forthEndPosition=0;  
	           int forth=1;
	           while((n=random.readByte())!=-1&&(forth<=4)){  
	               if(n=='\n'){
	                 forthEndPosition=random.getFilePointer();
	                 forth++;
	               }
	           }
	           File dir=new File("D:/eclipse/eclipse-jee-mars-1-win32/workspace/ThinkingInJava/HuntingForLove/WebContent/image");
	           dir.mkdir();
	           File file[]=dir.listFiles();
	           for(int k=0;k<file.length;k++){
	              if(file[k].getName().startsWith(logname))
	                 file[k].delete();
	           }
	           File savingFile= new File(dir,savedFileName);  
	           RandomAccessFile random2=new RandomAccessFile(savingFile,"rw"); 
	           random.seek(random.length());
	           long endPosition=random.getFilePointer();
	           long mark=endPosition;
	           int j=1;
	           while((mark>=0)&&(j<=6)){
	               mark--;
	               random.seek(mark);
	               n=random.readByte();
	               if(n=='\n'){
	                  endPosition=random.getFilePointer();
	                  j++;
	               }
	           }
	           random.seek(forthEndPosition);
	           long startPoint=random.getFilePointer();
	           while(startPoint<endPosition-1){
	               n=random.readByte();
	               random2.write(n); 
	               startPoint=random.getFilePointer();
	           }
	           random2.close();
	           random.close();
	           String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=loveontheway";
	           Connection con=DriverManager.getConnection(url,"sa","sa2014");
	           Statement sql=con.createStatement();
	           ResultSet rs=
	           sql.executeQuery("SELECT * FROM userinfo where logname='"+logname+"'"); 
	           if(rs.next()){
	             if(isLetterOrDigit){
	               int mm=sql.executeUpdate("UPDATE userinfo SET pic= '"+savedFileName+
	                                         "' where logname = '"+logname+"'");
	               if(mm!=0){
	                 feedback=fileName+"upload successfully";
	                 uploadfile.setFileName(fileName);
	                 uploadfile.setSavedFileName(savedFileName);
	                 uploadfile.setFeedback(feedback);
	               }
	             }
	           }
	           con.close(); 
	           f1.delete(); 
	      }
	      catch(Exception exp){
	           feedback=""+exp;
	           uploadfile.setFeedback(feedback);
	      }
	      RequestDispatcher dispatcher=
	      request.getRequestDispatcher("UploadRes.jsp");
	      dispatcher.forward(request, response);
		
	}
	
	

}
