<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="calcException.jsp" %>
    
<%
	String nums = (String)request.getParameter("num");
	int num = Integer.parseInt(nums);
	int tot = 0;
	for(int i = 1; i <= num; i++) {
		tot += i;
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계산기</title>
</head>
<body>
	<h1>합계 구하기</h1>
	<h2>1부터 <%=num%>까지의 합은 <%=tot%>입니다</h2>
</body>
</html>