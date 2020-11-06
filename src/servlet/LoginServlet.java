package servlet;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/Submit")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String userName = req.getParameter("userName");
        String passWord = req.getParameter("passWord");
        if("admin".equals(userName) && "123456".equals(passWord)){
            resp.sendRedirect("success.jsp");
        }else {
            if(!userName.equals("admin") )
               req.setAttribute("u_err","用户名错误");
            else req.setAttribute("u_err","");
            if(!passWord.equals("123456") )
                req.setAttribute("p_err","密码错误");
            else req.setAttribute("p_err", "");
//
            req.getRequestDispatcher("index.jsp").forward(req,resp);

//            重定向
//            resp.sendRedirect("index.jsp");
            System.out.println("test");
        }
//        req.getRequestDispatcher("").forward();
//        PrintWriter out= resp.getWriter();
//        ((PrintWriter)out).print(req.getParameter("password")+" "+req.getParameter("sex")+" "+req.getParameter("sleep"));
    }
}
