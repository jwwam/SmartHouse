package houses.Dao;

import houses.Base.Wuyefei;

import java.math.BigDecimal;
import java.util.List;

public interface Wuyefei_service {
	
	public List list_wuyefei(int firstResult,int maxResult,String year,String month);//根据年月，分页查询物业费列表
	
	public int count_wuyefei(String year,String month);//计算本月的物业费列表数量
	
	public void shengcheng_wuyefei(double danjia,String year,String month,String uper,String memo);//生成物业费
	
	public int p_wuyefei(String year,String month);//判断当月的物业费是否存在
	
	public List<Wuyefei> detail_wuyefei(int id);//查询物业费详情
	
	public void shouqu_wuyefei(int id);//收取物业费
	
	public List<Wuyefei> new_wuyefei(String number);//查询物业费提醒
	
}