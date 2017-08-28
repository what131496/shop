package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dataBase.Connect;

import entity.Users;

public class UsersDao {

   public ArrayList<Users> getAllUsers(){
	   Connection con=null;
	   PreparedStatement stmt=null;
	   ResultSet rs=null;
	   ArrayList<Users> user=new ArrayList<Users>();
	   try{
		   con=Connect.getConnection();
		   String sql="select * from users";
		   stmt=con.prepareStatement(sql);
		   rs=stmt.executeQuery();
		   while(rs.next()){
			   Users ad=new Users();
			   ad.setId(rs.getInt("id"));
			   ad.setUsername(rs.getString("username"));
			   ad.setPassword(rs.getString("password"));
			   ad.setEmail(rs.getString("email"));
			   ad.setRegtime(rs.getString("regtime"));
			   user.add(ad);
		   }
		   return user;
	   }catch(Exception e){
		   e.printStackTrace();
		   return null;
	   }finally{
			if(rs!=null){
				try {
					rs.close();
					rs=null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(stmt!=null){
					try {
						stmt.close();
						stmt=null;
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
   }
// 根据管理员编号获得资料
		public Users getUsersById(int id) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = Connect.getConnection();
				String sql = "select * from users where id=?;"; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				if (rs.next()) {
					Users user = new Users();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setEmail(rs.getString("email"));
					user.setRegtime(rs.getString("regtime"));
					return user;
				} else {
					return null;
				}

			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} finally {
				// 释放数据集对象
				if (rs != null) {
					try {
						rs.close();
						rs = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				// 释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}

			}
		}
}
