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
<title>테이블 지우기</title>
</head>
<body>
<h1>테이블 지우기 OK</h1>
<%
StudentService studentService = new StudentService();   /*StudentService 객체 생성*/
studentService.drop();  /*StudentService의 메소드drop()호출 실행, 테이블이 삭제된다.*/
%>

</body>
</html>