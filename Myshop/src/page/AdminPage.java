package page;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dataBase.Connect;
import entity.Admin;

public class AdminPage {

	private int curPage = 1; //��ǰ�ǵڼ�ҳ
    private int maxPage; //һ���ж���ҳ
    private int maxRowCount; //һ���ж�����
    public int rowsPerPage = 6; //ÿҳ������
    public ArrayList data;
    public AdminPage() throws Exception {
        this.setPage();
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
	/*�õ���ʾ��ҳ������*/
	public AdminPage getResult(String pages) throws Exception{
		try{
			AdminPage page=new AdminPage();
			ArrayList list=new ArrayList();
			int pageNum=Integer.parseInt(pages.trim());
			int fromIndex=(pageNum-1)*this.getRowsPerPage();
			Connection con=Connect.getConnection();
			Statement stmt=con.createStatement();
			String sql="select * from admin order by id desc limit " + fromIndex+","+this.getRowsPerPage();
			ResultSet rs = stmt.executeQuery(sql);
			int i=0;
			while(rs.next()){
				Admin u=new Admin();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setRegtime(rs.getString("regtime"));
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
	/*��ȡ������*/
	public int getAllRows() throws Exception{
		int ret=0;
		Connection con=Connect.getConnection();
		 Statement stmt = con.createStatement();
	        String strSql = "select * from admin";
	        ResultSet rset = stmt.executeQuery(strSql);
	        while (rset.next()) {
	            ret++;
	        }
	        return ret;
	}
	//��ʼ��ʱ��page��������
	public void setPage() throws Exception{
		//�õ�������
		this.setMaxRowCount(this.getAllRows());
		if(this.maxRowCount % this.rowsPerPage==0){//����������������ҳ��
			this.maxPage=(this.maxRowCount / this.rowsPerPage);
		}else{
			this.maxPage=(this.maxRowCount / this.rowsPerPage+1);
		}
	}

}
