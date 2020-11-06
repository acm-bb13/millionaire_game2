package millionaire_game.dao;

import millionaire_game.javabean.Register_Message_bean;
import millionaire_game.util.JDBCUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Login_Dao {
    static public Register_Message_bean login_Reigister(String user_login){
        Register_Message_bean result = null;
        Connection connection = JDBCUtil.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from register where user_login = '"+user_login+"'");
            if(resultSet.next()){
                result = new Register_Message_bean(resultSet.getString("user_login") , resultSet.getString("user_name") , (resultSet.getInt("is_admin")==1?true:false),resultSet.getInt("user_gold"),resultSet.getInt("experience") ,resultSet.getString("user_password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
