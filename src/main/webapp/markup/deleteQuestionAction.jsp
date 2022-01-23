<%-- 
    Document   : deleteQuestionAction
    Created on : 23-Jan-2022, 5:18:06 pm
    Author     : Rithick
--%>

<%@page import="java.sql.*"%>
<%
    int qId = Integer.parseInt(request.getParameter("qId"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/qa_db","root","Qwertyup123");
    PreparedStatement ps = conn.prepareStatement("DELETE FROM QUESTIONS WHERE ID = ?");
    ps.setInt(1,qId);
    ps.executeUpdate();
    response.sendRedirect("index.jsp");
%>
