package millionaire_game.dao;

//import com.sun.org.apache.xerces.internal.impl.xs.util.SimpleLocator;
import millionaire_game.javabean.Character_Message_bean;
//import millionaire_game.javabean.Register_Message_bean;
import millionaire_game.util.JDBCUtil;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class Character_Operate_Dao {

    public static List<Character_Message_bean> getCharacter_Message(String user_login){
        Connection connection = JDBCUtil.getConnection();
        List<Character_Message_bean> answer = new ArrayList<Character_Message_bean>();
        try {
            Statement statement = connection.createStatement();
            String sql = "select * from character_form where user_login = '"+user_login+"'";
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                answer.add(new Character_Message_bean(
                        resultSet.getInt("id"),
                        resultSet.getString("character_name"),
                        resultSet.getInt("health"),
                        resultSet.getInt("gold"),
                        resultSet.getInt("map_x"),
                        resultSet.getInt("map_y"),
                        resultSet.getTimestamp("date_create").toString(),
                        resultSet.getTimestamp("date_loaded").toString(),
                        resultSet.getString("record"),
                        resultSet.getInt("kind"),
                        resultSet.getString("user_login"))
                );
            }
            resultSet.close();
            statement.close();
            JDBCUtil.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answer;
    }

    public static Character_Message_bean getCharacter_Message_Index(int id){
        Connection connection = JDBCUtil.getConnection();
        Character_Message_bean cmb =null;
        try {
            Statement statement = connection.createStatement();
            String sql = "select * from character_form where id = '"+id+"'";
            ResultSet resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                cmb=new Character_Message_bean(
                        resultSet.getInt("id"),
                        resultSet.getString("character_name"),
                        resultSet.getInt("health"),
                        resultSet.getInt("gold"),
                        resultSet.getInt("map_x"),
                        resultSet.getInt("map_y"),
                        resultSet.getTimestamp("date_create").toString(),
                        resultSet.getTimestamp("date_loaded").toString(),
                        resultSet.getString("record"),
                        resultSet.getInt("kind"),
                        resultSet.getString("user_login")
                );
            }
            resultSet.close();
            statement.close();
            JDBCUtil.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cmb;
    }

    public static void deleteDate(Integer id){
        Connection connection = JDBCUtil.getConnection();
        String sql = "DELETE FROM character_form WHERE id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int i=1;
            ps.setInt(i,id);
            ps.executeUpdate();
            JDBCUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateDate(Character_Message_bean cmb){
        Connection connection = JDBCUtil.getConnection();
        String sql = "update character_form set character_name=?,health=?"+
                ",gold=?,map_x=?,map_y=?,date_create=?"+
                ",date_loaded=?,record=?,kind=?,user_login=?"+
                " where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int i=1;
            ps.setString(i++,cmb.getName());
            ps.setInt(i++,cmb.getHealth());
            ps.setInt(i++,cmb.getGold());
            ps.setInt(i++,cmb.getMap_x());
            ps.setInt(i++,cmb.getMap_y());
            ps.setString(i++, cmb.getDate_create());
            ps.setString(i++, cmb.getDate_loaded());
            ps.setString(i++,cmb.getRecord());
            ps.setInt(i++,cmb.getKind());
            ps.setString(i++,cmb.getUser_login());
            ps.setInt(i,cmb.getId());
            ps.executeUpdate();
            JDBCUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void addDate(Character_Message_bean cmb){
        Connection connection=JDBCUtil.getConnection();
        String sql = "insert into character_form(character_name,health"+
                ",gold,map_x,map_y,date_create"+
                ",date_loaded,record,kind,user_login) "+
                "value(?,?,?,?,?,?,?,?,?,?)";
        try {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            PreparedStatement ps = connection.prepareStatement(sql);
            int i=1;
            ps.setString(i++,cmb.getName());
            ps.setInt(i++,cmb.getHealth());
            ps.setInt(i++,cmb.getGold());
            ps.setInt(i++,cmb.getMap_x());
            ps.setInt(i++,cmb.getMap_y());
            ps.setString(i++, cmb.getDate_create());
            ps.setString(i++, cmb.getDate_loaded());
            ps.setString(i++,cmb.getRecord());
            ps.setInt(i++,cmb.getKind());
            ps.setString(i,cmb.getUser_login());
            ps.executeUpdate();
            JDBCUtil.close(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
