package houses.Action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import houses.Base.Personnel;
import houses.Dao.Personnel_serviceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PersonnelAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	private int personnelID;//人事ID
	private String personnel_name;//姓名
	private int personnel_age;//年龄
	private String personnel_sex;//性别
	private String personnel_idcard;//身份证号
	private String personnel_jiguan;//籍贯
	private String personnel_phone;//电话
	private String personnel_addr;//家庭住址
	private String personnel_xueli;//学历
	private String personnel_gongling;//工龄
	private String personnel_oldwork;//以前从事工作
	private Date personnel_daozhidate;//到职日期
	private Date personnel_lizhidate;//离职日期
	private String personnel_worktype;//工作类型
	private String personnel_daozhimemo;//到职备注
	private String personnel_lizhimemo;//离职备注
	private String personnel_status;//状态
	
	private String personnel_searchname;//查询姓名
	
	private static String name;
	

	public String getPersonnel_searchname() {
		return personnel_searchname;
	}

	public void setPersonnel_searchname(String personnelSearchname) {
		personnel_searchname = personnelSearchname;
	}

	public String getPersonnel_status() {
		return personnel_status;
	}

	public void setPersonnel_status(String personnelStatus) {
		personnel_status = personnelStatus;
	}


	private int personnel_count;
	private int current_page;
	private static int firstResult;
	
	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int currentPage) {
		current_page = currentPage;
	}
	
	
	public int getPersonnel_count() {
		return personnel_count;
	}

	public void setPersonnel_count(int personnelCount) {
		personnel_count = personnelCount;
	}


	private HttpServletRequest request;
	private HttpServletResponse response;
	
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
	public int getPersonnelID() {
		return personnelID;
	}

	public void setPersonnelID(int personnelID) {
		this.personnelID = personnelID;
	}

	public String getPersonnel_name() {
		return personnel_name;
	}

	public void setPersonnel_name(String personnelName) {
		personnel_name = personnelName;
	}

	public int getPersonnel_age() {
		return personnel_age;
	}

	public void setPersonnel_age(int personnelAge) {
		personnel_age = personnelAge;
	}

	public String getPersonnel_sex() {
		return personnel_sex;
	}

	public void setPersonnel_sex(String personnelSex) {
		personnel_sex = personnelSex;
	}

	public String getPersonnel_idcard() {
		return personnel_idcard;
	}

	public void setPersonnel_idcard(String personnelIdcard) {
		personnel_idcard = personnelIdcard;
	}

	public String getPersonnel_jiguan() {
		return personnel_jiguan;
	}

	public void setPersonnel_jiguan(String personnelJiguan) {
		personnel_jiguan = personnelJiguan;
	}

	public String getPersonnel_phone() {
		return personnel_phone;
	}

	public void setPersonnel_phone(String personnelPhone) {
		personnel_phone = personnelPhone;
	}

	public String getPersonnel_addr() {
		return personnel_addr;
	}

	public void setPersonnel_addr(String personnelAddr) {
		personnel_addr = personnelAddr;
	}

	public String getPersonnel_xueli() {
		return personnel_xueli;
	}

	public void setPersonnel_xueli(String personnelXueli) {
		personnel_xueli = personnelXueli;
	}

	public String getPersonnel_gongling() {
		return personnel_gongling;
	}

	public void setPersonnel_gongling(String personnelGongling) {
		personnel_gongling = personnelGongling;
	}

	public String getPersonnel_oldwork() {
		return personnel_oldwork;
	}

	public void setPersonnel_oldwork(String personnelOldwork) {
		personnel_oldwork = personnelOldwork;
	}

	public Date getPersonnel_daozhidate() {
		return personnel_daozhidate;
	}

	public void setPersonnel_daozhidate(Date personnelDaozhidate) {
		personnel_daozhidate = personnelDaozhidate;
	}

	public Date getPersonnel_lizhidate() {
		return personnel_lizhidate;
	}

	public void setPersonnel_lizhidate(Date personnelLizhidate) {
		personnel_lizhidate = personnelLizhidate;
	}

	public String getPersonnel_worktype() {
		return personnel_worktype;
	}

	public void setPersonnel_worktype(String personnelWorktype) {
		personnel_worktype = personnelWorktype;
	}

	public String getPersonnel_daozhimemo() {
		return personnel_daozhimemo;
	}

	public void setPersonnel_daozhimemo(String personnelDaozhimemo) {
		personnel_daozhimemo = personnelDaozhimemo;
	}

	public String getPersonnel_lizhimemo() {
		return personnel_lizhimemo;
	}

	public void setPersonnel_lizhimemo(String personnelLizhimemo) {
		personnel_lizhimemo = personnelLizhimemo;
	}

	public String List_personnel()
	{
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		int count = personnel_s.Personnel_count();
		this.personnel_count = count;
		if(request.getParameter("p") == null ||request.getParameter("p").equals("first"))
		{ 
		firstResult = 0;
		List<Personnel> personnel = personnel_s.List_personnel(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("personnel", personnel);
		this.current_page = 1;
		return "success";
		}
		
		if(request.getParameter("p").equals("next"))
		{
		if(firstResult == count-count%8)firstResult = count-count%8;
		//如果是尾页，则firstResult不自加
		else firstResult = firstResult+8;
		List<Personnel> personnel = personnel_s.List_personnel(firstResult,8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("personnel", personnel);
		//System.out.println(request.getRequestURL());
		
		this.current_page = firstResult/8+1;
		
		return "success";
		}
		
		if(request.getParameter("p").equals("prior"))
		{
		if(firstResult == 0)firstResult=0;//如果是首页，不改变
		else firstResult = firstResult-8;
		List<Personnel> personnel = personnel_s.List_personnel(firstResult,8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("personnel", personnel);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		if(request.getParameter("p").equals("last"))
		{
		firstResult =count-count%8;
		List<Personnel> personnel = personnel_s.List_personnel(firstResult,8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("personnel", personnel);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		return null;
	}
	
	public void add_personnel()
	{
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		String status = "待入职";
		personnel_s.Add_personnel(this.personnel_name, this.personnel_age, this.personnel_sex, this.personnel_idcard, this.personnel_jiguan, this.personnel_phone, this.personnel_addr, this.personnel_xueli, this.personnel_gongling, this.personnel_oldwork, this.personnel_worktype, this.personnel_daozhimemo,status);
		
		out.print("登记成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String detail_personnel()//查看人事详情
	{
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		List<Personnel> personnel = personnel_s.Detail_personnel(Integer.parseInt(request.getParameter("p")));
		
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("personnel", personnel);
		return "success";
	}
	
	public String searchformodify_personnel()//为修改查询
	{
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		List<Personnel> personnel = personnel_s.Detail_personnel(Integer.parseInt(request.getParameter("p")));
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("personnel", personnel);
		return "success";
	}
	
	public void modify_personnel()//修改人事信息
	{
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		personnel_s.Modify_personnel(Integer.parseInt(request.getParameter("p")), this.personnel_name, this.personnel_age, this.personnel_sex, this.personnel_idcard, this.personnel_jiguan, this.personnel_phone, this.personnel_addr, this.personnel_xueli, this.personnel_gongling, this.personnel_oldwork, this.personnel_worktype, this.personnel_daozhimemo);
		out.print("修改成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void ruzhi_personnel()//正式入职
	{	
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Date today =new Date();
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		personnel_s.Ruzhi_personnel(Integer.parseInt(request.getParameter("p")), this.personnel_worktype, this.personnel_daozhimemo, today);
		out.print("入职成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void lizhi_personnel()//离职
	{
	try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Date today =new Date();
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		personnel_s.Lizhi_personnel(Integer.parseInt(request.getParameter("p")), this.personnel_lizhimemo, today);
		out.print("离职成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void savesearchinfo()//保存查询信息
	{
		name=this.personnel_searchname;
	}
	
	public String search_personnel()//姓名查询
	{   
		Personnel_serviceImpl personnel_s = new Personnel_serviceImpl();
		List<Personnel> personnel = personnel_s.Search_personnel("%"+name+"%");
		
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("personnel", personnel);
		
		return "success";
	}

	
}
