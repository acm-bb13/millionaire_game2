package millionaire_game.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Ajax_template")
public class Ajax_template extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        防止乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        System.out.println("    ________测试 -----------------\n\n\n\n\n\n\n\n\n\n           ");
        String user_login = req.getParameter("user_login");
        String user_password=req.getParameter("user_password");
        String user_name=req.getParameter("user_name");
        Ajax_packAndSend.pack("user_name",user_name);
        Ajax_packAndSend.pack("user_login",user_login);
        Ajax_packAndSend.pack("user_password",user_password);
        System.out.println(Ajax_packAndSend.str.toString());
        Ajax_packAndSend.send(resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}