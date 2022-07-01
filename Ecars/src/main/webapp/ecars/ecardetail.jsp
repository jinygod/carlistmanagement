<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ecars.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>차량 정보 상세보기</title>
</head>
<body>

</body>
<%
request.setCharacterEncoding("utf-8");
	String serial = request.getParameter("serial");

	ECarsDAO ecarDAO = new ECarsDAO();
	ECarsVO ecar = ecarDAO.getcar(serial);
%>

	<h1>차량 정보 상세보기</h1>
	<table border=1>
	<tr><td>번호</td><td><%=ecar.getSerial()%></td></tr>
	<tr><td>차종</td><td><%=ecar.getVar()%></td></tr>
	<tr><td>색상</td><td><%=ecar.getColor()%></td></tr>
	<tr><td>가격</td><td><%=ecar.getPrice()%></td></tr>
	<tr><td>수량</td><td><%=ecar.getQty()%></td></tr>
	</table>
	<a href='ecarlist.jsp'>차량 리스트</a>
</html>