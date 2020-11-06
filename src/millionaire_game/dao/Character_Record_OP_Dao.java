package millionaire_game.dao;

import millionaire_game.javabean.Character_Record_bean;
import millionaire_game.util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Character_Record_OP_Dao {

    static public void add(Character_Record_bean crb){
        Connection connection = JDBCUtil.getConnection();
        String sql = "insert into character_record(record_name,date_time,win) value(?,?,?)";
        try {
            Timestamp d = new Timestamp(System.currentTimeMillis());
            PreparedStatement ps=connection.prepareStatement(sql);
            int i = 1;
            ps.setString(i++,crb.getName());
            ps.setString(i++,d.toString());
            ps.setInt(i++,crb.getIs_win()?1:0);
            JDBCUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    static public List<Character_Record_bean> get(){
        Connection connection = JDBCUtil.getConnection();
        List<Character_Record_bean> list = new ArrayList<>();
        String sql = "";
        try {
            Statement statement = connection.createStatement();
            sql = "select * from character_record Order By date_time Desc";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                list.add(
                        new Character_Record_bean(
                                resultSet.getInt("id"),
                                resultSet.getString("record_name"),
                                resultSet.getString("date_time"),
                                resultSet.getInt("is_win")==1?true:false
                        )
                );
            }
            resultSet.close();
            statement.close();
            JDBCUtil.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


}
