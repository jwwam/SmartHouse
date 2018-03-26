package houses.Action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import houses.Base.Xuncha;
import houses.Dao.Personnel_serviceImpl;
import houses.Dao.Xuncha_serviceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class XunchaAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{


	private int xunchaID;
	private String xuncha_person;
	private String xuncha_type;
	private Date xuncha_time;
	private String xuncha_chuliren;
	private String xuncha_dangshiren;
	private String xuncha_result;
	private String xuncha_memo;
	
	@SuppressWarnings("unchecked")
	private List l;
	
	@SuppressWarnings("unchecked")
	public List getL() {
		return l;
	}

	@SuppressWarnings("unchecked")
	public void setL(List l) {
		this.l = l;
	}

	private static int firstResult;
	private int xuncha_count;
	private int current_page;
	
	
	
	public int getXunchaID() {
		return xunchaID;
	}

	public void setXunchaID(int xunchaID) {
		this.xunchaID = xunchaID;
	}

	public String getXuncha_person() {
		return xuncha_person;
	}

	public void setXuncha_person(String xunchaPerson) {
		xuncha_person = xunchaPerson;
	}

	public String getXuncha_type() {
		return xuncha_type;
	}

	public void setXuncha_type(String xunchaType) {
		xuncha_type = xunchaType;
	}

	public Date getXuncha_time() {
		return xuncha_time;
	}

	public void setXuncha_time(Date xunchaTime) {
		xuncha_time = xunchaTime;
	}

	public String getXuncha_chuliren() {
		return xuncha_chuliren;
	}

	public void setXuncha_chuliren(String xunchaChuliren) {
		xuncha_chuliren = xunchaChuliren;
	}

	public String getXuncha_dangshiren() {
		return xuncha_dangshiren;
	}

	public void setXuncha_dangshiren(String xunchaDangshiren) {
		xuncha_dangshiren = xunchaDangshiren;
	}

	public String getXuncha_result() {
		return xuncha_result;
	}

	public void setXuncha_result(String xunchaResult) {
		xuncha_result = xunchaResult;
	}

	public String getXuncha_memo() {
		return xuncha_memo;
	}

	public void setXuncha_memo(String xunchaMemo) {
		xuncha_memo = xunchaMemo;
	}

	public int getXuncha_count() {
		return xuncha_count;
	}

	public void setXuncha_count(int xunchaCount) {
		xuncha_count = xunchaCount;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int currentPage) {
		current_page = currentPage;
	}

	private HttpServletRequest request;
	private HttpServletResponse response;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		request=arg0;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		response=arg0;
	}
	
	public String list_xuncha()
	{
		Xuncha_serviceImpl xuncha_s = new Xuncha_serviceImpl();
		int count = xuncha_s.Count_xuncha();
		this.xuncha_count =count;
		if(request.getParameter("p") == null ||request.getParameter("p").equals("first"))
		{ 
		firstResult = 0;
		List<Xuncha> xuncha = xuncha_s.List_xuncha(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("xuncha", xuncha);
		this.current_page = 1;
		return "success";
		}
		
		if(request.getParameter("p").equals("next"))
		{
		if(firstResult == count-count%8)firstResult = count-count%8;
		//如果是尾页，则firstResult不自加
		else firstResult = firstResult+8;
		List<Xuncha> xuncha = xuncha_s.List_xuncha(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("xuncha", xuncha);
		//System.out.println(request.getRequestURL());
		
		this.current_page = firstResult/8+1;
		
		return "success";
		}
		
		if(request.getParameter("p").equals("prior"))
		{
		if(firstResult == 0)firstResult=0;//如果是首页，不改变
		else firstResult = firstResult-8;
		List<Xuncha> xuncha = xuncha_s.List_xuncha(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("xuncha", xuncha);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		if(request.getParameter("p").equals("last"))
		{
		firstResult =count-count%8;
		List<Xuncha> xuncha = xuncha_s.List_xuncha(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("xuncha", xuncha);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		return null;
		
	}
	
	public void add_xuncha()
	{
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Xuncha_serviceImpl xuncha_s = new Xuncha_serviceImpl();
		xuncha_s.add_xuncha(this.xuncha_person, this.xuncha_type, this.xuncha_time, this.xuncha_chuliren, this.xuncha_dangshiren, this.xuncha_result, this.xuncha_memo);
	
		out.print("事件登记成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String detail_xuncha()
	{
		Xuncha_serviceImpl xuncha_s = new Xuncha_serviceImpl();
		List<Xuncha> xuncha = xuncha_s.detail_xuncha(Integer.parseInt(request.getParameter("p")));
		
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("xuncha", xuncha);
		
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		this.l = personnel_s.worker_list("保安");
		return "success";
		
	}
	
	public void modify_xuncha()
	{
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Xuncha_serviceImpl xuncha_s = new Xuncha_serviceImpl();
		xuncha_s.modify_xuncha(Integer.parseInt(request.getParameter("p")), this.xuncha_person, this.xuncha_type, this.xuncha_time, this.xuncha_chuliren, this.xuncha_dangshiren, this.xuncha_result, this.xuncha_memo);
		out.print("修改成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void delete_xuncha()
	{
		try{
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Xuncha_serviceImpl xuncha_s = new Xuncha_serviceImpl();
			xuncha_s.delete_xuncha(Integer.parseInt(request.getParameter("p")));
			out.print("删除成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String initData()
	{
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		this.l = personnel_s.worker_list("保安");
		System.out.println(l);
		
		return "success";
	}

}
