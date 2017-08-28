package dao;

import java.sql.*;
import java.util.ArrayList;

import dataBase.Connect;

import entity.Book1;

//商品的业务逻辑类
public class BookNameDao {
	
	// 根据商品名称获得商品资料
		public Book1 getBookByName(String name) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = Connect.getConnection();
				String sql = "select * from book1 where bookName=?;"; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				rs = stmt.executeQuery();
				if (rs.next()) {
					Book1 book = new Book1();
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
