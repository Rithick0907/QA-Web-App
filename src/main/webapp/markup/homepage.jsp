<%-- 
    Document   : homepage
    Created on : 21-Jan-2022, 2:37:48 pm
    Author     : Rithick
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Listing</title>
        <link rel="stylesheet" href="../css/homepage.css" />
    </head>
    <body>
        <div class="add-question">
            <form action="addQuestionAction.jsp">
                <input name="name" placeholder="Name" type="text" />
                <input name="question" placeholder="Enter Your Question" type="text" />
                <button type="submit">Add Question</button>
            </form>
        </div>
        <div class="question-list">
        <table>
            <thead>
                <th>Name</th>
                <th>Question</th>
            </thead>
            <tbody>
                <%
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/qa_db","root","Qwertyup123");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM questions");
                        while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString(2)%></td>
                    <td><a href=""><%=rs.getString(3)%></a></td>
                </tr>
                <%
                        }
                    }catch(Exception ex){
                        ex.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        </div>
    </body>
</html>
