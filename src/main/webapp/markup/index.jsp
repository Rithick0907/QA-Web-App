<%-- 
    Document   : index.jsp
    Created on : 23-Jan-2022, 10:54:38 am
    Author     : Rithick
--%>
<%@page import="com.qa_app.*"%>
<%
    int pageSize = 10;
    int totalQuestions = QuestionDao.getQuestionsCount();
    int totalPages = (int)Math.ceil(totalQuestions / (double)pageSize);
    response.sendRedirect("homepage.jsp?page=1&totalPages="+totalPages);
%>
