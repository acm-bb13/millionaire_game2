package millionaire_game.servlet;

import com.alibaba.fastjson.JSONArray;
import millionaire_game.Game.Game_Grid;
import millionaire_game.Game.Game_Main_Drive;
import millionaire_game.dao.Character_Operate_Dao;
import millionaire_game.javabean.Character_Message_bean;
import millionaire_game.javabean.Register_Message_bean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/Game_Play_Servlet")
public class Game_Play_Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

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
        Ajax_packAndSend.pack("request",request);
        System.out.println("Game_Play_Servlet");
//        Character_Message_bean.index
        if("getTest".equals(request)){
            Character_Message_bean cmb= Character_Operate_Dao.getCharacter_Message_Index(
                    Character_Message_bean.index
            );
            System.out.println("index:"+Character_Message_bean.index);
            System.out.println("back_name:"+cmb.getName());
            Ajax_packAndSend.pack("back_name",cmb.getName());
        }

        if("getMessage".equals(request)||"getMessa".equals(request)){
            List<Character_Message_bean> list = new ArrayList();

            list.add(Character_Operate_Dao.getCharacter_Message_Index(
                    Character_Message_bean.index
            ));
            Game_Grid.readGrids(list.get(0).getRecord());
            Ajax_packAndSend.pack("List", JSONArray.toJSONString(list));
        }

        if("Start_Luck".equals(request)){
            Integer luck_number= (int) (Math.random()*6.0+1.0);
            Ajax_packAndSend.pack("luck_number",luck_number);
            Character_Message_bean cmb = Character_Message_bean.getCM();
            Timestamp d = new Timestamp(System.currentTimeMillis());
            cmb.setDate_loaded(d.toString());
            int x,y;
            int grids = luck_number+Game_Main_Drive.getHeroLocaton(cmb.getMap_x(),cmb.getMap_y());
            while (grids>50)grids-=50;
            x= Game_Main_Drive.getLocation[grids][0];
            y = Game_Main_Drive.getLocation[grids][1];
            cmb.setMap_x(x);
            cmb.setMap_y(y);
            Game_Grid.GridElement(Game_Grid.grids[grids]);
            Character_Message_bean.pushCM();

            List<Character_Message_bean> list = new ArrayList();

            list.add(Character_Operate_Dao.getCharacter_Message_Index(
                    Character_Message_bean.index
            ));
            Ajax_packAndSend.pack("List", JSONArray.toJSONString(list));
        }

        if("Start_Luck_Control".equals(request)){

            Integer luck_number=Integer.valueOf(req.getParameter("luck_number"));
            Ajax_packAndSend.pack("luck_number",luck_number);
            Character_Message_bean cmb = Character_Message_bean.getCM();
            Timestamp d = new Timestamp(System.currentTimeMillis());
            cmb.setDate_loaded(d.toString());
            int x,y;
            int grids = luck_number+Game_Main_Drive.getHeroLocaton(cmb.getMap_x(),cmb.getMap_y());
            while (grids>50)grids-=50;
            x= Game_Main_Drive.getLocation[grids][0];
            y = Game_Main_Drive.getLocation[grids][1];
            cmb.setMap_x(x);
            cmb.setMap_y(y);
            Game_Grid.GridElement(Game_Grid.grids[grids]);
            Character_Message_bean.pushCM();
            List<Character_Message_bean> list = new ArrayList();
            list.add(Character_Operate_Dao.getCharacter_Message_Index(
                    Character_Message_bean.index
            ));
            Ajax_packAndSend.pack("List", JSONArray.toJSONString(list));

        }


        if("Save_Date".equals(request)){

        }

        if("health".equals(request)&&Register_Message_bean.getRegister_messageBean().isIs_admin()){
            Character_Message_bean cmb = Character_Message_bean.getCM();
            if("healthUP".equals(req.getParameter("healthOP"))){
                cmb.setHealth(cmb.getHealth()+1);
                Character_Message_bean.pushCM();
                List<Character_Message_bean> list = new ArrayList();
                list.add(Character_Operate_Dao.getCharacter_Message_Index(
                        Character_Message_bean.index
                ));
                Ajax_packAndSend.pack("List", JSONArray.toJSONString(list));
                Game_Grid.GridElement("");
            }else {
                cmb.setHealth(cmb.getHealth()-1);
                Character_Message_bean.pushCM();
                List<Character_Message_bean> list = new ArrayList();
                list.add(Character_Operate_Dao.getCharacter_Message_Index(
                        Character_Message_bean.index
                ));
                Ajax_packAndSend.pack("List", JSONArray.toJSONString(list));
                Game_Grid.GridElement("");
            }
        }

        if("Gold".equals(request)&&Register_Message_bean.getRegister_messageBean().isIs_admin()){
            Character_Message_bean cmb = Character_Message_bean.getCM();
            if("GoldUP".equals(req.getParameter("GoldOP"))){
                cmb.setGold(cmb.getGold()+1);
                Character_Message_bean.pushCM();
                List<Character_Message_bean> list = new ArrayList();
                list.add(Character_Operate_Dao.getCharacter_Message_Index(
                        Character_Message_bean.index
                ));
                Ajax_packAndSend.pack("List", JSONArray.toJSONString(list));
                Game_Grid.GridElement("");
            }else {
                cmb.setGold(cmb.getGold()-1);
                Character_Message_bean.pushCM();
                List<Character_Message_bean> list = new ArrayList();
                list.add(Character_Operate_Dao.getCharacter_Message_Index(
                        Character_Message_bean.index
                ));
                Ajax_packAndSend.pack("List", JSONArray.toJSONString(list));
                Game_Grid.GridElement("");
            }
        }



        Ajax_packAndSend.send(resp);
    }
}
