package houses.Action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import houses.Base.Maintain;
import houses.Dao.Maintain_serviceImpl;

import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class MaintainAction extends ActionSupport implements ServletRequestAware,ServletResponseAware {
	
	private int maintain_count;
	private int current_page;
	private static int firstResult;
	
	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int currentPage) {
		current_page = currentPage;
	}
	private int maintainID;
	private String maintain_thing;
	private String maintain_status;
	private String maintain_homesnumber;
	private Date maintain_sdate;
	private Date maintain_rdate;
	private int maintain_tcost;
	private int maintain_scost;
	private String maintainer;
	private String maintain_smemo;
	private String maintain_rmemo;
	
	private HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
	private HttpServletResponse response;
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		response = arg0;
	}
	
	public int getMaintainID() {
		return maintainID;
	}

	public void setMaintainID(int maintainID) {
		this.maintainID = maintainID;
	}
	public String getMaintain_homesnumber() {
		return maintain_homesnumber;
	}
	
	public void setMaintain_homesnumber(String maintainHomesnumber) {
		maintain_homesnumber = maintainHomesnumber;
	}

	public String getMaintain_thing() {
		return maintain_thing;
	}

	public void setMaintain_thing(String maintainThing) {
		maintain_thing = maintainThing;
	}

	public String getMaintain_status() {
		return maintain_status;
	}

	public void setMaintain_status(String maintainStatus) {
		maintain_status = maintainStatus;
	}


	public Date getMaintain_sdate() {
		return maintain_sdate;
	}

	public void setMaintain_sdate(Date maintainSdate) {
		maintain_sdate = maintainSdate;
	}

	public Date getMaintain_rdate() {
		return maintain_rdate;
	}

	public void setMaintain_rdate(Date maintainRdate) {
		maintain_rdate = maintainRdate;
	}

	public int getMaintain_tcost() {
		return maintain_tcost;
	}

	public void setMaintain_tcost(int maintainTcost) {
		maintain_tcost = maintainTcost;
	}

	public int getMaintain_scost() {
		return maintain_scost;
	}

	public void setMaintain_scost(int maintainScost) {
		maintain_scost = maintainScost;
	}

	public String getMaintainer() {
		return maintainer;
	}

	public void setMaintainer(String maintainer) {
		this.maintainer = maintainer;
	}

	public String getMaintain_smemo() {
		return maintain_smemo;
	}

	public void setMaintain_smemo(String maintainSmemo) {
		maintain_smemo = maintainSmemo;
	}

	public String getMaintain_rmemo() {
		return maintain_rmemo;
	}

	public void setMaintain_rmemo(String maintainRmemo) {
		maintain_rmemo = maintainRmemo;
	}

	public int getMaintain_count() {
		return maintain_count;
	}

	public void setMaintain_count(int maintainCount) {
		maintain_count = maintainCount;
	}

	public String List_maintain()
	{
		Maintain_serviceImpl maintain_s = new Maintain_serviceImpl();
		int count = maintain_s.Maintain_count();
		this.maintain_count = count;
		
		if(request.getParameter("p") == null ||request.getParameter("p").equals("first"))
		{ 
		firstResult = 0;
		List<Maintain> maintain = maintain_s.List_maintain(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("maintain", maintain);
		this.current_page = 1;
		return "success";
		}
		
		if(request.getParameter("p").equals("next"))
		{
		if(firstResult == count-count%8)firstResult = count-count%8;
		//如果是尾页，则firstResult不自加
		else firstResult = firstResult+8;
		List<Maintain> maintain = maintain_s.List_maintain(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("maintain", maintain);
		//System.out.println(request.getRequestURL());
		
		this.current_page = firstResult/8+1;
		
		return "success";
		}
		
		if(request.getParameter("p").equals("prior"))
		{
		if(firstResult == 0)firstResult=0;//如果是首页，不改变
		else firstResult = firstResult-8;
		List<Maintain> maintain = maintain_s.List_maintain(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("maintain", maintain);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		if(request.getParameter("p").equals("last"))
		{
		firstResult =count-count%8;
		List<Maintain> maintain = maintain_s.List_maintain(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("maintain", maintain);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		return null;
	}
	
	public void add_maintain()
	{
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Maintain_serviceImpl maintain_s = new Maintain_serviceImpl();
		Date today = new Date();
		maintain_s.Add_maintain(this.maintain_thing, this.maintain_homesnumber, today, this.maintain_smemo);
		out.print("登记成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String detail_maintain()
	{
		Maintain_serviceImpl maintain_s = new Maintain_serviceImpl();
		System.out.println(request.getParameter("p"));
		List<Maintain> maintain =maintain_s.Detail_maintain(Integer.parseInt(request.getParameter("p")));
		
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("maintain", maintain);
		
		return "success";
	}
	
	public String un_maintain()//查询已报修的信息
	{
		Maintain_serviceImpl maintain_s = new Maintain_serviceImpl();
		List<Maintain> maintain =maintain_s.Un_maintain();
		
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("maintain", maintain);
		
		return "success";
	}
	
	public void do_maintain()//安排维修
	{
		try{
		
		Maintain_serviceImpl maintain_s = new Maintain_serviceImpl();
		System.out.println(request.getParameter("p"));
		maintain_s.Do_maintain(Integer.parseInt(request.getParameter("p")), this.maintainer);
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print("安排成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String go_maintain()//查询已安排的信息
	{
		Maintain_serviceImpl maintain_s = new Maintain_serviceImpl();
		List<Maintain> maintain =maintain_s.go_maintain();
		
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("maintain", maintain);
		
		return "success";
	}
	
	public void result_maintain()//登记维修结果
	{
		try{
			Maintain_serviceImpl maintain_s = new Maintain_serviceImpl();
			System.out.println(request.getParameter("p"));
			maintain_s.Result_maintain(Integer.parseInt(request.getParameter("p")), this.maintain_status, this.maintain_tcost, this.maintain_scost, this.maintain_rmemo);
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print("登记成功");
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		
	}
	
	public String yezhu_maitain()
	{
		Maintain_serviceImpl maintain_s = new Maintain_serviceImpl();
		HttpSession session = request.getSession();
		List<Maintain> maintain =maintain_s.yezhu_maintain((String)session.getAttribute("yezhu_number"));
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("maintain", maintain);
		return "success";
	}
	

}
