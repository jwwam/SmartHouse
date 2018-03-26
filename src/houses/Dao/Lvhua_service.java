package houses.Dao;

import houses.Base.Lvhua;

import java.util.Date;
import java.util.List;


public interface Lvhua_service {
	
  public List<Lvhua> List_lvhua(int firstResult,int maxResult);//分页查询
  public int count_lvhua();//绿化总记录数
  
  public void add_lvhua(String area,String style,String fuzheren,Date date,String status,String yanshouren,String memo);//绿化登记

  public void delete_lvhua(int id);//删除绿化信息
  
  public List<Lvhua> detail_lvhua(int id);//查看详情
  
  public void yanshou_lvhua(int id,String yanshouren,String status,String memo);//验收
}