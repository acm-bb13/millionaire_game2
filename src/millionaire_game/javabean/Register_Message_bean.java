package millionaire_game.javabean;

import millionaire_game.dao.Login_Dao;
import millionaire_game.dao.Register_upadte_Dao;

import java.sql.Timestamp;

//该类为单类，一次只能有一个帐号登录
public class Register_Message_bean {
    static Register_Message_bean register_messageBean =null;

    private String user_login;
    private String user_name;
    private Boolean is_admin;
    private Integer user_gold;
    private Integer experience;
    private String user_password;

//    创建新信息
//    public Register_Message_bean(String user_login, String user_name, boolean is_admin, int user_gold, int experience , String user_password) {
//        this.user_login = user_login;
//        this.user_name = user_name;
//        this.is_admin = is_admin;
//        this.user_gold = user_gold;
//        this.experience = experience;
//        this.user_password = user_password;
//    }

    //    创建新信息
    public Register_Message_bean(String user_login, String user_name, Boolean is_admin, Integer user_gold, Integer experience, String user_password) {
        this.user_login = user_login;
        this.user_name = user_name;
        this.is_admin = is_admin;
        this.user_gold = user_gold;
        this.experience = experience;
        this.user_password = user_password;
        Timestamp d = new Timestamp(System.currentTimeMillis());
        System.out.println("=====================================");
        System.out.println(d.toString()+"<用户>:"+user_name+"已登录");
        System.out.println("=====================================");
    }

    //    获取当前已登录的信息，如果未登录，则会返回null;
    public static Register_Message_bean getRegister_messageBean() {
        return register_messageBean;
    }

//    加载登录信息，并产生登录对象
    public static void login_Register(String user_login){
        register_messageBean = Login_Dao.login_Reigister(user_login);
    }

//    注销登录信息
    public static void exit_login(){
        if(register_messageBean != null){

            register_messageBean = null;
        }
    }

//    将修改后的数据存入数据库中，只可以修改部分数据
    public static void pushDate(){
        if(register_messageBean != null){
            Register_upadte_Dao.pushDate(register_messageBean);
        }
    }

//    get和set方法，这个并没有对数据库操作

    public String getUser_login() {
        return user_login;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public boolean isIs_admin() {
        return is_admin;
    }

    public void setIs_admin(Boolean is_admin) {
        this.is_admin = is_admin;
    }

    public int getUser_gold() {
        return user_gold;
    }

    public void setUser_gold(Integer user_gold) {
        this.user_gold = user_gold;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }
}
