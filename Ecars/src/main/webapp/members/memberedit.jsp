<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="members.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>멤버 수정</title>
</head>
<body>

</body>
<%
request.setCharacterEncoding("utf-8");

	String mid = request.getParameter("mid");

	MemberDBCP memberDBCP = new MemberDBCP();
	MemberVO member = memberDBCP.getMember(mid);
%>

	<h1>멤버 수정</h1>
	<hr>
	
	<form name='memberedit' method='post' action='memberlist.jsp'>
		<table>
			<tr><td>아이디</td><td><input type='text' name='mid' value='<%=member.getMid()%>' readonly></td></tr>
			<tr><td>이름</td><td><input type='text' name='mname' value='<%=member.getMname()%>'></td></tr>
			<tr><td>비밀번호</td><td><input type='text' name='pwd' value='<%=member.getPwd()%>'></td></tr>
			<tr><td>전자메일</td><td><input type='text' name='email' value='<%=member.getEmail()%>'></td></tr>
			<tr>
			<td><input type='submit' value='멤버수정'></td>
			<td><input type='reset' value='다시입력'></td>
			</tr>
		</table>
	<input type='hidden' name='command' value='editMember'/>
</form>


</html>