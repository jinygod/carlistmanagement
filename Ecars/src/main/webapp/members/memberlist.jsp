<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="members.*"
    import="java.util.List"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>멤버 관리</title>
</head>
<body>

</body>
<%
request.setCharacterEncoding("utf-8");

	if(session != null) {
		boolean isSession = request.isRequestedSessionIdValid();
		String userid = (String)session.getAttribute("userid");
		System.out.printf("[memberlist] userid: (%s)(%b)%n", userid, isSession);
		
		if(isSession != true || userid == null || userid.isEmpty()) {
	response.sendRedirect("memberlogin.html");
	return;
		}
	}
	else {
		response.sendRedirect("memberlogin.html");
		return;
	}

	MemberDBCP memberDBCP = new MemberDBCP();

	String command = request.getParameter("command");
	if(command != null) {
		
		if(command.equals("addMember")) {
	String mid   = request.getParameter("mid");
	String mname = request.getParameter("mname");
	String pwd   = request.getParameter("pwd");
	String email = request.getParameter("email");
	System.out.printf("[memberlist] addMember: (%s)(%s)(%s)(%s)%n", mid, mname, pwd, email);
	
	if(mid != null && mid.isEmpty() != true) { 
		MemberVO member = new MemberVO(mid, mname, pwd, email);
		memberDBCP.addMember(member);
	}
		}
		else if(command.equals("delMember")){
	String mid = request.getParameter("mid");
	System.out.printf("[memberlist] delMember: mid(%s)%n", mid);
	
	if(mid != null && mid.isEmpty() != true) { 
		memberDBCP.delMember(mid);
	}
		}
		else if(command.equals("editMember")) {
	String mid   = request.getParameter("mid");
	String mname = request.getParameter("mname");
	String pwd   = request.getParameter("pwd");
	String email = request.getParameter("email");
	System.out.printf("[memberlist] editMember: (%s)(%s)(%s)(%s)%n", mid, mname, pwd, email);
	
	if(mid != null && mid.isEmpty() != true) { 
		MemberVO member = new MemberVO(mid, mname, pwd, email);
		memberDBCP.updateMember(member);
	}
		}
	}		
	
	List<MemberVO> members = memberDBCP.getMembers();
	
	request.setAttribute("members", members);
	
	RequestDispatcher dispatch = request.getRequestDispatcher("memberview.jsp");
	dispatch.forward(request, response);
%>
</html>