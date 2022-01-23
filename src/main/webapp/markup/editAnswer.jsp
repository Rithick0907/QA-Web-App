<%-- 
    Document   : editAnswer
    Created on : 23-Jan-2022, 4:30:47 pm
    Author     : Rithick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qa_app.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Answer</title>
        <link rel="stylesheet" href="../css/editAnswer.css"/>
    </head>
    <body>
        <%
            int answerId = Integer.parseInt(request.getParameter("answerId"));
            int questionId = Integer.parseInt(request.getParameter("questionId"));
            Answer answer = AnswersDao.getAnswerById(answerId);            
        %>
        <div class="answer-container">
            <p class="answer quote"><%=answer.getAnswer()%></p>
            <span class="responder"><%=answer.getName()%></span>
        </div>
        <form class="btn-center" action="updateResponder.jsp" method="post">
            <input type="hidden" name="answerId" value=<%=answerId%> />
            <input type="hidden" name="questionId" value=<%=questionId%> />
            <input type="text" name="name" placeholder="Name" required />
            <button class="btn btn--primary btn-group">
                Edit Responder
            </button>
        </form>
        <form class="btn-center" action="updateAnswer.jsp" method="post">
            <input type="hidden" name="answerId" value=<%=answerId%> />
            <input type="hidden" name="questionId" value=<%=questionId%> />
            <input type="text" name="answer" placeholder="Answer" required />
            <button class="btn btn--primary btn-group">
                Edit Answer
            </button>
        </form>
    </body>
</html>