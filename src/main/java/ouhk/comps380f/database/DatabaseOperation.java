package ouhk.comps380f.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Map;
import ouhk.comps380f.model.Comment;

public class DatabaseOperation {
    private DriverManager dataSource;
    private Connection conn = connectToDatabase("jdbc:derby://localhost:1527/custsupport");
    
    public Connection connectToDatabase(String url) {
        try {
            conn = dataSource.getConnection(url, "nbuser", "nbuser");
        }catch (SQLException e) {
            System.out.println(e);
        }
        return conn;
    }
    
    public Map<String, Comment> getCommentList(long targetItemId) {
        Map<String, Comment> commentDatabase = new Hashtable<>();
        
        try {
            String sql = "SELECT * FROM comments where itemId=?";
            
            PreparedStatement pstat = conn.prepareStatement(sql);
            pstat.setString(1, Long.toString(targetItemId));
            ResultSet resultSet = pstat.executeQuery();
            
            while (resultSet.next()) {
                String userName = resultSet.getString("userName");
                String itemId = resultSet.getString("itemId");
                String commentId = resultSet.getString("commentId");
                String contents = resultSet.getString("contents");
                System.out.println(userName);
                
                Comment comment = new Comment();
                //comment.setCommentId(commentId);
                comment.setUserName(userName);
                comment.setContents(contents);
                //comment.setItemId(itemId);
                
                commentDatabase.put(commentId, comment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return commentDatabase;
    }
    
    public void addComment(Comment comment) {
        //String commentId = comment.getCommentId();
        String userName = comment.getUserName();
        String contents = comment.getContents();
        //String itemId = comment.getItemId();

        try {
            String sql = "INSERT INTO comments(commentId, itemId, userName, contents) VALUES (?, ?, ?, ?)";
            PreparedStatement pstat = conn.prepareStatement(sql);
            //pstat.setString(1, commentId);
            //pstat.setString(2, itemId);
            pstat.setString(3, userName);
            pstat.setString(4, contents);
            pstat.executeUpdate();
            System.out.println(userName);

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
}
