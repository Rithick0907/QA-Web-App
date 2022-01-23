<%-- 
    Document   : updateAnswer
    Created on : 23-Jan-2022, 4:44:07 pm
    Author     : Rithick
--%>

<%@page import="java.sql.*"%>
<%
    String answer = request.getParameter("answer");
    int questionId = Integer.parseInt(request.getParameter("questionId"));
    int answerId = Integer.parseInt(request.getParameter("answerId"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/qa_db","root","Qwertyup123");
    PreparedStatement ps = conn.prepareStatement("UPDATE answers SET ANSWER = ? WHERE ID = ?");
    ps.setString(1,answer);
    ps.setInt(2, answerId);
    ps.executeUpdate();
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>