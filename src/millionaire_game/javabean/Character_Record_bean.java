package millionaire_game.javabean;

public class Character_Record_bean {
    private Integer id;
    private String name;
    private String date_time;
    private Boolean is_win;

    public Character_Record_bean(Integer id, String name, String date_time, Boolean is_win) {
        this.id = id;
        this.name = name;
        this.date_time = date_time;
        this.is_win = is_win;
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

    public String getDate_time() {
        return date_time;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }

    public Boolean getIs_win() {
        return is_win;
    }

    public void setIs_win(Boolean is_win) {
        this.is_win = is_win;
    }
}
