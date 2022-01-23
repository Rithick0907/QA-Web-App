/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qa_app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rithick
 */
public class AnswersDao {
    public static List<Answer> getAnswer(int questionId) throws Exception{
        List<Answer> answers = new ArrayList<Answer>();
        Connection conn = ConnectionProvider.getConnection();
        Statement stmt = conn.createStatement();
       ResultSet rs = stmt.executeQuery("SELECT * FROM answers WHERE question_id = " + questionId);
       while(rs.next()){
           int id = Integer.parseInt(rs.getString("id"));
           String name = rs.getString("name");
           String question = rs.getString("answer");
           answers.add(new Answer(id,questionId,name,question));
       }
        return answers;
    }
    public static void addAnswer(int questionId,String name,String answer) throws Exception{
        String query = "INSERT INTO answers(NAME, ANSWER, QUESTION_ID) VALUES(?,?,?)";
        Connection conn = ConnectionProvider.getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1,name);
        ps.setString(2,answer);
        ps.setInt(3,questionId);
        ps.executeUpdate();
        conn.close();
    }
}
