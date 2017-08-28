package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dataBase.Connect;

import entity.Address;
import entity.Book1;
import entity.Message;

public class MessageDao {
	//�����û�������ȡ��ַ
	public Message getMessageById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = Connect.getConnection();
			String sql = "select * from message where id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Message address=new Message(); 
				address.setName(rs.getString("name"));
				address.setTime(rs.getString("time"));
				address.setPnone(rs.getString("phone"));
				address.setEmail(rs.getString("email"));
				address.setContent(rs.getString("content"));
				return address;
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
