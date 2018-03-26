package houses.Dao;

import houses.Base.Maintain;

import java.util.Date;
import java.util.List;

public interface Maintain_service {
	
	public List<Maintain> List_maintain(int firstResult,int maxResult);//分页查询
	
	public int Maintain_count(); //维修表总数
	
	public void Add_maintain(String thing,String homesnumber,Date sdate,String smemo);//维修登记

	public List<Maintain> Detail_maintain(int id);//根据ID查找维修详情
	
	public List<Maintain> Un_maintain();//未安排维修的
	
	public void Do_maintain(int maintainid,String maintainer);//安排维修
	
	public List<Maintain> go_maintain();//已经安排维修的
	
	public void Result_maintain(int maintainid,String status,int tcost,int scost,String rmemo);//登记维修结果
	
	public List<Maintain> yezhu_maintain(String number);//根据门牌号查询报修信息
	
}
