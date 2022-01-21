
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
    public static void main(String[] args) {
        try{
            String query = "SELECT * FROM questions";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/qa_db","root","Qwertyup123");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while(rs.next()){
                String name = rs.getString(2);
                String question = rs.getString(3);
                System.out.println(name+"  "+question);
            }
            conn.close();
            
        }catch(Throwable th){
            th.printStackTrace();
        }
    }
}
