<%-- 
    Document   : updateQuestioner
    Created on : 23-Jan-2022, 4:00:36 pm
    Author     : Rithick
--%>

<%@page import="java.sql.*"%>
<%@page import="com.qa_app.*"%>
<%
    int questionId = Integer.parseInt(request.getParameter("questionId"));
    String name = request.getParameter("name");
    QuestionDao.updateQuestioner(questionId, name);
    response.sendRedirect("edittableQuestion.jsp?qId="+questionId);
%>
