<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="domain.Student, service.StudentService, java.util.ArrayList, java.util.List" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>레코드 삭제</title>
</head>
<body>
<h1>레코드 삭제</h1>
<%
	request.setCharacterEncoding("utf-8"); /*request의 인코딩을  utf-8로 저장*/
	int studentId = Integer.parseInt(request.getParameter("studentid")); /*studentid(조회한 학번)을 인자로 받아서 정수형으로 변환해 studentId에 저장*/
	StudentService studentService = new StudentService(); /*StudentService 객체 생성*/
	studentService.delete(studentId); /*StudentService의 delete메소드를 호출해서 studentId에 해당하는 자료를 지운다.*/
	List<Student> studentlists = new ArrayList();  /*리스트 Studentlists 생성*/
	studentlists = studentService.selectAll();  /*StudentService의 메소드 selectAll()을 호출 결과를 studentlists에 저장*/
%>
<br>
<table border=1px>  <!-- 테이블 생성 -->
	<tr>   <!-- 1행 5열 생성 -->
		<td style=text-align:center; width=100px>이름</td>
		<td style=text-align:center; width=150px>학번</td>
		<td style=text-align:center; width=100px>국어</td>
		<td style=text-align:center; width=100px>영어</td>
		<td style=text-align:center; width=100px>수학</td>
	</tr>
<%
	for (Student studentlist : studentlists) {   /*studentlist가 studentlists까지 for문 수행*/
%>
	<tr>  <!--행 생성, for-each문을 수행하면서 테이블에 결과 값을 넣는다. -->
									 <!--학생의 이름에 링크를 연결해서 이름을 클릭하면 한 명만 조회되게 한다.  -->
		<td style=text-align:center;><a href="./oneviewDB.jsp?id=<%=studentlist.getStudentId()%>"><%=studentlist.getName()%></td>
		<td style=text-align:center;><%=studentlist.getStudentId()%></td>  <!--학생의 학번 -->
		<td style=text-align:center;><%=studentlist.getKor()%></td>   <!--학생의 국어 점수 -->
		<td style=text-align:center;><%=studentlist.getEng()%></td>   <!--학생의 영어 점수 -->
		<td style=text-align:center;><%=studentlist.getMat()%></td>   <!--학생의 수학 점수 -->
<%
}
%>
</table>
</body>
</html>