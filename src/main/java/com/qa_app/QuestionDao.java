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
       conn.close();
       return count;
    }
    public static Question getQuestionById(int id) throws Exception{
        String query = "SELECT * FROM questions WHERE id = " + id;
        Connection conn = ConnectionProvider.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        rs.next();
        String name = rs.getString("name");
        String question = rs.getString("question");
        conn.close();
        return new Question(id,name,question);
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
   public static void updateQuestion(int questionId,String question) throws Exception{
       String query = "UPDATE QUESTIONS SET question = ? WHERE id = ?";
       Connection conn = ConnectionProvider.getConnection();
       PreparedStatement ps = conn.prepareStatement(query);
       ps.setString(1, question);
       ps.setInt(2,questionId);
       ps.execute();
       conn.close();
   }
   public static void updateQuestioner(int questionId,String name) throws Exception{
       String query = "UPDATE QUESTIONS SET name = ? WHERE id = ?";
       Connection conn = ConnectionProvider.getConnection();
       PreparedStatement ps = conn.prepareStatement(query);
       ps.setString(1, name);
       ps.setInt(2,questionId);
       ps.execute();
       conn.close();
   }
   public static void deleteQuestionById(int questionId) throws Exception{
       String query = "DELETE FROM QUESTIONS WHERE ID = " + questionId;
       Connection conn = ConnectionProvider.getConnection();
       Statement stmt = conn.createStatement();
       ResultSet rs = stmt.executeQuery(query);
       rs.close();
       conn.close();
   }
}
