<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="members.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>멤버 상세보기</title>
</head>
<body>

</body>
<%
	request.setCharacterEncoding("utf-8");
	String mid = request.getParameter("mid");

	MemberDBCP memberDBCP = new MemberDBCP();
	MemberVO member = memberDBCP.getMember(mid);
%>

	<h1>멤버 상세보기</h1>
	<table border=1>
	<tr><td>아이디</td><td><%=member.getMid()%></td></tr>
	<tr><td>이름</td><td><%=member.getMname()%></td></tr>
	<tr><td>비밀번호</td><td><%=member.getPwd()%></td></tr>
	<tr><td>전자메일</td><td><%=member.getEmail()%></td></tr>
	</table>
	<a href='memberlist.jsp'>멤버 리스트</a>
</html>