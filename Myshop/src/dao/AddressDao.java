package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dataBase.Connect;

import entity.Address;
import entity.Book1;

public class AddressDao {
//获得收货地址信息
	public ArrayList<Address> getAllAddress(){
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Address> list=new ArrayList<Address>();
		try{
			con=Connect.getConnection();
			String sql="select * from address order by id desc";
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				Address address=new Address(); 
				address.setUsername(rs.getString("username"));
				address.setName(rs.getString("name"));
				address.setArea(rs.getString("area"));
				address.setAddress(rs.getString("address"));
				address.setPhone(rs.getInt("phone"));
				address.setFixPhone(rs.getInt("fixPhone"));
				address.setaEmail(rs.getString("aEmail"));
				list.add(address);//商品加入集合中
			}
			return list;//返回集合
		}catch(Exception ed){
			ed.printStackTrace();
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
	//根据用户姓名获取地址
	public Address getBookByName(String name) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = Connect.getConnection();
			String sql = "select * from address where username=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Address address=new Address(); 
				address.setUsername(rs.getString("username"));
				address.setName(rs.getString("name"));
				address.setArea(rs.getString("area"));
				address.setAddress(rs.getString("address"));
				address.setPhone(rs.getLong("phone"));
				address.setFixPhone(rs.getLong("fixPhone"));
				address.setaEmail(rs.getString("aEmail"));
				return address;
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
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
