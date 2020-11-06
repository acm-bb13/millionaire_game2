package millionaire_game.javabean;

import millionaire_game.dao.Character_Operate_Dao;

import java.sql.Timestamp;
import java.sql.Date;

public class Character_Message_bean {
    private Integer id;
    private String name;
    private Integer health;
    private Integer gold;
    private Integer map_x;
    private Integer map_y;
    private String date_create;
    private String date_loaded;
    private String record;
    private Integer kind;
    private String user_login;
    public static Integer index = null;

    public static Character_Message_bean cm = null;

    public static Character_Message_bean getCM(){
        if(cm == null){
            cm = Character_Operate_Dao.getCharacter_Message_Index(
                    Character_Message_bean.index
            );
        }
        return cm;
    }
    public static void pushCM(){
        Character_Operate_Dao.updateDate(cm);
    }

    public static void exitCM(){
        cm = null;
    }

    public Character_Message_bean(Integer id,String name, Integer health, Integer gold, Integer map_x, Integer map_y, String date_create, String date_loaded, String record, Integer kind, String user_login) {
        setId(id);
        this.name = name;
        this.health = health;
        this.gold = gold;
        this.map_x = map_x;
        this.map_y = map_y;
        this.date_create = date_create;
        this.date_loaded = date_loaded;
        this.record = record;
        this.kind = kind;
        this.user_login = user_login;
    }

    public void pushDate(){

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getHealth() {
        return health;
    }

    public void setHealth(Integer health) {
        this.health = health;
        if(this.health > 10){
            this.health =10;
        }
    }

    public Integer getGold() {
        return gold;
    }

    public void setGold(Integer gold) {
        this.gold = gold;
    }

    public Integer getMap_x() {
        return map_x;
    }

    public void setMap_x(Integer map_x) {
        this.map_x = map_x;
    }

    public Integer getMap_y() {
        return map_y;
    }

    public void setMap_y(Integer map_y) {
        this.map_y = map_y;
    }

    public String getDate_create() {
        return date_create;
    }

    public void setDate_create(String date_create) {
        this.date_create = date_create;
    }

    public String getDate_loaded() {
        return date_loaded;
    }

    public void setDate_loaded(String date_loaded) {
        this.date_loaded = date_loaded;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public Integer getKind() {
        return kind;
    }

    public void setKind(Integer kind) {
        this.kind = kind;
    }

    public String getUser_login() {
        return user_login;
    }

    public void setUser_login(String user_login) {
        this.user_login = user_login;
    }
}
