<%-- 
    Document   : editQuestionAction
    Created on : 24-Jan-2022, 12:39:56 pm
    Author     : Rithick
--%>

<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*"%>
<%
    int questionId = Integer.parseInt(request.getParameter("questionId"));
    String question = request.getParameter("question");
    String questioner = request.getParameter("questioner");
    QuestionDao.editQuestion(questionId, question, questioner);
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>