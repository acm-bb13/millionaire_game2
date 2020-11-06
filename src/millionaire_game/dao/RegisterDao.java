package millionaire_game.dao;

import millionaire_game.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//帐号自动化类
public class RegisterDao {

//    完成注册一个帐号动作
    static public void register_register(String user_login, String user_password, String user_name){
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("insert into register(user_login,user_password,user_name,is_admin,user_gold,experience) value(?,?,?,?,?,?)");
            int i=1;
            ps.setString(i++,user_login);
            ps.setString(i++,user_password);
            ps.setString(i++,user_name);
            ps.setInt(i++,0);
            ps.setInt(i++,1000);
            ps.setInt(i++,0);
            ps.executeUpdate();
            JDBCUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//        完成注册一个帐号动作，完整操作
    static public void register_register(String user_login, String user_password, String user_name ,int is_admin , int user_gold ,int experience){
        Connection connection = JDBCUtil.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("insert into register(user_login,user_password,user_name,is_admin,user_gold,experience) value(?,?,?,?,?,?) ");
            int i=1;
            ps.setString(i++,user_login);
            ps.setString(i++,user_password);
            ps.setString(i++,user_name);
            ps.setInt(i++,is_admin);
            ps.setInt(i++,user_gold);
            ps.setInt(i++,experience);
            ps.executeUpdate();
            JDBCUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
