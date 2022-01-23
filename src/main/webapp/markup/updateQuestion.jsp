<%-- 
    Document   : updateQuestion
    Created on : 23-Jan-2022, 3:58:54 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*"%>
<%
    int questionId = Integer.parseInt(request.getParameter("questionId"));
    String question = request.getParameter("question");
    QuestionDao.updateQuestion(questionId, question);
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>
