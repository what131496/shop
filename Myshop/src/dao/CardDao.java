package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dataBase.Connect;
import entity.Address;
import entity.Card;

public class CardDao {

	public ArrayList<Card> getAllCard(){
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Card> list=new ArrayList<Card>();
		try{
			con=Connect.getConnection();
			String sql="select * from card";
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				Card card=new Card(); 
				card.setUsername(rs.getString("username"));
				card.setCard(rs.getString("card"));
				card.setCardNumber(rs.getLong("cardNumber"));
				card.setIDNumber(rs.getLong("IDnumber"));
				card.setCphone(rs.getLong("Cphone"));
				card.setCardPasswod(rs.getLong("cardPassword"));
				list.add(card);//商品加入集合中
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
}
