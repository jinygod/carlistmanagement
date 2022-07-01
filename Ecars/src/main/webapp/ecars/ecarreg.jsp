<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ecars.*"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 리스트</title>
</head>
<body>
	<h1>차량 등록</h1>
	<a href="ecarlist.jsp">차량목록으로</a>
	<hr>
	<form name="ecarreg" method="post" action="ecarlist.jsp">
		<table>
			<tr>
				<td>차종</td>
				<td><input type="text" name="var"></td>
			</tr>
			
			<tr>
				<td>색상</td>
				<td><input type="text" name="color"></td>
			</tr>
			
			<tr>
				<td>가격</td>
				<td><input type="text" name="price"></td>
			</tr>
			
			<tr>
				<td>수량</td>
				<td><input type="text" name="qty"></td>
			</tr>
		</table>
		<input type="submit" value="차량등록">
		<input type="reset" value="다시입력">
		<input type="hidden" name="command" value="addcar"/>
	</form>
</body>
</html>