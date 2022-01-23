<%-- 
    Document   : addAnswerAction
    Created on : 23-Jan-2022, 2:57:18 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*"%>
<%
    int questionId = Integer.parseInt(request.getParameter("questionId"));
    String name = request.getParameter("name");
    String answer = request.getParameter("answer");
    String query = "INSERT INTO answers(NAME,ANSWER,QUESTION_ID) VALUES (?,?,?)";
    Connection conn = ConnectionProvider.getConnection();
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1,name);
    ps.setString(2,answer);
    ps.setInt(3,questionId);
    ps.executeUpdate();
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>