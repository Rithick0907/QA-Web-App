<%-- 
    Document   : updateAnswer
    Created on : 23-Jan-2022, 4:44:07 pm
    Author     : Rithick
--%>

<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*"%>
<%
    int questionId = Integer.parseInt(request.getParameter("questionId"));
    String answer = request.getParameter("answer");
    int answerId = Integer.parseInt(request.getParameter("answerId"));
    AnswersDao.updateAnswer(answerId, answer);
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>