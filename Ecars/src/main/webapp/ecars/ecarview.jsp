<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.List,ecars.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>차량정보 상세보기</title>
</head>
<body>

</body>
<%
request.setCharacterEncoding("utf-8");
	List<ECarsVO> ecars = (List<ECarsVO>)request.getAttribute("ecars");
%>

	<h1>차량 리스트</h1>
	
	<table border=1>
		<tr align='center' bgcolor='lightgreen'>
		<td>번호</td>
		<td>차종</td>
		<td>색상</td>
		<td>가격</td>
		<td>수량</td>
		<td>삭제</td>
		<td>수정</td>
		</tr>

<%
for(int cnt=0; cnt < ecars.size(); cnt++) {
	ECarsVO ecar = (ECarsVO)ecars.get(cnt);
%>			
		<tr>
		<td><a href='ecardetail.jsp?serial=<%=ecar.getSerial()%>'><%=ecar.getSerial()%></a></td>
		<td><%=ecar.getVar()%></td>
		<td><%=ecar.getColor()%></td>
		<td><%=ecar.getPrice()%></td>
		<td><%=ecar.getQty()%></td>
		<td><a href='ecarlist.jsp?command=delcar&serial=<%=ecar.getSerial()%>'>삭제</a></td>
		<td><a href='ecaredit.jsp?serial=<%=ecar.getSerial()%>'>수정</a></td>
		</tr>
<%			
		}
%>
		
	</table>
	<a href='ecarreg.jsp'>차량등록</a>
</html>