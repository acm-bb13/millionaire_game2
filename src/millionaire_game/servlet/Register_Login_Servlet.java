package millionaire_game.servlet;

import millionaire_game.javabean.Register_Message_bean;
import millionaire_game.util.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/Register_login")
public class Register_Login_Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        设置文档为UTF-8，防止乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");


        String user_login = req.getParameter("user_login");
        String user_password=req.getParameter("user_password");
//        System.out.println(user_login);
//        System.out.println(user_password);

//        用于记录是否完成登录，决定跳转界面
        boolean isLogin=false;
        try {
            Statement statement=JDBCUtil.getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * from register where user_login='"+user_login+"' ");
            if(resultSet.next()){
                if(resultSet.getString("user_password").equals(user_password)){
//                    req.setAttribute("p_login" , "登录成功");
                    isLogin=true;
                }else {
                    req.setAttribute("p_err","密码错误");
                }
            }else {
                req.setAttribute("u_err","用户名不存在");
            }
//            关闭搜索结果
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(isLogin){
//            登录成功，跳转至游戏主菜单
            Register_Message_bean.login_Register(user_login);
            resp.sendRedirect("Cemu_main.jsp");
        }else {
//            登录失败，返回错误数据
            req.getRequestDispatcher("Register_login.jsp").forward(req,resp);
        }
    }
//
}
