package dao;

import java.sql.*;
import java.util.ArrayList;

import dataBase.Connect;

import entity.Book2;
import entity.Book3;

//商品的业务逻辑类
public class Book3Dao {
//  获得所有商品信息
	public ArrayList<Book3> getAllbook(){
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Book3> list=new ArrayList<Book3>();
		try{
			con=Connect.getConnection();
			String sql="select * from book3";
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				Book3 book=new Book3(); 
				book.setId(rs.getInt("id"));
				book.setPicture(rs.getString("picture"));
				book.setBookName(rs.getString("bookName"));
				book.setAuthor(rs.getString("author"));
				book.setCurrentPrice(rs.getLong("currentPrice"));
				book.setRealPrice(rs.getLong("realPrice"));
				book.setPublisher(rs.getString("publisher"));
				book.setISBN(rs.getString("ISBN"));
				book.setPublishDate(rs.getString("publishDate"));
				book.setPages(rs.getInt("pages"));
				book.setBigPicture(rs.getString("bigPicture"));
				book.setContent(rs.getString("content"));
				book.setAuthorin(rs.getString("author-in"));
				book.setReset(rs.getInt("rest"));
				list.add(book);//商品加入集合中
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
	// 根据商品编号获得商品资料
		public Book3 getBookById(int id) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = Connect.getConnection();
				String sql = "select * from book3 where id=?;"; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				if (rs.next()) {
					Book3 book = new Book3();
					book.setId(rs.getInt("id"));
					book.setPicture(rs.getString("picture"));
					book.setBookName(rs.getString("bookName"));
					book.setAuthor(rs.getString("author"));
					book.setCurrentPrice(rs.getLong("currentPrice"));
					book.setRealPrice(rs.getLong("realPrice"));
					book.setPublisher(rs.getString("publisher"));
					book.setISBN(rs.getString("ISBN"));
					book.setPublishDate(rs.getString("publishDate"));
					book.setPages(rs.getInt("pages"));
					book.setBigPicture(rs.getString("bigPicture"));
					book.setContent(rs.getString("content"));
					book.setAuthorin(rs.getString("author-in"));
					book.setReset(rs.getInt("rest"));
					return book;
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
