package houses.Dao;

import houses.Base.Personnel;

import java.util.Date;
import java.util.List;

public interface Personnel_service {
	
	public void Add_personnel(String name,int age,String sex,String idcard,
		String jiguan,String phone,String addr,String xueli,String gongling,
		String oldwork,String worktype,String daozhimemo,String status);//人事登记
	
	public List<Personnel> List_personnel(int firstResult,int maxResult);//人事分页查询
	
	public int Personnel_count();//返回人事表总数量
	
	public List<Personnel> Detail_personnel(int id);//查询人事详情
	
	public void Ruzhi_personnel(int id,String worktype,String daozhimemo,Date daozhidate);//正式入职
	
	public void Lizhi_personnel(int id,String lizhimemo,Date lizhidate);//离职
	
	public void Modify_personnel(int id,String name,int age,String sex,String idcard,
			String jiguan,String phone,String addr,String xueli,String gongling,
			String oldwork,String worktype,String daozhimemo);//修改人事信息
	
	public List<Personnel> Search_personnel(String name);//姓名查询
	
	public List worker_list(String worktype);//查询在职的人事姓名
}
