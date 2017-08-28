package entity;

public class Book1 {
   private int id;
   private String picture;
   private String bookName;
   private String author;
   private long currentPrice;
   private long realPrice;
   private String publisher;
   private String ISBN;
   private String publishDate;
   private int pages;
   private String bigPicture;
   private String content;
   private String authorin;
private int reset;
  
public Book1(){
	   
   }
   public Book1(int id,String picture,int currentPrice,String bookName){
	   this.id=id;
	   this.picture=picture;
	   this.currentPrice=currentPrice;
	   this.bookName=bookName;
   }
public String getPublisher() {
	return publisher;
}
public void setPublisher(String publisher) {
	this.publisher = publisher;
}

public String getISBN() {
	return ISBN;
}
public void setISBN(String iSBN) {
	ISBN = iSBN;
}
public String getPublishDate() {
	return publishDate;
}
public void setPublishDate(String publishDate) {
	this.publishDate = publishDate;
}
public int getPages() {
	return pages;
}
public void setPages(int pages) {
	this.pages = pages;
}
public String getBigPicture() {
	return bigPicture;
}
public void setBigPicture(String bigPicture) {
	this.bigPicture = bigPicture;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getPicture() {
	return picture;
}
public void setPicture(String picture) {
	this.picture = picture;
}
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public long getCurrentPrice() {
	return currentPrice;
}
public void setCurrentPrice(long currentPrice) {
	this.currentPrice = currentPrice;
}
public long getRealPrice() {
	return realPrice;
}
public void setRealPrice(long realPrice) {
	this.realPrice = realPrice;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getAuthorin() {
	return authorin;
}
public void setAuthorin(String authorin) {
	this.authorin = authorin;
}
public int getReset() {
	return reset;
}
public void setReset(int reset) {
	this.reset = reset;
}
@Override
public int hashCode() {//防止添加重复商品
	// TODO Auto-generated method stub
	return this.getId()+this.getBookName().hashCode();
}
@Override
public boolean equals(Object obj) {//防止添加重复商品
	// TODO Auto-generated method stub
	if(this==obj)
	{
		return true;
	}
	if(obj instanceof Book1)
	{
		Book1 i = (Book1)obj;
		if(this.getId()==i.getId()&&this.getBookName().equals(i.getBookName()))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	else
	{
		return false;
	}
}
public String toString()
{
	return "商品编号："+this.getId()+",商品名称："+this.getBookName();
} 
}
