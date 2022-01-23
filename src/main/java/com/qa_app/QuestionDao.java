package com.qa_app;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Rithick
 */
public class QuestionDao {
    public static int getQuestionsCount() throws Exception{
       int count = 0;
       Connection conn = ConnectionProvider.getConnection();
       Statement stmt = conn.createStatement();
       ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM questions");
       while(rs.next())
           count = Integer.parseInt(rs.getString(1));
       return count;
    }
   public static List<Question> getQuestions(int pageNo) throws Exception{
       int startRecord = Math.abs((pageNo * 10) - 10);
       List<Question> questionsList = new ArrayList<Question>();
       Connection conn = ConnectionProvider.getConnection();
       Statement stmt = conn.createStatement();
       ResultSet rs = stmt.executeQuery("SELECT * FROM questions ORDER BY id LIMIT " + startRecord + ",10");
       while(rs.next()){
           int id = Integer.parseInt(rs.getString("id"));
           String name = rs.getString("name");
           String question = rs.getString("question");
           Question ques = new Question(id,name,question);
           questionsList.add(ques);
       }
       conn.close();
       return questionsList;
   }
}
