<%-- 
    Document   : deleteQuestionAction
    Created on : 23-Jan-2022, 5:18:06 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*" %>
<%
    int questionId = Integer.parseInt(request.getParameter("qId"));
    QuestionDao.deleteQuestionById(questionId);
    response.sendRedirect("index.jsp");
%>