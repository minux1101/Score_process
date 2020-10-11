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
<title>테이블 만들기</title>
</head>
<body>
<h1><center>JSP Database 실습 1</center></h1>
<%
StudentService studentService = new StudentService();  /*StudentService 객체 생성*/
int data = studentService.updateCount();  /*StudentService의 메소드 updateCount()호출 실행, 방문자 카운트가 1씩 늘어난다*/
%>
<br><br>현재 홈페이지 방문조회수는 <%=data%> 입니다.</br>
</body>
</html>