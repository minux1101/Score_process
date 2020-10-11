<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="domain.Student, service.StudentService" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>테이블 값 넣기</title>
</head>
<body>
<h1>성적입력추가완료</h1>
<%
	request.setCharacterEncoding("utf-8"); /*request로 받아온 파라미터의 인코딩을  utf-8형식으로*/
	String name = request.getParameter("name");   /*입력한 이름을 인자로 받아서 name에 저장*/
	int kor = Integer.parseInt(request.getParameter("kor"));  /*입력한 국어 점수를 인자로 받아서 정수형으로 변환해 kor에 저장*/
	int eng = Integer.parseInt(request.getParameter("eng"));  /*입력한 영어 점수를 인자로 받아서 정수형으로 변환해 eng에 저장*/
	int mat = Integer.parseInt(request.getParameter("mat"));  /*입력한 수학 점수를 인자로 받아서 정수형으로 변환해 mat에 저장*/
	Student s = new Student(name, kor, eng, mat);   /*Student 객체 s를 생성해서 입력한 값들을 저장한다, 학번은 자동 부여라 입력 안함.*/
	StudentService studentService = new StudentService();  /*StudentService 객체 생성*/
	studentService.insertone(s);  /*StudentService의 insert메소드를 호출해서 s를 DB에 입력한다.*/
%>
<br>
<form method="post" action="inputForm1.html">
<input type="submit" value="뒤로가기" style=margin-left:500px><br><br> <!--뒤로가기를 누르면 inputForm1.html로 이동한다. -->
<table style=text-align:center; border=1px>
	<tr>
		<td width=150px>이름</td>  <!--입력된 학생의 이름을 불러온다. 입력은 되지 않고 읽기만 가능한 형식-->
		<td width=400px><input type="text" name="name" value="<%=s.getName()%>" readonly></td>
	</tr>
	<tr>
		<td>학번</td>  <!--입력된 학생의 학번을 불러온다. 입력은 되지 않고 읽기만 가능한 형식-->
		<td><input type="text" name="studentId" value="<%=s.getStudentId()%>" readonly></td>
	</tr>
	<tr>
		<td>국어</td>   <!--입력된 학생의 국어점수를 불러온다. 입력은 되지 않고 읽기만 가능한 형식-->
		<td><input type="text" name="kor" value="<%=s.getKor()%>" readonly></td>
	</tr>
	<tr>
		<td>영어</td>   <!--입력된 학생의 영어점수를 불러온다. 입력은 되지 않고 읽기만 가능한 형식-->
		<td><input type="text" name="eng" value="<%=s.getEng()%>" readonly></td>
	</tr>
	<tr>
		<td>수학</td>   <!--입력된 학생의 수학점수를 불러온다. 입력은 되지 않고 읽기만 가능한 형식-->
		<td><input type="text" name="mat" value="<%=s.getMat()%>" readonly></td>
	</tr>	
</table>
</form>
</body>
</html>
