package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dataBase.Connect;

import entity.Admin;
import entity.Book1;

public class AdminDao {

   public ArrayList<Admin> getAllAdminuser(){
	   Connection con=null;
	   PreparedStatement stmt=null;
	   ResultSet rs=null;
	   ArrayList<Admin> admin=new ArrayList<Admin>();
	   try{
		   con=Connect.getConnection();
		   String sql="select * from admin";
		   stmt=con.prepareStatement(sql);
		   rs=stmt.executeQuery();
		   while(rs.next()){
			   Admin ad=new Admin();
			   ad.setId(rs.getInt("id"));
			   ad.setName(rs.getString("name"));
			   ad.setUsername(rs.getString("username"));
			   ad.setPassword(rs.getString("password"));
			   ad.setRegtime(rs.getString("regtime"));
			   admin.add(ad);
		   }
		   return admin;
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
		public Admin getAdminById(int id) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = Connect.getConnection();
				String sql = "select * from admin where id=?;"; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				if (rs.next()) {
					Admin admin = new Admin();
					admin.setId(rs.getInt("id"));
					admin.setName(rs.getString("name"));
					admin.setUsername(rs.getString("username"));
					admin.setPassword(rs.getString("password"));
					admin.setRegtime(rs.getString("regtime"));
					return admin;
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
