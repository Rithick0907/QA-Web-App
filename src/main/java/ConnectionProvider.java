
import java.sql.*;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Rithick
 */
public class ConnectionProvider {
    public static Connection getConnection() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/qa_db","root","Qwertyup123");
            return conn;
            
        }catch(Throwable th){
            th.printStackTrace();
            return null;
        }
    }
}
