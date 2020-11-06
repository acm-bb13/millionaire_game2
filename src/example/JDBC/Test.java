package example.JDBC;

import java.sql.*;

public class Test {
    public static void main(String[] args) {
        String url="jdbc:mysql://127.0.0.1:3306/mydate?useSSL=false&serverTimezone=GMT";
        String user="root";
        String pass="123";
        String driver="com.mysql.cj.jdbc.Driver";
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url,user,pass);

            Statement statement=connection.createStatement();
            DriverManager.getConnection(url,user,pass);
            ResultSet resultSet = statement.executeQuery("select * from tab_user");
            System.out.print("id"+"\t\t");
            System.out.print("user_name"+"\t");
            System.out.println("pass_word"+"\t\t");
            while (resultSet.next()){
                System.out.print(resultSet.getString("id")+"\t\t");
                System.out.print(resultSet.getString("user_name")+"\t\t");
                System.out.println(resultSet.getString("pass_word")+"\t\t");
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
