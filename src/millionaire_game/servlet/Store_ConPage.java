package millionaire_game.servlet;

import com.alibaba.fastjson.JSONArray;
import millionaire_game.javabean.Store;
import millionaire_game.dao.StoreDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/Store_ConPage")
public class Store_ConPage extends HttpServlet {

    //获取对象
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        StoreDao storeDao = new StoreDao();
        Integer pageIndex = Integer.valueOf(req.getParameter("pageIndex"));
        Integer pageNum = storeDao.queryNumber(req.getParameter("searchText"));
        if(pageIndex<0){
            pageIndex=0;
        }else if(pageIndex>storeDao.queryNumber(req.getParameter("searchText"))){
            pageIndex=(pageNum-1)/3*3;
        }
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(JSONArray.toJSONString(pageIndex));
        System.out.println(JSONArray.toJSONString(pageIndex));
    }
}
