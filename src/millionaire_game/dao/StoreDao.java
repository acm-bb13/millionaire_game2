package millionaire_game.dao;

import millionaire_game.javabean.Store;
import millionaire_game.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.ResolverStyle;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StoreDao {
    public int insertCon(Store store){
        //执行insert sql
        //链接mysql
        try {
            Connection connection = JDBCUtil.getCon();
            PreparedStatement ps = connection.prepareStatement("insert into tab_con(title,content) value (?,?)");
            ps.setString(1,store.getName());
            ps.setString(2,store.getUrl());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Store> queryList(int page,String searchText){
        List<Store> list = new ArrayList<>();
        try {
            Connection connection = JDBCUtil.getCon();
            PreparedStatement ps = connection.prepareStatement("select * from store where name like ?  limit ?,3");
            ps.setString(1,"%" + searchText  + "%");
            ps.setInt(2,page);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
                list.add(new Store(rs.getInt("id"),rs.getString("name"),rs.getString("url"), rs.getInt("one_buy_gold")));
            JDBCUtil.close(rs,ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Integer queryNumber(String searchText){
        Integer count=0;
        try{
            Connection connection = JDBCUtil.getCon();
            PreparedStatement ps = connection.prepareStatement("select count(*) as num from store where name like ? ");
            ps.setString(1,"%" + searchText  + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                count=rs.getInt("num");
            JDBCUtil.close(rs,ps);
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Store> qureItem(Integer id){
        List<Store> list = new ArrayList<>();
        try{
            Connection connection = JDBCUtil.getCon();
            PreparedStatement ps = connection.prepareStatement("select * from store where id=? ");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                list.add(new Store(rs.getInt("id"),rs.getString("name"),rs.getString("url"), rs.getInt("one_buy_gold"),rs.getString("comment")));
            JDBCUtil.close(rs,ps);
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
