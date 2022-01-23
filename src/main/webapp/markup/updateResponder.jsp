<%-- 
    Document   : updateResponder
    Created on : 23-Jan-2022, 4:43:58 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*"%>
<%
    int questionId = Integer.parseInt(request.getParameter("questionId"));
    String name = request.getParameter("name");
    int answerId = Integer.parseInt(request.getParameter("answerId"));
    AnswersDao.updateResponded(answerId, name);
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>