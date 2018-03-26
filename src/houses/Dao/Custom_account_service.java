package houses.Dao;

import java.util.List;

import houses.Base.Yezhu;

public interface Custom_account_service {
	//住户登录验证
	public Boolean customLoginCheck(String username,String password);
	//分配账户
	public void add_custom_account(String username,String password,int yezhuID);
	//
	public int search_yezhu_account(int yezhuID);//查询业主是否被分配了账号
	
	public void delete_custom_account(int yezhuID);//删除业主账号
	 
	public List<Yezhu> search_yezhu_number(String username,String password);//根据账户密码，查找业主门牌号
	
	public int modify_custom_psd(int id,String oldpsd,String psd);//修改业主账户密码
}