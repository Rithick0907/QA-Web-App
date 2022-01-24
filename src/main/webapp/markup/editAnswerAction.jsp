<%-- 
    Document   : editAnswerAction
    Created on : 24-Jan-2022, 12:47:52 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*"%>
<%
    int questionId = Integer.parseInt(request.getParameter("questionId"));
    int answerId = Integer.parseInt(request.getParameter("answerId"));
    String answer = request.getParameter("answer");
    String responder = request.getParameter("name");
    AnswersDao.editAnswer(answerId, answer, responder);
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>
