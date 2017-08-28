package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dataBase.Connect;

import entity.Address;
import entity.Book1;
import entity.Indent;
import entity.Message;

public class IndentDao {
	//根据用户姓名获取地址
	public Indent getIndentById(String id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = Connect.getConnection();
			String sql = "select * from indent where id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Indent u=new Indent(); 
				u.setId(rs.getLong("id"));
				u.setProduct(rs.getString("product"));
				u.setAddress(rs.getString("address"));
				u.setNum(rs.getInt("num"));
				u.setPhone(rs.getString("phone"));
				u.setSettime(rs.getString("settime"));
				u.setUsername(rs.getString("username"));
				u.setPaystate(rs.getString("paystate"));
				u.setSetstate(rs.getString("setstate"));
				return u;
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
