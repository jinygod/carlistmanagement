<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.List, members.*"
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
	List<MemberVO> members = (List<MemberVO>)request.getAttribute("members");
%>

	<h1>멤버 리스트</h1>
	
	<table border=1>
		<tr align='center' bgcolor='lightgreen'>
		<td>아이디</td>
		<td>이름</td>
		<td>비밀번호</td>
		<td>이메일</td>
		<td>등록일자</td>
		<td>삭제</td>
		<td>수정</td>
		</tr>

<%		
		for(int cnt=0; cnt < members.size(); cnt++) {
			MemberVO member = (MemberVO)members.get(cnt);
%>			
		<tr>
		<td><a href='memberdetail.jsp?mid=<%=member.getMid()%>'><%=member.getMid()%></a></td>
		<td><%=member.getMname()%></td>
		<td><%=member.getPwd()%></td>
		<td><%=member.getEmail()%></td>
		<td><%=member.getRegdate()%></td>
		<td><a href='memberlist.jsp?command=delMember&mid=<%=member.getMid()%>'>삭제</a></td>
		<td><a href='memberedit.jsp?mid=<%=member.getMid()%>'>수정</a></td>
		</tr>
<%			
		}
%>
		
	</table>
	<a href='memberreg.html'>멤버등록</a>
	<a href='memberlogout.jsp'>로그아웃</a>
</html>