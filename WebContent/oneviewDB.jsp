<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="domain.Student, service.StudentService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>하나 조회</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");  /*request의 인코딩을  utf-8로 저장*/
StudentService studentService = new StudentService();  /*StudentService 객체 생성*/
int id = Integer.parseInt(request.getParameter("id"));  /*id를 parameter로 받아와서 정수형으로 변환*/
/*StudentService의 selectOne메소드를 호출해서 id를 인자로받아서 실행하고 결과를 student에 해당하는 자료를 저장한다.*/
Student student = studentService.selectOne(id);  
out.println("<h1>[" + student.getName() +"] 조회</h1>");
%>
<table border=1px>  <!-- 테이블 생성 -->
	<tr>   <!-- 1행 5열 생성 -->
		<td style=text-align:center; width=100px>이름</td>
		<td style=text-align:center; width=150px>학번</td>
		<td style=text-align:center; width=100px>국어</td>
		<td style=text-align:center; width=100px>영어</td>
		<td style=text-align:center; width=100px>수학</td>
	</tr>
	<tr> 
		<td style=text-align:center;><%=student.getName()%></td>  <!--조회된 학생의 이름 출력 -->
		<td style=text-align:center;><%=student.getStudentId()%></td> <!--조회된 학생의 학번 출력-->
		<td style=text-align:center;><%=student.getKor()%></td>  <!--조회된 학생의 국어 점수 출력-->
		<td style=text-align:center;><%=student.getEng()%></td>   <!--조회된 학생의 영어 점수 출력-->
		<td style=text-align:center;><%=student.getMat()%></td>  <!--조회된 학생의 수학 점수 출력-->

</table>
</body>
</html>