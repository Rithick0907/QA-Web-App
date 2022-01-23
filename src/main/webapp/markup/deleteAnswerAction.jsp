<%-- 
    Document   : deleteAnswerAction
    Created on : 23-Jan-2022, 6:10:12 pm
    Author     : Rithick
--%>

<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*" %>
<%
    int questionId = Integer.parseInt(request.getParameter("qId"));
    int answerId = Integer.parseInt(request.getParameter("answerId"));
    AnswersDao.deleteAnswerById(answerId);
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>
