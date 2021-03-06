<%-- 
    Document   : edittableQuestion
    Created on : 23-Jan-2022, 12:43:26 pm
    Author     : Rithick
--%>

<%@page import="java.util.List"%>
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
            String prefilledQuestion = ques.question;
            String redirectOnDelete = "deleteQuestionAction.jsp?qId=" + questionId;
        %>
        <div class="question-container">
            <p class="question quote"><%= ques.question%></p>
            <span class="questioner"><%= ques.name%></span>
        </div>
        <div class="btn-center">
            <a class="btn btn--primary" href=<%= redirectOnDelete%>>Delete Question</a>
        </div>
        <form class="btn-center" action="editQuestionAction.jsp" method="post">
            <input type="hidden" name="questionId" value=<%=questionId%> />
            <input type="text" name="questioner" value="<%= ques.name%>" required />
            <input type="text" name="question" value="<%= prefilledQuestion%>" required />
            <button class="btn btn--primary btn-group">
                Edit Question
            </button>
        </form>
        <form class="btn-center" action="addAnswerAction.jsp" method="post">
            <input type="hidden" name="questionId" value=<%=questionId%> />
            <input type="text" name="name" placeholder="Name" required />
            <input type="text" name="answer" placeholder="Answer" required />
            <button class="btn btn--secondary btn-group">
                Add Answer
            </button>
        </form>
        <hr>
        <div class="answer-list">
            <h2>Answers</h2>
            <%
                List<Answer> answers = AnswersDao.getAnswer(questionId);
                if(answers.size() > 0){
            %>
            <table>
                <thead>
                <th>Answered By</th>
                <th>Answer</th>
                <th></th>
                </thead>
                <tbody>
                    <%
                        for(Answer answer : answers){
                        String editURI = "editAnswer.jsp?answerId=" + answer.getId() + "&questionId=" + questionId;
                    %>
                    <tr>
                        <td><%= answer.getName()%></td>
                        <td><%= answer.getAnswer()%></td>   
                        <td>
                            <a href=<%=editURI%> class="btn btn--primary">Edit </a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                }else{
                    out.println("<p style='font-size:1.5rem'>No Answers added Yet</p>");
                }
            %>
        </div>
    </body>
</html>
