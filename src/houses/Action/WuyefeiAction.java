package houses.Action;

import houses.Base.Wuyefei;
import houses.Dao.Wuyefei_serviceImpl;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class WuyefeiAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	
	private double wuyefei_danjia;
	private String wuyefei_year;
	private String wuyefei_month;
	private String wuyefei_memo;
	
	
	


	public String getWuyefei_memo() {
		return wuyefei_memo;
	}


	public void setWuyefei_memo(String wuyefeiMemo) {
		wuyefei_memo = wuyefeiMemo;
	}


	public double getWuyefei_danjia() {
		return wuyefei_danjia;
	}


	public void setWuyefei_danjia(double wuyefeiDanjia) {
		wuyefei_danjia = wuyefeiDanjia;
	}


	public String getWuyefei_year() {
		return wuyefei_year;
	}


	public void setWuyefei_year(String wuyefeiYear) {
		wuyefei_year = wuyefeiYear;
	}


	public String getWuyefei_month() {
		return wuyefei_month;
	}


	public void setWuyefei_month(String wuyefeiMonth) {
		wuyefei_month = wuyefeiMonth;
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
	
	public HttpServletRequest getRequest() {
		return request;
	}


	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}


	public HttpServletResponse getResponse() {
		return response;
	}


	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}


	private static int firstResult;
	private int wuyefei_count;
	private int current_page;
	

	public int getWuyefei_count() {
		return wuyefei_count;
	}


	public void setWuyefei_count(int wuyefeiCount) {
		wuyefei_count = wuyefeiCount;
	}


	public int getCurrent_page() {
		return current_page;
	}


	public void setCurrent_page(int currentPage) {
		current_page = currentPage;
	}


	@SuppressWarnings("unchecked")
	public String list_wuyefei()
	{
		String year="%";
		String month="%";
		Wuyefei_serviceImpl wuyefei_s = new Wuyefei_serviceImpl();
		int count = wuyefei_s.count_wuyefei(year, month);
		this.wuyefei_count =count;
		if(request.getParameter("p") == null ||request.getParameter("p").equals("first"))
		{ 
		firstResult = 0;
		List wuyefei = wuyefei_s.list_wuyefei(firstResult, 8, year, month);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("wuyefei", wuyefei);
		this.current_page = 1;
		return "success";
		}
		
		if(request.getParameter("p").equals("next"))
		{
		if(firstResult == count-count%8)firstResult = count-count%8;
		//如果是尾页，则firstResult不自加
		else firstResult = firstResult+8;
		List wuyefei = wuyefei_s.list_wuyefei(firstResult, 8, year, month);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("wuyefei", wuyefei);
		//System.out.println(request.getRequestURL());
		
		this.current_page = firstResult/8+1;
		
		return "success";
		}
		
		if(request.getParameter("p").equals("prior"))
		{
		if(firstResult == 0)firstResult=0;//如果是首页，不改变
		else firstResult = firstResult-8;
		List wuyefei = wuyefei_s.list_wuyefei(firstResult, 8, year, month);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("wuyefei", wuyefei);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		if(request.getParameter("p").equals("last"))
		{
		firstResult =count-count%8;
		List wuyefei = wuyefei_s.list_wuyefei(firstResult, 8, year, month);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("wuyefei", wuyefei);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		return null;
	}
	
	public void shengcheng_wuyefei()
	{
		try{
			
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Wuyefei_serviceImpl wuyefei_s = new Wuyefei_serviceImpl();
		int t = wuyefei_s.p_wuyefei(this.wuyefei_year, this.wuyefei_month);
		if(t>0)
		{
			out.print("当月物业费已存在");
		}
		else
		{
		wuyefei_s.shengcheng_wuyefei(this.wuyefei_danjia, this.wuyefei_year, this.wuyefei_month,(String)session.getAttribute("user"),this.wuyefei_memo);
		out.print("生成物业费成功");
		}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String detail_wuyefei()
	{
		Wuyefei_serviceImpl wuyefei_s = new Wuyefei_serviceImpl();
		List<Wuyefei> wuyefei = wuyefei_s.detail_wuyefei(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("wuyefei", wuyefei);
		return "success";
	}
	
	public void shouqu_wuyefei()
	{
		try{
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Wuyefei_serviceImpl wuyefei_s = new Wuyefei_serviceImpl();
			wuyefei_s.shouqu_wuyefei(Integer.parseInt(request.getParameter("id")));
			out.print("收取物业费成功");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public String new_wuyefei()
	{
		Wuyefei_serviceImpl wuyefei_s = new Wuyefei_serviceImpl();
		HttpSession session = request.getSession();
		List<Wuyefei> wuyefei = wuyefei_s.new_wuyefei((String)session.getAttribute("yezhu_number"));
		request.setAttribute("wuyefei", wuyefei);
		return "success";
	}
	


}
