/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.qa_app;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Rithick
 */
public class AnswersDao {
    public static void addAnswer(int questionId,String name,String answer) throws Exception{
        String query = "INSERT INTO answers(NAME, ANSWER, QUESTION_ID) VALUES(?,?,?)";
        Connection conn = ConnectionProvider.getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1,name);
        ps.setString(2,answer);
        ps.setString(3,answer);
        ps.executeUpdate();
    }
}
