package houses.Dao;

import houses.Base.Yezhu;

import java.util.Date;
import java.util.List;


public interface Yezhu_service {
	
	//添加业主信息
	public void add_yezhu(String name,String number,String sex,int age,String tel,String phone,String IDC,String member,Date date,String memo,int account);
	//查询业主信息
	public List<Yezhu> list_yezhu(int firstResult,int maxResult,String name,String homesnumber);
	
	public int count_yezhu(String name,String homesnumber);
	
	public void delete_yezhu(int id);//删除业主信息
	
	public void delete_yezhu_bynumber(String number);//根据门牌号删除业主信息
	
	public List<Yezhu> detail_yezhu(int id);//根据ID查询业主详情
	//修改业主信息
	public void modify_yezhu(int id,String name,String number,String sex,int age,String tel,String phone,String IDC,String member,Date date,String memo);

	public List<Yezhu> detail_yezhuinfo(String number);
}