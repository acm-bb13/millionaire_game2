package millionaire_game.servlet;

import millionaire_game.dao.RegisterDao;
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

@WebServlet("/Register_register")
public class Register_Register_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        设置文档为UTF-8，防止乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

//        获取数据
        String user_login = req.getParameter("user_login");
        String user_password=req.getParameter("user_password");
        String user_name=req.getParameter("user_name");

//        用于检测数据是否成功读取，记得备注掉
        System.out.println(user_login);
        System.out.println(user_name);
        System.out.println(user_password);

//        注册帐号
        RegisterDao.register_register(user_login,user_password,user_name);

        PrintWriter out = resp.getWriter();
        out.write("true");
        System.out.println(" test1");
//        重定向为啥没用了
//        resp.sendRedirect("Register_login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
