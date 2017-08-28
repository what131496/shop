package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dataBase.Connect;
import entity.Liuyan;

public class LiuyanDao {
	public ArrayList<Liuyan> getAllLiuyan(){
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Liuyan> list=new ArrayList<Liuyan>();
		try{
			con=Connect.getConnection();
			String sql="select * from message order by id desc";
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				Liuyan inform=new Liuyan();
				inform.setId(rs.getInt("id"));
				inform.setName(rs.getString("name"));
				inform.setEmail(rs.getString("email"));
				inform.setContent(rs.getString("content"));
				inform.setTime(rs.getString("time"));
				list.add(inform);
			}
			return list;
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
	

}
