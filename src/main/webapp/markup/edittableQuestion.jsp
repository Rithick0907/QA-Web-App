<%-- 
    Document   : edittableQuestion
    Created on : 23-Jan-2022, 12:43:26 pm
    Author     : Rithick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qa_app.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/edittableQuestion.css"/>
        <title>Edit Question</title>
    </head>
    <body>
        <%
            int questionId = Integer.parseInt(request.getParameter("qId"));
            Question ques = QuestionDao.getQuestionById(questionId);
        %>
        <div class="question-container">
            <p class="question quote"><%= ques.question%></p>
            <span class="questioner"><%= ques.name%></span>
        </div>
        <form class="btn-center" action="addAnswerAction.jsp" method="post">
            <input type="hidden" name="questionId" value=<%=questionId %> />
            <input type="text" name="name" placeholder="Name" required />
            <input type="text" name="answer" placeholder="Answer" required />
            <button class="btn btn--primary btn-group">
                Add Answer
            </button>
        </form>
    </body>
</html>
