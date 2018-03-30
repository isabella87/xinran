<%@ page language="java" pageEncoding="UTF-8"%>
<%
String rootPath = request.getContextPath().trim();
if(rootPath.equals("")||rootPath==null){
	response.sendRedirect("xinran/index.html");
}
else{
	response.sendRedirect("index.html");
}
%>