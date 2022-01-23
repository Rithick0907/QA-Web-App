<%-- 
    Document   : addQuestionAction
    Created on : 21-Jan-2022, 4:44:33 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*" %>
<%
    String name = request.getParameter("name");
    String question = request.getParameter("question");
    QuestionDao.addQuestion(name, question);
    response.sendRedirect("index.jsp");
%>
