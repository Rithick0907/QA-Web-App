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
    AnswersDao.addAnswer(questionId, name, answer);
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>