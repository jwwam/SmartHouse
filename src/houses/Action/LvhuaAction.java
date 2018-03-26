package houses.Action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import houses.Base.Lvhua;
import houses.Dao.Lvhua_serviceImpl;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LvhuaAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	
	private int lvhuaID;
	private String lvhua_area;
	private String lvhua_style;
	private String lvhua_fuzheren;
	private Date lvhua_date;
	private String lvhua_status;
	private String lvhua_yanshouren;
	private String lvhua_memo;
	
	
	
	public int getLvhuaID() {
		return lvhuaID;
	}

	public void setLvhuaID(int lvhuaID) {
		this.lvhuaID = lvhuaID;
	}

	public String getLvhua_area() {
		return lvhua_area;
	}

	public void setLvhua_area(String lvhuaArea) {
		lvhua_area = lvhuaArea;
	}

	public String getLvhua_style() {
		return lvhua_style;
	}

	public void setLvhua_style(String lvhuaStyle) {
		lvhua_style = lvhuaStyle;
	}

	public String getLvhua_fuzheren() {
		return lvhua_fuzheren;
	}

	public void setLvhua_fuzheren(String lvhuaFuzheren) {
		lvhua_fuzheren = lvhuaFuzheren;
	}

	public Date getLvhua_date() {
		return lvhua_date;
	}

	public void setLvhua_date(Date lvhuaDate) {
		lvhua_date = lvhuaDate;
	}

	public String getLvhua_status() {
		return lvhua_status;
	}

	public void setLvhua_status(String lvhuaStatus) {
		lvhua_status = lvhuaStatus;
	}

	public String getLvhua_yanshouren() {
		return lvhua_yanshouren;
	}

	public void setLvhua_yanshouren(String lvhuaYanshouren) {
		lvhua_yanshouren = lvhuaYanshouren;
	}

	public String getLvhua_memo() {
		return lvhua_memo;
	}

	public void setLvhua_memo(String lvhuaMemo) {
		lvhua_memo = lvhuaMemo;
	}

	private HttpServletRequest request;
	private HttpServletResponse response;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		request = arg0;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		response = arg0;
	}
	
	private static int firstResult;
	private int current_page;
	private int lvhua_count;
	public int getLvhua_count() {
		return lvhua_count;
	}

	public void setLvhua_count(int lvhuaCount) {
		lvhua_count = lvhuaCount;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int currentPage) {
		current_page = currentPage;
	}

	public String list_lvhua()
	{
		Lvhua_serviceImpl lvhua_s= new Lvhua_serviceImpl();
		int count = lvhua_s.count_lvhua();
		this.lvhua_count =count;
		if(request.getParameter("p") == null ||request.getParameter("p").equals("first"))
		{ 
		firstResult = 0;
		List<Lvhua> lvhua = lvhua_s.List_lvhua(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("lvhua", lvhua);
		this.current_page = 1;
		return "success";
		}
		
		if(request.getParameter("p").equals("next"))
		{
		if(firstResult == count-count%8)firstResult = count-count%8;
		//如果是尾页，则firstResult不自加
		else firstResult = firstResult+8;
		List<Lvhua> lvhua = lvhua_s.List_lvhua(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("lvhua", lvhua);
		//System.out.println(request.getRequestURL());
		
		this.current_page = firstResult/8+1;
		
		return "success";
		}
		
		if(request.getParameter("p").equals("prior"))
		{
		if(firstResult == 0)firstResult=0;//如果是首页，不改变
		else firstResult = firstResult-8;
		List<Lvhua> lvhua = lvhua_s.List_lvhua(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("lvhua", lvhua);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		if(request.getParameter("p").equals("last"))
		{
		firstResult =count-count%8;
		List<Lvhua> lvhua = lvhua_s.List_lvhua(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("lvhua", lvhua);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		return null;
	}
	
	public void add_lvhua()
	{
		try{
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Lvhua_serviceImpl lvhua_s = new Lvhua_serviceImpl();
			lvhua_s.add_lvhua(this.lvhua_area, this.lvhua_style, this.lvhua_fuzheren, this.lvhua_date, this.lvhua_status, this.lvhua_yanshouren, this.lvhua_memo);
			out.print("绿化/保洁登记成功");
			}catch(Exception e)
			{
				e.printStackTrace();
			}
	}
	
	public void delete_lvhua()
	{
		try{
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Lvhua_serviceImpl lvhua_s = new Lvhua_serviceImpl();
			lvhua_s.delete_lvhua(Integer.parseInt(request.getParameter("p")));
			out.print("删除成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String detail_lvhua()
	{
		Lvhua_serviceImpl lvhua_s = new Lvhua_serviceImpl();
		List<Lvhua> lvhua = lvhua_s.detail_lvhua(Integer.parseInt(request.getParameter("p")));
		
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("lvhua", lvhua);
		
		return "success";
	}
	
	public void yanshou_lvhua()
	{
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Lvhua_serviceImpl lvhua_s = new Lvhua_serviceImpl();
		lvhua_s.yanshou_lvhua(Integer.parseInt(request.getParameter("p")), this.lvhua_yanshouren,"已验收", this.lvhua_memo);
		out.print("验收成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
