package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dataBase.Connect;

import entity.Salable;

//畅销榜的逻辑类
public class SalableDao {
//获取salary 畅销榜数据库的所有信息
	public ArrayList<Salable> getAllSalable(){
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		ArrayList<Salable> list=new ArrayList<Salable>();
		try{
			con=Connect.getConnection();
			String sql="select * from salable";
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				Salable sla=new Salable();
				sla.setId(rs.getInt("id"));
				sla.setContent(rs.getString("content"));
				sla.setTime(rs.getString("time"));
				list.add(sla);
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
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
