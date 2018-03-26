package houses.Dao;

import houses.Base.Notify;

import java.util.Date;
import java.util.List;

public interface Notify_service {
	
	public void Add_notify(String content,Date date,String title,String uper);//添加公告
	
	public List<Notify> List_notify(int firstResult,int maxResult);//分页查询
	
	public List<Notify> modify_notify(int id);
	
	public void Updata_notify(int id,String title,String content,Date date,String uper);//根据ID更改公告
	
	public void Del_notify(int id);//删除公告
	
	public int Notify_count(); //公告条数
	
	public List<Notify> new_notify();//最新公告
	
}
