package com.test;

import java.util.Date;

public class javabean {
    private Integer id;
    private String title;
    private String content;
    private Date createTime;
    private String userName;


    public javabean(Integer id, String title, String content, Date createTime, String userName) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createTime = createTime;
        this.userName = userName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


}
