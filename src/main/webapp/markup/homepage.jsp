<%-- 
    Document   : homepage
    Created on : 21-Jan-2022, 2:37:48 pm
    Author     : Rithick
--%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*" %>
<%@page import="com.qa_app.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Listing</title>
        <link rel="stylesheet" href="../css/homepage.css" />
    </head>
    <body>
        <%
            int pageNo = Integer.parseInt(request.getParameter("page"));
            int totalPages = Integer.parseInt(request.getParameter("totalPages"));
        %>
        <div class="add-question">
            <form action="addQuestionAction.jsp" method="post">
                <input name="name" placeholder="Name" type="text" />
                <input name="question" placeholder="Enter Your Question" type="text" />
                <button class="btn btn--primary" type="submit">Add Question</button>
            </form>
        </div>
        <div class="question-list">
        <table>
            <thead>
                <th>Name</th>
                <th>Questions</th>
            </thead>
            <tbody>
                <%
                    List<Question> questionsList = QuestionDao.getQuestions(pageNo);
                    for(Question question : questionsList){
                %>
                <tr>
                    <td><%=question.name%></td>
                    <td><a href=""><%=question.question%></a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        </div>
        <div class="navigator">
            <%
                for(int i = 1; i <= totalPages;i++){
                    String paginatedLink = "homepage.jsp?page="+i+"&totalPages="+totalPages;
                    if(i == pageNo)
                        out.println("<a class='active' href="+paginatedLink+">"+i+"</a>");
                    else
                        out.println("<a href="+paginatedLink+">"+i+"</a>");
                }
            %>
        </div>
    </body>
</html>
