package houses.Dao;

import houses.Base.Homes;

import java.util.List;

public interface Homes_service {
	
	public void Add_homes(String lou,String number,String type,int area,String sell
			,String danyuan,String loucheng,String chaoxiang,String memo,String yezhu);
	
	public List<Homes> List_homes(int firstResult,int maxResult,String number,String sell,String huxing,int mianji,
			String danyuan,String louceng);//分页查询所有房产信息，是否入住
	
	public int count_homes(String number,String sell,String huxing,int mianji,String danyuan,String louceng);//查询房产数
	
	
	public int number_homes(String number);
	
	public void ruzhu_homes(String number,String yezhu,String sell);//登记入住
	
	public List<Homes> detail_homes(int id);
	
	public void delete_homes(int id);//删除房产信息
	

}