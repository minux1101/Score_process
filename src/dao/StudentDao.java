package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import domain.Student;

public class StudentDao {
	
	public static Connection connect(){
		Connection con = null;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 로딩, 드라이버들이 읽히기만 하면 자동 객체가 생성되고 DriverManager에 등록된다.		
		con = DriverManager.getConnection("jdbc:mysql://192.168.56.1:3306/koposw19", "root", "root"); // 우분투 서버내의 mysql에 koposw19 데이터베이스를 선택,유저id root, password root로 접속
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return con; //con을 리턴한다.
	}
	 
	public static void connectionClose(Connection con) { //connection 해제 메소드
	      try {
	         if (con != null)
	            con.close();
	      } catch (SQLException e) {
	      }
	   }
	
	// C
	public void create() { // DB에 테이블을 만드는 메소드
		try {
			Connection con = connect(); //connection 메소드를 호출해서 DB와 연결
			Statement stmt = con.createStatement(); // Statement 객체 생성 sql 쿼리를 생성/실행하며, 반환된 결과를 가져오게 할 작업 영역을 제공
			 stmt.execute("create table student("+
	                  "name varchar(20) not null,"+
	                  "studentId int not null primary key,"+
	                  "kor int,"+
	                  "eng int,"+
	                  "mat int) DEFAULT CHARSET=utf8;"); //student 테이블을 만든다. 이름, 학번, 점수들이 필드에 들어감.

			
			stmt.close(); //statement 닫기
			con.close();  //connection 닫기
			} catch(SQLException e) {
				e.printStackTrace();
			}				
	}
	
	public int insert(Student student) { //DB테이블에 데이터를 입력하는 메소드
		int result = 0;
		try {
			Connection con = connect();  //connection 메소드를 호출해서 DB와 연결
			PreparedStatement pstmt = con.prepareStatement("insert into student values (?, ?, ?, ?, ?);"); //Prepared 객체를 생성해서 쿼리문을 실행
			pstmt.setString(1, student.getName());   //첫 번째 ?에 학생 객체에서 이름을 받아와서 입력
			pstmt.setInt(2, student.getStudentId()); //두 번째 ?에 학생 객체에서 학번을 받아와서 입력
			pstmt.setInt(3, student.getKor()); //세 번째 ?에 학생 객체에서 국어점수를 받아와서 입력
			pstmt.setInt(4, student.getEng()); //네 번째 ?에 학생 객체에서 영어점수를 받아와서 입력
			pstmt.setInt(5, student.getMat()); //다섯번째 ?에 학생 객체에서 수학점수를 받아와서 입력
			result = pstmt.executeUpdate(); // 몇 개가 입력되었는지 반영함.
			
			pstmt.close(); // Preparedstatement 닫기
			con.close(); // connection 닫기
			} catch(SQLException e) {
				e.printStackTrace();
			}
		return result;
	}
	
	// R
	public Student selectOne(int studentId) {  //DB테이블에 있는 학생들 중 학번에 해당하는 한 명을 가져오는 메소드
		Student student = null; //학생 객체 생성
		try {
			Connection con = connect();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("select * from student where studentId = " + studentId); //result에 쿼리문을 실행한 결과를 저장.
			
			while(result.next()) { //student에 DB에서 받아온 값을 차례대로 입력한다.
			student = new Student(result.getString(1), studentId, result.getInt(3), result.getInt(4), result.getInt(5));	
			}
			
			result.close(); //result 닫기
			stmt.close(); //statement 닫기
			con.close(); //connection 닫기
			} catch(SQLException e) {
				e.printStackTrace();
			}		
		return student; //만들어진 student 객체 리턴
	}
	
	public List<Student> selectAll() {  //DB테이블에 있는 모든 데이터를 가져오는 메소드
		List<Student> studentList = new ArrayList<Student>();  //Student 타입의 list 생성	
		try {
			Connection con = connect();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM student;");
	
			while (result.next()) { // while문을 실행하면서 studentList에 값을 추가한다.
				Student student = new Student(result.getString(1), result.getInt(2), result.getInt(3), result.getInt(4), result.getInt(5));
				studentList.add(student);
			}			
			result.close(); //result 닫기
			stmt.close(); //statement 닫기
			con.close(); //connection 닫기
		
		}catch(SQLException e) {
			e.printStackTrace();
		}		
		return studentList; // 만들어진 list 리턴, 레퍼런스 타입이라서 주소를 밖에서 받을 수 있다.
	}
	
	// U
	public Student update(Student student) { //DB 테이블에 있는 값을 수정하는 메소드
		int result = 0;
		try {
			Connection con = connect();
			// 해당 학번을 가진 학생의 자료를 수정한다. student 객체에서 값을 가져와서 그 값으로 업데이트 실행
			PreparedStatement pstmt = con.prepareStatement("update student set name = ?, studentId = ?, kor = ?, eng = ?, mat = ? where studentId = ?;");
			pstmt.setString(1, student.getName());
			pstmt.setInt(2, student.getStudentId());
			pstmt.setInt(3, student.getKor());
			pstmt.setInt(4, student.getEng());
			pstmt.setInt(5, student.getMat());
			pstmt.setInt(6, student.getStudentId());
			result = pstmt.executeUpdate(); // 몇 개가 입력되었는지 반영함.
			
			pstmt.close(); // Preparedstatement 닫기
			con.close(); // connection 닫기
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return student; //student 리턴
	}
	
	// D
	public void delete(int studentId) { //해당 학번의 학생을 삭제하는 메소드
		int result = 0;
		try {
			Connection con = connect();
			PreparedStatement pstmt = con.prepareStatement("delete from student where studentId = ?;");
			pstmt.setInt(1,  studentId);
			result = pstmt.executeUpdate();
			
			pstmt.close(); // Preparedstatement 닫기
			con.close(); // connection 닫기
		}catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	public void drop() {  // DB에서 테이블을 삭제하는 메소드
		try {
			Connection con = connect();
			Statement stmt = con.createStatement();
			stmt.execute("drop table student;");
			
			stmt.close(); //statement 닫기
			con.close();  //connection 닫기
			} catch(SQLException e) {
				e.printStackTrace();
			}				
	}
	
	   public void createCount() {  // DB에서 방문자 수를 카운드 하기 위해서 필요한 테이블을 생성하는 메소드
		      try {
		    	  Connection con = connect();
		           Statement stmt = con.createStatement();
		           stmt.execute("CREATE TABLE cnt("+
		        		   		"no int not null primary key) DEFAULT CHARSET=utf8;");

		           stmt.execute("INSERT INTO cnt VALUES (0);"); //카운트 테이블에 값을 0을 입력한다.	
		            
		           stmt.close(); //statement 닫기
		           con.close();  //connection 닫기
		       } catch(Exception e) {
		               e.printStackTrace();
		       }
		   }
		   
	   
		   public int updateCount() { //DB의 count 테이블의 값을 1씩 더해서 값을 리턴하는 메소드
			   int result = 0;
		      try {
		    	  	Connection con = connect();
		    	  	Statement stmt = con.createStatement();
		            stmt.execute("UPDATE cnt SET no = no + 1"); //count 테이블의 no 필드의 값에 1을 더해준다
		            ResultSet rs = stmt.executeQuery("select * from cnt;"); //count 테이블의 값을 불러와서 result에 저장한다.
		            while(rs.next()) {
		    			result = rs.getInt(1);
		    			}	
		            
		            stmt.close(); //statement 닫기
			        con.close();  //connection 닫기
		       } catch(Exception e) {
		               e.printStackTrace();
		       }
		      return result; //result를 리턴
		   }
}
