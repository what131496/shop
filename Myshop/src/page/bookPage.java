package page;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dataBase.Connect;
import entity.Admin;
import entity.Book1;

public class bookPage {

	private int curPage = 1; //��ǰ�ǵڼ�ҳ
    private int maxPage; //һ���ж���ҳ
    private int maxRowCount; //һ���ж�����
    public int rowsPerPage =4; //ÿҳ������
    public ArrayList data;
    public bookPage() throws Exception {
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
	public bookPage getResult(String pages) throws Exception{
		try{
			bookPage page=new bookPage();
			ArrayList list=new ArrayList();
			int pageNum=Integer.parseInt(pages.trim());
			int fromIndex=(pageNum-1)*this.getRowsPerPage();
			Connection con=Connect.getConnection();
			Statement stmt=con.createStatement();
			String sql="select * from book1 order by id asc limit " + fromIndex+","+this.getRowsPerPage();
			ResultSet rs = stmt.executeQuery(sql);
			int i=0;
			while(rs.next()){
				Book1 book=new Book1(); 
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
				list.add(book);
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
	        String strSql = "select * from book1";
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
