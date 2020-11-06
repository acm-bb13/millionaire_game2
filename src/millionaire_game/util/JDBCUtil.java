package millionaire_game.util;

import java.sql.*;

public class JDBCUtil {
    //连接数据库信息
    private static final String URL="jdbc:mysql://127.0.0.1:3306/millionaire_game_date?useSSL=false&serverTimezone=GMT&allowPublicKeyRetrieval=true";
//    jdbc:mysql://localhost:3306/xxx?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useSSL=false
//&serverTimezone=UTC&allowPublicKeyRetrieval=true
    private static final String USER="root";
    private static final String PASS="123456";
    private static final String DRIVER2="com.mysql.cj.jdbc.Driver";
    private static Connection connection;
    //静态代码块，加载mysql引擎
    static {
        try {
            Class.forName(DRIVER2);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
//    尝试连接数据库
    public static Connection getConnection(){
        if(connection == null){
            try {
                connection = DriverManager.getConnection(URL,USER,PASS);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
    public static Connection getCon(){
        if(connection == null){
            try {
                connection = DriverManager.getConnection(URL,USER,PASS);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
//    关闭连接
    public static void closeConnection(){
        if(connection != null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }finally{
                connection = null;    //设置连接对象为null值
            }
        }
    }
//    关闭修改和连接
    public static void close(PreparedStatement ps){
        closeConnection();
        try {
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            ps = null;    //设置连接对象为null值
        }
    }
//    关闭读取,修改和连接
    public static void close(ResultSet rs , PreparedStatement ps){
    close(ps);
    try {
        rs.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }finally{
        rs = null;    //设置连接对象为null值
    }
}
}
