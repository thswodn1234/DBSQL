import java.io.*;
import java.sql.*;
// SQL 관련 클래스는 java.sql .*에 포함되어 있다.
public class Sqlconnection {
   Connection con;
// 클래스 list를 선언한다. java.sql의 Connection 객체 con을 선언한다.  	
   public Sqlconnection() {
     String Driver="";
     String 
	 url="jdbc:mysql://localhost:3306/DB명?&serverTimezone=Asia/Seoul"; 
     String userid="root";
     String pwd="tiger";
// 접속변수를 초기화한다. url은 자바 드라이버 이름, 호스트명(localhost), 포트번호를 입력한다
// userid는 관리자, pwd는 사용자의 비밀번호를 입력한다.    
     try { /* 드라이버를 찾는 과정 */
       Class.forName("com.mysql.cj.jdbc.Driver");   
       System.out.println("드라이버 로드 성공");
     } catch(ClassNotFoundException e) {
         e.printStackTrace();
      }
// Class.forName()으로 드라이버를 로딩한다. 드라이버 이름을 Class.forName에 입력한다.      
     try { /* 데이터베이스를 연결하는 과정 */
       System.out.println("데이터베이스 연결 준비...");	
       con=DriverManager.getConnection(url, userid, pwd);
       System.out.println("데이터베이스 연결 성공");
     } catch(SQLException e) {
         e.printStackTrace();
       }
   }
// 접속 객체 con을 DriverManager.getConnection 함수로 생성한다. 
// 접속이 성공하면 "데이터베이스 연결 성공"을 출력하도록 한다.  
// 문자열 query에 수행할 SQL 문을 입력한다.
   private void sqlRun() {
  	  String query="SELECT * FROM 테이블명"; /* SQL 문 */
  	  try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
  	  	 Statement stmt=con.createStatement();
  	  	 ResultSet rs=stmt.executeQuery(query);
  	  	 System.out.println(" 제목줄 ");
  	  	 while(rs.next()) {
  	  	 	System.out.print("\t"+rs.getInt(1));
  	  	 	System.out.print("\t"+rs.getString(2));
  	  	 	System.out.print("\t\t"+rs.getString(3));
  	  	 	System.out.println("\t"+rs.getInt(4));
  	  	 }
  	  	 
  	  	 con.close();
  	  } catch(SQLException e) {
  	  	   e.printStackTrace();
  	    }
   }
  	  
  	public static void main(String args[]) {
  	   Sqlconnection sc=new Sqlconnection();
  	   sc.sqlRun();
  	}
}