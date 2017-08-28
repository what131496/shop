package page;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dataBase.Connect;
import entity.Admin;
import entity.Message;
import entity.Users;

public class MessagePage {
	private int curPage = 1; //当前是第几页
    private int maxPage; //一共有多少页
    private int maxRowCount; //一共有多少行
    public int rowsPerPage = 4; //每页多少行
    public ArrayList data;
    public MessagePage() throws Exception {
        this.setUserPage();
    }
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getMaxRowCount() {
		return maxRowCount;
	}
	public void setMaxRowCount(int maxRowCount) {
		this.maxRowCount = maxRowCount;
	}
	public int getRowsPerPage() {
		return rowsPerPage;
	}
	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}
	/*得到显示本页的数据*/
	public MessagePage getResult(String pages) throws Exception{
		try{
			MessagePage page=new MessagePage();
			ArrayList list=new ArrayList();
			int pageNum=Integer.parseInt(pages.trim());
			int fromIndex=(pageNum-1)*this.getRowsPerPage();
			Connection con=Connect.getConnection();
			Statement stmt=con.createStatement();
			String sql="select * from  message order by id desc limit " + fromIndex+","+this.getRowsPerPage();
			ResultSet rs = stmt.executeQuery(sql);
			int i=0;
			while(rs.next()){
				Message u=new Message();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setTime(rs.getString("time"));
				u.setPnone(rs.getString("phone"));
				u.setContent(rs.getString("content"));
				u.setEmail(rs.getString("email"));
				list.add(u);
				i++;
			}
            page.setCurPage((pageNum));
            page.data=list;
            return page;
		}catch(Exception e){
			 e.printStackTrace();
	         throw e;
		}
	}
	/*获取总行数*/
	public int getAllRows() throws Exception{
		int ret=0;
		Connection con=Connect.getConnection();
		 Statement stmt = con.createStatement();
	        String strSql = "select * from message";
	        ResultSet rset = stmt.executeQuery(strSql);
	        while (rset.next()) {
	            ret++;
	        }
	        return ret;
	}
	//初始化时对page进行设置
	public void setUserPage() throws Exception{
		//得到总行数
		this.setMaxRowCount(this.getAllRows());
		if(this.maxRowCount % this.rowsPerPage==0){//根据总行数计算总页数
			this.maxPage=(this.maxRowCount / this.rowsPerPage);
		}else{
			this.maxPage=(this.maxRowCount / this.rowsPerPage+1);
		}
	}

}
