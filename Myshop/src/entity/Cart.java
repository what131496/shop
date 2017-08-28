package entity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

//���ﳵ��
	public class Cart {
	private HashMap<Book1,Integer> goods;//������Ʒ�ļ���
	private double totalPrice;//�ܽ��
    public Cart(){
    	goods=new HashMap<Book1,Integer>();
    	totalPrice=0.0;
    }
	public HashMap<Book1, Integer> getGoods() {
		return goods;
	}
	public void setGoods(HashMap<Book1, Integer> goods) {
		this.goods = goods;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
//	��ӹ��ﳵ
	public boolean addGoodsInCart(Book1 item ,int number)
	{
		if(goods.containsKey(item))
		{
			goods.put(item, goods.get(item)+number);
		}
		else
		{
			goods.put(item, number);	
		}
		calTotalPrice(); //���¼��㹺�ﳵ���ܽ��
		return true;
	}
	//ɾ����Ʒ�ķ���
		public boolean removeGoodsFromCart(Book1 item)
		{
			goods.remove(item);
			calTotalPrice(); //���¼��㹺�ﳵ���ܽ��
			return true;
		}
		//ͳ�ƹ��ﳵ���ܽ��
		public double calTotalPrice()
		{
			double sum = 0.0;
			Set<Book1> keys = goods.keySet(); //��ü��ļ���
			Iterator<Book1> it = keys.iterator(); //��õ���������ͨ���˽��б���
		    while(it.hasNext())
		    {
		    	Book1 i = it.next();//��ȡ��Ʒ����
		    	sum += i.getCurrentPrice()* goods.get(i);
		    }
		    this.setTotalPrice(sum); //���ù��ﳵ���ܽ��
		    return this.getTotalPrice();
		}
		public static void main (String args[]){
			Book1 b1=new Book1(1,"001.jpg",20,"�㻹");
			Book1 b2=new Book1(1,"002.jpg",30,"���");
			Book1 b3=new Book1(1,"001.jpg",20,"��֪��");
			Cart c=new Cart();
			c.addGoodsInCart(b1, 2);
			c.addGoodsInCart(b2, 3);
			c.addGoodsInCart(b3, 4);
			//����������Ʒ�ļ���
			Set<Map.Entry<Book1, Integer>> items= c.getGoods().entrySet();
			for(Map.Entry<Book1, Integer> obj:items)
			{
				System.out.println(obj);
			}
			System.out.println("�ܽ��Ϊ��"+c.getTotalPrice());
			
		}
}
