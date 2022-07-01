<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="members.*"
    import="java.util.List"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>멤버 로그아웃</title>
</head>
<body>

</body>
<%
	request.setCharacterEncoding("utf-8");

	if(session != null) {
		boolean isSession = request.isRequestedSessionIdValid();
		if(isSession) {
			session.invalidate();
		}
	}

	response.sendRedirect("memberlogin.html");
%>
</html>