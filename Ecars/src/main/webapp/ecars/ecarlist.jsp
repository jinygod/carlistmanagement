<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ecars.*, java.util.List"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>차량 관리</title>
</head>
<body>

</body>
<%
request.setCharacterEncoding("utf-8");

	ECarsDAO ecarDAO = new ECarsDAO();

	String command = request.getParameter("command");
	if(command != null) {
		if(command.equals("addcar")) {
			// String serial = request.getParameter("serial");
			String serial = null;
			String var  = request.getParameter("var");
			String color = request.getParameter("color");
			String price  = request.getParameter("price");
			String qty    = request.getParameter("qty");
			
			System.out.printf("[ecarlist] addcar: (%s)(%s)(%s)(%s)(%s)%n", serial, var, color, price, qty);
			ECarsVO ecar = new ECarsVO(serial, var, color, price, qty);
			ecarDAO.addcar(ecar);
		}
		else if(command.equals("delcar")) {
			String serial = request.getParameter("serial");
			System.out.printf("[ecarlist] delcar: serial(%s)%n", serial);
			
			if(serial != null && serial.isEmpty() != true) { 
				ecarDAO.delcar(serial);
			}
		}
		else if(command.equals("editcar")) {
			String serial = request.getParameter("serial");
			String var  = request.getParameter("var");
			String color = request.getParameter("color");
			String price  = request.getParameter("price");
			String qty    = request.getParameter("qty");
				
			System.out.printf("[ecarlist] editcar: (%s)(%s)(%s)(%s)(%s)%n", serial, var, color, price, qty);
			
			ECarsVO ecar = new ECarsVO(serial, var, color, price, qty);
			ecarDAO.updatecar(ecar);
		}
	}
	
	List<ECarsVO> ecars = ecarDAO.getcars();
	
	request.setAttribute("ecars", ecars);
	
	RequestDispatcher dispatch = request.getRequestDispatcher("ecarview.jsp");
	dispatch.forward(request, response);
%>
</html>