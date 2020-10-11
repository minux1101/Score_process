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
<h1>실습 데이터 입력</h1>
<%
StudentService studentService = new StudentService(); /*StudentService 객체 생성*/
studentService.insertAllset();  /*insertAllset() 메소드를 호출 실행, for문을 수행하면서 DB에 자료를 넣는다.*/
%>

</body>
</html>