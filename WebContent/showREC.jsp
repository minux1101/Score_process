<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="domain.Student, service.StudentService"%>

<!DOCTYPE html>
<html>  <!--HTML 언어로 작성 시작-->
<head>  <!--머리말 시작-->
   <meta charset="utf-8">  <!--utf-8형식 사용-->
   <title>추가</title>  <!--제목-->
</head><!--머리말 끝-->
<script>
	function checking() {  /*이름과 점수들이 공백이나 null값이면 경고창이 나온다*/
		if (document.getElementById("name").value == "" || document.getElementById("name").value == null ||
			document.getElementById("kor").value == "" || document.getElementById("kor").value == null ||
			document.getElementById("eng").value == "" || document.getElementById("eng").value == null ||
			document.getElementById("mat").value == "" || document.getElementById("mat").value == null) {
			alert("빈 칸을 채워주십시오");
		} else {
		document.form1.action="./updateDB.jsp"; /*이름과 점수들이 공백이나 null값이 아니면 updateDB.jsp로 이동*/
		document.form1.submit();  /*form1의 값을 넘긴다.*/
		}
	}
</script>
<body><!--본문 시작-->
<H1>성적 조회 후 정정/ 삭제</H1>
<br>
<%
	request.setCharacterEncoding("utf-8");  /*request의 인코딩을  utf-8로 저장*/
	int studentId = Integer.parseInt(request.getParameter("studentId"));   /* 조회한 학번을 인자로 받아서 정수형으로 변환해 studentId에 저장*/
	StudentService studentService = new StudentService();  /*StudentService 객체 생성*/
	Student st = studentService.selectOne(studentId); /*StudentService의 selectOne메소드를 호출해서 학번에 해당하는 학생을 조회해서 st에 결과를 저장*/
	if (st != null) {  /*st가 null이 아닐때, 조회할 학번에 해당하는 학생이 있을 때 */
%>
	<form method="post" name="form1"> <!--학번을 조회하는데 숫자만 입력할수 있고, 그 외 문자는 공백으로 바뀐다.-->
	조회할 학번 <input onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="studentId" style=margin-left:30px>
	<input type="button" value="조회" style=margin-left:10px>
	<br><br>
	<table style=text-align:center; border=1px>
		<tr>
			<td width=150px>이름</td>   <!--이름을 입력하는데 한글과 영어만 입력되고, 그 외의 문자는 공백으로 바뀐다. 조회한 학생의 이름이 나옴-->
			<td width=400px><input onkeyup="this.value=this.value.replace(/[^가-힣a-zA-Z]/g,'');" id="name" name="name" value="<%=st.getName()%>"></td>
		</tr>
		<tr>
			<td>학번</td>   <!--학번을 입력하는데 숫자만 입력되고, 그 외의 문자는 공백으로 바뀐다. 조회한 학생의 학번이 나옴, 폼에 입력할 수 없는 읽기 전용 형식-->
			<td><input onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="studentid" name="studentid" value="<%=st.getStudentId()%>" readonly></td>
		</tr>
		<tr>
			<td>국어</td>  <!--국어점수를 입력하는데 숫자만 입력되고, 그 외의 문자는 공백으로 바뀐다. 점수가 100 이상이면 100이 되고, 0 이하면 0이 된다. 조회한 학생의 국어점수 나옴-->
			<td><input onkeyup="this.value=this.value.replace(/[^0-9]/g,''); if(this.value>100){this.value='100';}else if(this.value<0){this.value='0';}" id="kor" name="kor" value="<%=st.getKor()%>"></td>
		</tr>
		<tr>
			<td>영어</td>    <!--영어점수를 입력하는데 숫자만 입력되고, 그 외의 문자는 공백으로 바뀐다. 점수가 100 이상이면 100이 되고, 0 이하면 0이 된다. 조회한 학생의 영어점수 나옴-->
			<td><input onkeyup="this.value=this.value.replace(/[^0-9]/g,''); if(this.value>100){this.value='100';}else if(this.value<0){this.value='0';}" id="eng" name="eng" value="<%=st.getEng()%>"></td>
		</tr>
		<tr>
			<td>수학</td>   <!--수학점수를 입력하는데 숫자만 입력되고, 그 외의 문자는 공백으로 바뀐다. 점수가 100 이상이면 100이 되고, 0 이하면 0이 된다. 조회한 학생의 수학점수 나옴-->
			<td><input onkeyup="this.value=this.value.replace(/[^0-9]/g,''); if(this.value>100){this.value='100';}else if(this.value<0){this.value='0';}" id="mat" name="mat" value="<%=st.getMat()%>"></td>
		</tr>	
	</table>  <!--수정을 누르면, checking()함수를 호출해서 공백과 null 값이 없으면 updateDB.jsp로 이동, 삭제를 누르면 deleteDB.jsp로 이동한다.-->
	<input type="button" value="수정" onclick="checking()" style=margin-left:330px>
	<input type="submit" value="삭제" onclick="javascript: form1.action='./deleteDB.jsp';" style=margin-left:40px>
	</form>
<%
	} else {  /*st가 null일때, 조회할 학번에 해당하는 학생이 없을 때 */
%>
	<form method="post" name="form"> <!--학번을 조회하는데 숫자만 입력할수 있고, 그 외 문자는 공백으로 바뀐다.-->
	조회할 학번 <input onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="studentId" style=margin-left:30px>
	<input type="submit" value="조회" style=margin-left:10px>
	<br>
	<table style=text-align:center; border=1px>
		<tr>
			<td width=150px>이름</td>   <!--해당학번없음이 나옴. 폼에 입력할 수 없는 읽기 전용 형식-->
			<td width=400px><input type="text" name="name" value="해당학번없음" readonly></td>
		</tr>
		<tr>
			<td>학번</td>  <!--공백이 나옴. 폼에 입력할 수 없는 읽기 전용 형식-->
			<td><input type="text" name="studentId" value="" readonly></td>
		</tr>
		<tr>
			<td>국어</td>   <!--공백이 나옴. 폼에 입력할 수 없는 읽기 전용 형식-->
			<td><input type="text" name="kor" value="" readonly></td>
		</tr>
		<tr>
			<td>영어</td>   <!--공백이 나옴. 폼에 입력할 수 없는 읽기 전용 형식-->
			<td><input type="text" name="eng" value="" readonly></td>
		</tr>
		<tr>
			<td>수학</td>   <!--공백이 나옴. 폼에 입력할 수 없는 읽기 전용 형식-->
			<td><input type="text" name="mat" value="" readonly></td>
		</tr>	
	</table>
	</form>
<%
}
%>

</body>
</html>