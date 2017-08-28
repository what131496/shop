package entity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

//购物车类
	public class Cart {
	private HashMap<Book1,Integer> goods;//购买商品的集合
	private double totalPrice;//总金额
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
//	添加购物车
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
		calTotalPrice(); //重新计算购物车的总金额
		return true;
	}
	//删除商品的方法
		public boolean removeGoodsFromCart(Book1 item)
		{
			goods.remove(item);
			calTotalPrice(); //重新计算购物车的总金额
			return true;
		}
		//统计购物车的总金额
		public double calTotalPrice()
		{
			double sum = 0.0;
			Set<Book1> keys = goods.keySet(); //获得键的集合
			Iterator<Book1> it = keys.iterator(); //获得迭代器对象，通过此进行遍历
		    while(it.hasNext())
		    {
		    	Book1 i = it.next();//获取商品对象
		    	sum += i.getCurrentPrice()* goods.get(i);
		    }
		    this.setTotalPrice(sum); //设置购物车的总金额
		    return this.getTotalPrice();
		}
		public static void main (String args[]){
			Book1 b1=new Book1(1,"001.jpg",20,"你还");
			Book1 b2=new Book1(1,"002.jpg",30,"真的");
			Book1 b3=new Book1(1,"001.jpg",20,"不知道");
			Cart c=new Cart();
			c.addGoodsInCart(b1, 2);
			c.addGoodsInCart(b2, 3);
			c.addGoodsInCart(b3, 4);
			//变量购物商品的集合
			Set<Map.Entry<Book1, Integer>> items= c.getGoods().entrySet();
			for(Map.Entry<Book1, Integer> obj:items)
			{
				System.out.println(obj);
			}
			System.out.println("总金额为："+c.getTotalPrice());
			
		}
}
