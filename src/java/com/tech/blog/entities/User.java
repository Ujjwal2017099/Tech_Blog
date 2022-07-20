
package com.tech.blog.entities;
import java.sql.*;
public class User {
    private int id;
    private String name;
    private String password;
    private String email;
    private Timestamp datetime;

    public User(int id, String name, String password, String email, Timestamp datetime) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.datetime = datetime;
    }

    public User() {
    }

    public User(String name, String password, String email) {
        this.name = name;
        this.password = password;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }
    
    
}
