<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="members.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>멤버 로그인</title>
</head>
<body>

</body>
<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	MemberDBCP memberDBCP = new MemberDBCP();
	boolean membered = memberDBCP.isMember(userid, userpw);
	if(membered) {
		session.setAttribute("userid", userid);
	}
%>

	<h1>멤버 로그인</h1>

<%	
	if(membered) {
%>		
		<h3>로그인 성공</h3>
		<hr>
		<p><%=userid%>님 환영합니다.</p>
		<a href='memberlist.jsp'>멤버리스트</a>
<%		
	} else {
%>		
		<p><%=userid%>는 존재하지 않는 멤버입니다.</p>
		<a href='memberlogin.html'>다시 로그인 하세요</a>
<%		
	}
%>
</html>