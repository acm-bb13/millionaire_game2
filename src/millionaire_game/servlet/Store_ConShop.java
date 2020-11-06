package millionaire_game.servlet;

import com.alibaba.fastjson.JSONArray;
import millionaire_game.dao.StoreDao;
import millionaire_game.javabean.Store;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/Store_ConShop")
public class Store_ConShop extends HttpServlet {

    //获取对象
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StoreDao storeDao = new StoreDao();
        Integer id = Integer.valueOf(req.getParameter("id"));

        resp.setCharacterEncoding("UTF-8");
        List<Store> conList = storeDao.qureItem(id);
        PrintWriter out = resp.getWriter();

        out.print(JSONArray.toJSONString(conList));
        System.out.println(JSONArray.toJSONString(conList));
    }
}

