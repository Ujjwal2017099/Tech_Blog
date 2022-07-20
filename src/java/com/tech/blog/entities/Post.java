
package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
    private int pid;
    private String pTitle;
    private String pContent;
    
    private Timestamp pdate;
    private int userId;
    public Post() {
    }

    public Post(int pid, String pTitle, String pContent, Timestamp pdate,int userid) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pdate = pdate;
        this.userId = userid;
    }

    public Post(String pTitle, String pContent, Timestamp pdate,int userid) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pdate = pdate;
        this.userId = userid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }


    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
}
