<%-- 
    Document   : addQuestionAction
    Created on : 21-Jan-2022, 4:44:33 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*"%>
<%
    String name = request.getParameter("name");
    String question = request.getParameter("question");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/qa_db","root","Qwertyup123");
    PreparedStatement ps = conn.prepareStatement("INSERT INTO questions(NAME,QUESTION) VALUES (?,?)");
    ps.setString(1,name);
    ps.setString(2,question);
    ps.executeUpdate();
    response.sendRedirect("index.jsp");
%>
