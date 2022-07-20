
package com.tech.blog.Dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getCategory(){
        ArrayList<Category> list = new ArrayList<>();
        
        try{
            String q = "select * from categories";
            Statement stmt = con.createStatement();
            ResultSet st = stmt.executeQuery(q);
            
            while(st.next()){
                int cid = st.getInt("cid");
                String name = st.getString("name");
                String des = st.getString("description");
                
                Category c = new Category(cid,name,des);
                
                list.add(c);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }


    public boolean savePost(Post p){
        boolean f = false;
        
        try{
            String q = "insert into posts(pTitle,pContent,userId) values(?,?,?)";
            PreparedStatement psmt = con.prepareStatement(q);
            
            psmt.setString(1,p.getpTitle());
            psmt.setString(2,p.getpContent());
            psmt.setInt(3,p.getUserId());
            psmt.executeUpdate();
            
            f = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    public List<Post> getAllPosts(){
        List<Post> list = new ArrayList<>();
        try{
            String q = "select * from posts";
            PreparedStatement psmt = con.prepareStatement(q);
            
            ResultSet set = psmt.executeQuery();
            
            while(set.next()){
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                int pid = set.getInt("pid");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                Post post = new Post(pTitle,pContent,date,userId);
                
                list.add(post);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
