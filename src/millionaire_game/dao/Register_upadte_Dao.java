package millionaire_game.dao;

import millionaire_game.javabean.Register_Message_bean;
import millionaire_game.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//自动完成账户的修改工作
public class Register_upadte_Dao {
    public static void pushDate(Register_Message_bean register_messageBean){
        Connection connection = JDBCUtil.getConnection();
        try {
            String sql="update register set user_name=?,user_password=?,is_admin=?,user_gold=?,experience=? where user_login=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            int i=1;
            preparedStatement.setString(i++, register_messageBean.getUser_name());
            System.out.println(register_messageBean.getUser_name());
            preparedStatement.setString(i++, register_messageBean.getUser_password());
            preparedStatement.setInt(i++, register_messageBean.isIs_admin()?1:0);
            preparedStatement.setInt(i++, register_messageBean.getUser_gold());
            preparedStatement.setInt(i++, register_messageBean.getExperience());
            preparedStatement.setString(i++, register_messageBean.getUser_login());
            preparedStatement.executeUpdate();
            JDBCUtil.close(preparedStatement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
