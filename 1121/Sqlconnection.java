import java.io.*;
import java.sql.*;
// SQL ���� Ŭ������ java.sql .*�� ���ԵǾ� �ִ�.
public class Sqlconnection {
   Connection con;
// Ŭ���� list�� �����Ѵ�. java.sql�� Connection ��ü con�� �����Ѵ�.  	
   public Sqlconnection() {
     String Driver="";
     String 
	 url="jdbc:mysql://localhost:3306/DB��?&serverTimezone=Asia/Seoul"; 
     String userid="root";
     String pwd="tiger";
// ���Ӻ����� �ʱ�ȭ�Ѵ�. url�� �ڹ� ����̹� �̸�, ȣ��Ʈ��(localhost), ��Ʈ��ȣ�� �Է��Ѵ�
// userid�� ������, pwd�� ������� ��й�ȣ�� �Է��Ѵ�.    
     try { /* ����̹��� ã�� ���� */
       Class.forName("com.mysql.cj.jdbc.Driver");   
       System.out.println("����̹� �ε� ����");
     } catch(ClassNotFoundException e) {
         e.printStackTrace();
      }
// Class.forName()���� ����̹��� �ε��Ѵ�. ����̹� �̸��� Class.forName�� �Է��Ѵ�.      
     try { /* �����ͺ��̽��� �����ϴ� ���� */
       System.out.println("�����ͺ��̽� ���� �غ�...");	
       con=DriverManager.getConnection(url, userid, pwd);
       System.out.println("�����ͺ��̽� ���� ����");
     } catch(SQLException e) {
         e.printStackTrace();
       }
   }
// ���� ��ü con�� DriverManager.getConnection �Լ��� �����Ѵ�. 
// ������ �����ϸ� "�����ͺ��̽� ���� ����"�� ����ϵ��� �Ѵ�.  
// ���ڿ� query�� ������ SQL ���� �Է��Ѵ�.
   private void sqlRun() {
  	  String query="SELECT * FROM ���̺��"; /* SQL �� */
  	  try { /* �����ͺ��̽��� ���� ����� �������� ���� */
  	  	 Statement stmt=con.createStatement();
  	  	 ResultSet rs=stmt.executeQuery(query);
  	  	 System.out.println(" ������ ");
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