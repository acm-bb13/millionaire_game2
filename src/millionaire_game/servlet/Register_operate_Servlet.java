package millionaire_game.servlet;

import com.alibaba.fastjson.JSONArray;
import millionaire_game.dao.Character_Record_OP_Dao;
import millionaire_game.javabean.Character_Message_bean;
import millionaire_game.javabean.Character_Record_bean;
import millionaire_game.javabean.Register_Message_bean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/Register_operate_Servlet")
public class Register_operate_Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        设置文档为UTF-8，防止乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String request =req.getParameter("request");

        Ajax_packAndSend.pack("servlet", req.getParameter("servlet"));
        Register_Message_bean rmb = Register_Message_bean.getRegister_messageBean();
        if(rmb != null){
            Ajax_packAndSend.pack("is_login","true");
            if("allMessage".equals(request)){
                Ajax_packAndSend.pack("user_login",rmb.getUser_login());
                Ajax_packAndSend.pack("user_name",rmb.getUser_name());
                Ajax_packAndSend.pack("user_gold",rmb.getUser_gold());
                Ajax_packAndSend.pack("experience",rmb.getExperience());
                Ajax_packAndSend.pack("is_admin",rmb.isIs_admin());
                List list = Character_Record_OP_Dao.get();
                Ajax_packAndSend.pack("list", JSONArray.toJSONString(list));
            }else if("is_login_Message".equals(request)){
//                请求帐号是否为登录状态

            }else if("UpDate".equals(request)){
                Timestamp dd = new Timestamp(System.currentTimeMillis());
                System.out.println("=====================================");
                System.out.println(dd.toString()+"<用户>:"+ Register_Message_bean.getRegister_messageBean().getUser_name()+"请求更改账户信息中....");
                System.out.println("=====================================");
                String  user_name=req.getParameter("user_name");
                String pass_word =req.getParameter("pass_word");
                String admin_password =req.getParameter("admin_password");
//                请求更改账户信息
                if("测试指令".equals(admin_password)){
                    rmb.setIs_admin(true);
                    Ajax_packAndSend.pack("admin_password","true");
                }
                if(admin_password != null && !"".equals(admin_password)){
                    Ajax_packAndSend.pack("admin_password","false");
                }
                if( user_name != null && !"".equals(user_name)){
                    rmb.setUser_name(user_name);
                }
                if(pass_word != null  && !"".equals(pass_word)){
                    rmb.setUser_password(pass_word);
                }


                Register_Message_bean.pushDate();

                Ajax_packAndSend.pack("user_login",rmb.getUser_login());
                Ajax_packAndSend.pack("user_name",rmb.getUser_name());
                Ajax_packAndSend.pack("user_gold",rmb.getUser_gold());
                Ajax_packAndSend.pack("experience",rmb.getExperience());
                Ajax_packAndSend.pack("is_admin",rmb.isIs_admin());
            }else if("register_exit".equals(request)){
//              请求账号登出
                Register_Message_bean.exit_login();

            }
        }else {
            Ajax_packAndSend.pack("is_login","false");
        }
        Ajax_packAndSend.pack("request",request);
        Ajax_packAndSend.send(resp);
//        resp.sendRedirect("Register_login.jsp");
    }
}
