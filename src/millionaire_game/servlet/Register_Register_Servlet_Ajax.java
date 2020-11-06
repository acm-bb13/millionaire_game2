package millionaire_game.servlet;

import millionaire_game.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//Ajax异步服务请求处理
@WebServlet("/Register_Register_Servlet_Ajax")
public class Register_Register_Servlet_Ajax extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        防止乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String user_login = req.getParameter("user_login");
        Statement statement= null;
        try {
            statement = JDBCUtil.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * from register where user_login='"+user_login+"' ");
            if(resultSet.next()){
                PrintWriter out = resp.getWriter();
                out.write("false");
            }else {
                PrintWriter out = resp.getWriter();
                out.write("true");
            }
            JDBCUtil.closeConnection();
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
