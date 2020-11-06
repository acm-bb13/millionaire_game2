package millionaire_game.javabean;

import java.util.Date;

public class Store {
    private Integer id;
    private String name;
    private String url;
    private Integer one_buy_gold;
    private String comment;


    public Store(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Store() {
    }

    public Store(Integer id, String name, String url, Integer one_buy_gold) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.one_buy_gold=one_buy_gold;
    }
    public Store(Integer id, String name, String url, Integer one_buy_gold,String comment) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.one_buy_gold=one_buy_gold;
        this.comment=comment;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getCharge() {
        return one_buy_gold;
    }

    public void setCharge(Integer charge) { this.one_buy_gold = charge; }

    public String getComment()  {return comment;}

    public void setComment(String comment) {this.comment = comment;}
}
