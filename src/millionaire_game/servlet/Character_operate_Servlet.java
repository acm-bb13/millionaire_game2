package millionaire_game.servlet;


import com.alibaba.fastjson.JSONArray;
import millionaire_game.Game.Game_Grid;
import millionaire_game.dao.Character_Operate_Dao;
import millionaire_game.javabean.Character_Message_bean;
import millionaire_game.javabean.Register_Message_bean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/Character_operate_Servlet")
public class Character_operate_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        防止乱码

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

//        获取请求，打包地址
        String request =req.getParameter("request");
        System.out.println(request);
        Ajax_packAndSend.pack("servlet", req.getParameter("servlet"));

        if("getCharacterMessage".equals(request)){
            List<Character_Message_bean> cm = Character_Operate_Dao.getCharacter_Message(
                    Register_Message_bean.getRegister_messageBean().getUser_login());
            Ajax_packAndSend.pack("List",JSONArray.toJSONString(cm));

        }else if("create_character".equals(request)){
            Timestamp d = new Timestamp(System.currentTimeMillis());
            Game_Grid.ReflushGrids();
            Character_Message_bean cmb=new Character_Message_bean(
                    1,
                    req.getParameter("inputName"),
                    10,
                    20,
                    50,
                    100,
                    d.toString(),
                    d.toString(),
                    Game_Grid.GridsToString(),
                    1,
                    Register_Message_bean.getRegister_messageBean().getUser_login()
            );
            Character_Operate_Dao.addDate(cmb);
            List<Character_Message_bean> cm = Character_Operate_Dao.getCharacter_Message(
                    Register_Message_bean.getRegister_messageBean().getUser_login());
            for(int i=0; i<cm.size();i++){
                System.out.println("id:"+cm.get(i).getId());
            }
            Ajax_packAndSend.pack("List",JSONArray.toJSONString(cm));

        }else if("deleteMessage".equals(request)){
            Character_Operate_Dao.deleteDate(Integer.valueOf(req.getParameter("id")));
            List<Character_Message_bean> cm = Character_Operate_Dao.getCharacter_Message(
                    Register_Message_bean.getRegister_messageBean().getUser_login());
            Ajax_packAndSend.pack("List",JSONArray.toJSONString(cm));
        }else if("select".equals(request)){
            Character_Message_bean.index=Integer.valueOf(req.getParameter("id"));
        }

        Ajax_packAndSend.pack("request",request);
        Ajax_packAndSend.send(resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
