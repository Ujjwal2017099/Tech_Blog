/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;

/**
 * @author Ujjwal
 */
public class ConnectionProvider {

    private static Connection con;
    private static boolean f = false;

    public static Connection getConnection() {

        if (f == false) {
            try {

                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/techblog";
                String user = "root";
                String pass = "ujjwal1234";
                con = DriverManager.getConnection(url, user, pass);

            } catch (Exception e) {
                e.getStackTrace();
            }
            f = true;
        }
        return con;
    }
}
