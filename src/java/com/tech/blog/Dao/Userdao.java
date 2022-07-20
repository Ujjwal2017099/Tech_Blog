
package com.tech.blog.Dao;
import com.tech.blog.entities.User;
import static java.lang.System.out;
import java.sql.*;
public class Userdao {
    private Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }
    
    public boolean saveUser(User user){
        boolean f = false;
        try{
            String q = "insert into user(name,email,password) values(?,?,?)";
            PreparedStatement psmt = this.con.prepareStatement(q);
            psmt.setString(1,user.getName());
            psmt.setString(2,user.getEmail());
            psmt.setString(3, user.getPassword());
            
            psmt.executeUpdate();
            
            f = true;
        }catch(Exception e){
            e.getStackTrace();
            out.println(e.getMessage());
        }
        
        return f;
    }

    public User getUserByEmailAndPassword(String email,String password){
        User user = null;
        try{
            String q = "select * from user where email=? and password=?";
            PreparedStatement psmt = con.prepareStatement(q);
            
            psmt.setString(1, email);
            psmt.setString(2, password);
            
            ResultSet set = psmt.executeQuery();
            
            if(set.next()){
                user = new User();
                String name = set.getString("name");
                String Email = set.getString("email");
                int id = set.getInt("id");
                
                user.setEmail(Email);
                user.setName(name);
                user.setId(id);
            }
        }
        catch(Exception e){
            e.getStackTrace();
        }
        
        return user;
    }
}
