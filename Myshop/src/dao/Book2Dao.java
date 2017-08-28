package dao;

import java.sql.*;
import java.util.ArrayList;

import dataBase.Connect;

import entity.Book2;

//��Ʒ��ҵ���߼���
public class Book2Dao {
//  ���������Ʒ��Ϣ
	public ArrayList<Book2> getAllbook(){
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Book2> list=new ArrayList<Book2>();
		try{
			con=Connect.getConnection();
			String sql="select * from book2";
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				Book2 book=new Book2(); 
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
				list.add(book);//��Ʒ���뼯����
			}
			return list;//���ؼ���
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
	// ������Ʒ��Ż����Ʒ����
		public Book2 getBookById(int id) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = Connect.getConnection();
				String sql = "select * from book2 where id=?;"; // SQL���
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				if (rs.next()) {
					Book2 book = new Book2();
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
				// �ͷ����ݼ�����
				if (rs != null) {
					try {
						rs.close();
						rs = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				// �ͷ�������
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
