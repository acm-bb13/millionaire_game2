package millionaire_game.servlet;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//这个类用于打包和发送数据回客户端
public class Ajax_packAndSend {
    static StringBuffer str=new StringBuffer();
    public static void pack(String key,String value){
        if(!"".equals(str.toString())){
            str.append("&");
        }
        str.append(key+"="+value);
    }
    public static void pack(String key,Object value){
        if(!"".equals(str.toString())){
            str.append("&");
        }
        str.append(key+"="+String.valueOf(value));
    }
    public static void send(HttpServletResponse resp){
        PrintWriter out = null;
        try {
            out = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        out.write(str.toString());
        str=new StringBuffer();
    }
}
