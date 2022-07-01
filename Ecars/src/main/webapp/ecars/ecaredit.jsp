<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ecars.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>차량 정보 수정</title>
</head>
<body>

</body>
<%
request.setCharacterEncoding("utf-8");

	String serial = request.getParameter("serial");

	ECarsDAO ecarDAO = new ECarsDAO();
	ECarsVO ecar = ecarDAO.getcar(serial);
%>

	<h1>차량 정보 수정</h1>
	<a href="ecarlist.jsp">차량목록으로</a>
	<hr>
	<form name='memberedit' method='post' action='ecarlist.jsp'>
		<table>
			<tr><td>번호</td><td><input type='text' name='serial' value='<%=ecar.getSerial()%>' readonly></td></tr>
			<tr><td>차종</td><td><input type='text' name='var' value='<%=ecar.getVar()%>'></td></tr>
			<tr><td>색상</td><td><input type='text' name='color' value='<%=ecar.getColor()%>'></td></tr>
			<tr><td>가격</td><td><input type='text' name='price' value='<%=ecar.getPrice()%>'></td></tr>
			<tr><td>수량</td><td><input type='text' name='qty' value='<%=ecar.getQty()%>'></td></tr>
			<tr>
			<td><input type='submit' value='차량정보수정'></td>
			<td><input type='reset' value='다시입력'></td>
			</tr>
		</table>
	<input type='hidden' name='command' value='editcar'/>
</form>


</html>