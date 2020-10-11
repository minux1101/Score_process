<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.net.*" %>
<!DOCTYPE html>
<html>  <!--HTML 언어로 작성 시작-->
<head>  <!--머리말 시작-->
   <meta charset="utf-8">  
</head>  <!--머리말 끝-->
<body>  <!--본문 시작-->
<h1><center>JSP Database 실습 1</center></h1>

<%
	String data;
	int cnt=0;
	/*파일을 읽는 객체 f1을 만들고, 파일의 경로를 지정해준다.*/
	FileReader f1 = new FileReader("C:\\Users\\KEUM\\Desktop\\cnt.txt");
	StringBuffer sb = new StringBuffer(); /*스트링버퍼 객체 sb 생성*/
	int ch = 0; 
	while((ch = f1.read()) != -1) { /*파일을 읽어서 ch에 저장하고 파일에 글이 있을 때*/
		sb.append((char)ch); /*sb에 ch를 더해준다.*/
	}
	data = sb.toString().trim().replace("\n", ""); /*sb에 공백을 제거하고 개행문자를 없앤 후 data에 저장*/
	f1.close(); /*f1을 닫는다.*/
	
	cnt= Integer.parseInt(data); /*data를 정수로 바꿔서 cnt에 저장*/
	cnt++; /*cnt를 ++ 해준다*/
	data = Integer.toString(cnt); /*cnt를 문자열로 변환해서 data에 저장*/
	out.println("<br><br>현재 홈페이지 방문조회수는 ["+data+"] 입니다.</br>"); /*방문자 수 출력*/
	
	/*filewriter를 생성하고 data를 cnt.txt에 쓴다.*/
	FileWriter f12 = new FileWriter("C:\\Users\\KEUM\\Desktop\\cnt.txt", false);
	f12.write(data);
	f12.close();
%>
</body><!--본문 끝-->
</html><!--HTML 언어로 작성 끝-->