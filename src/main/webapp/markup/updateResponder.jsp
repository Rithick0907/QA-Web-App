<%-- 
    Document   : updateResponder
    Created on : 23-Jan-2022, 4:43:58 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*"%>
<%
    String name = request.getParameter("name");
    int answerId = Integer.parseInt(request.getParameter("answerId"));
    int questionId = Integer.parseInt(request.getParameter("questionId"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/qa_db","root","Qwertyup123");
    PreparedStatement ps = conn.prepareStatement("UPDATE answers SET NAME = ? WHERE ID = ?");
    ps.setString(1,name);
    ps.setInt(2, answerId);
    ps.executeUpdate();
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>