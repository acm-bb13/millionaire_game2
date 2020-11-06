package millionaire_game;


import com.alibaba.fastjson.JSONArray;
import com.mysql.cj.xdevapi.JsonArray;
import millionaire_game.dao.Character_Operate_Dao;
import millionaire_game.javabean.Character_Message_bean;
import millionaire_game.util.JDBCUtil;

import java.sql.*;
import java.text.SimpleDateFormat;

import java.util.List;

public class test {
    public static void main(String[] args) {
//        List<Character_Message_bean> cm = Character_Operate_Dao.getCharacter_Message("admin");
////        for(int i = 0 ; i<cm.size();i++){
////            JsonArray jsonArray = new JsonArray();
////            System.out.println(cm.get(i));
////        }
//        System.out.println(JSONArray.toJSONString(cm));

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Connection connection = JDBCUtil.getConnection();
        String sql = "update character_form set date_loaded=? where id=3";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,timestamp.toString());
            ps.executeUpdate();
            JDBCUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        System.out.println(timestamp.toString());
    }
}
