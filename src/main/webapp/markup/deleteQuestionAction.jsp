<%-- 
    Document   : deleteQuestionAction
    Created on : 23-Jan-2022, 3:11:16 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*"%>
<%@page import="com.qa_app.QuestionDao"%>
<%
    int qId = Integer.parseInt(request.getParameter("qId"));
    QuestionDao.deleteQuestionById(qId);
    response.sendRedirect("index.jsp");
%>