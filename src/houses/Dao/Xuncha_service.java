package houses.Dao;

import houses.Base.Xuncha;

import java.util.Date;
import java.util.List;

public interface Xuncha_service {
	
  public List<Xuncha> List_xuncha(int firstResult,int maxResult);//分页查询
  public int Count_xuncha();//巡查条数
  public void add_xuncha(String person,String type,Date time,String chuliren,String dangshiren,String result,String memo);//新增巡查事件
  
  public List<Xuncha> detail_xuncha(int id);//巡查事件详细信息
  
  public void modify_xuncha(int id,String person,String type,Date time,String chuliren,String dangshiren,String result,String memo);//修改信息
 
  public void delete_xuncha(int id);//删除巡查信息
}
