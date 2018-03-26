package houses.Action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import houses.Base.Yezhu;
import houses.Dao.Custom_account_serviceImpl;
import houses.Dao.Homes_serviceImpl;
import houses.Dao.Yezhu_serviceImpl;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class YezhuAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	
	private String custom_username;
	private String custom_password;
	private int custom_yezhuID;
	
	
	
	
	public String getCustom_username() {
		return custom_username;
	}

	public void setCustom_username(String customUsername) {
		custom_username = customUsername;
	}

	public String getCustom_password() {
		return custom_password;
	}

	public void setCustom_password(String customPassword) {
		custom_password = customPassword;
	}

	public int getCustom_yezhuID() {
		return custom_yezhuID;
	}

	public void setCustom_yezhuID(int customYezhuID) {
		custom_yezhuID = customYezhuID;
	}

	private int yezhuID;
	private String yezhu_homesnumber;
	private String yezhu_name;
	private String yezhu_sex;
	private int yezhu_age;
	private String yezhu_tel;
	private String yezhu_phone;
	private String yezhu_IDC;
	private String yezhu_member;
	private Date yezhu_date;
	private String yezhu_memo;
	private int yezhu_custom_account;
	
	private String name;
	private String number;
	
	private static String search_name;
	private static String search_number;
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public int getYezhuID() {
		return yezhuID;
	}

	public void setYezhuID(int yezhuID) {
		this.yezhuID = yezhuID;
	}

	public String getYezhu_homesnumber() {
		return yezhu_homesnumber;
	}

	public void setYezhu_homesnumber(String yezhuHomesnumber) {
		yezhu_homesnumber = yezhuHomesnumber;
	}

	public String getYezhu_name() {
		return yezhu_name;
	}

	public void setYezhu_name(String yezhuName) {
		yezhu_name = yezhuName;
	}

	public String getYezhu_sex() {
		return yezhu_sex;
	}

	public void setYezhu_sex(String yezhuSex) {
		yezhu_sex = yezhuSex;
	}

	public int getYezhu_age() {
		return yezhu_age;
	}

	public void setYezhu_age(int yezhuAge) {
		yezhu_age = yezhuAge;
	}

	public String getYezhu_tel() {
		return yezhu_tel;
	}

	public void setYezhu_tel(String yezhuTel) {
		yezhu_tel = yezhuTel;
	}

	public String getYezhu_phone() {
		return yezhu_phone;
	}

	public void setYezhu_phone(String yezhuPhone) {
		yezhu_phone = yezhuPhone;
	}

	public String getYezhu_IDC() {
		return yezhu_IDC;
	}

	public void setYezhu_IDC(String yezhuIDC) {
		yezhu_IDC = yezhuIDC;
	}

	public String getYezhu_member() {
		return yezhu_member;
	}

	public void setYezhu_member(String yezhuMember) {
		yezhu_member = yezhuMember;
	}

	public Date getYezhu_date() {
		return yezhu_date;
	}

	public void setYezhu_date(Date yezhuDate) {
		yezhu_date = yezhuDate;
	}

	public String getYezhu_memo() {
		return yezhu_memo;
	}

	public void setYezhu_memo(String yezhuMemo) {
		yezhu_memo = yezhuMemo;
	}

	public int getYezhu_custom_account() {
		return yezhu_custom_account;
	}

	public void setYezhu_custom_account(int yezhuCustomAccount) {
		yezhu_custom_account = yezhuCustomAccount;
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
	private int yezhu_count;


	public int getYezhu_count() {
		return yezhu_count;
	}

	public void setYezhu_count(int yezhuCount) {
		yezhu_count = yezhuCount;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int currentPage) {
		current_page = currentPage;
	}

	public String list_yezhu()
	{
		if(search_name==null)
		{
			search_name="%";
		}
		if(search_number==null)
		{
			search_number="%";
		}
		Yezhu_serviceImpl yezhu_s= new Yezhu_serviceImpl();
		int count = yezhu_s.count_yezhu("%"+search_name+"%", "%"+search_number+"%");
		this.yezhu_count =count;
		if(request.getParameter("p") == null ||request.getParameter("p").equals("first"))
		{ 
		firstResult = 0;
		List<Yezhu> yezhu = yezhu_s.list_yezhu(firstResult, 8, "%"+search_name+"%", "%"+search_number+"%");
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("yezhu", yezhu);
		this.current_page = 1;
		return "success";
		}
		
		if(request.getParameter("p").equals("next"))
		{
		if(firstResult == count-count%8)firstResult = count-count%8;
		//如果是尾页，则firstResult不自加
		else firstResult = firstResult+8;
		List<Yezhu> yezhu = yezhu_s.list_yezhu(firstResult, 8, "%"+search_name+"%", "%"+search_number+"%");
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("yezhu", yezhu);
		//System.out.println(request.getRequestURL());
		
		this.current_page = firstResult/8+1;
		
		return "success";
		}
		
		if(request.getParameter("p").equals("prior"))
		{
		if(firstResult == 0)firstResult=0;//如果是首页，不改变
		else firstResult = firstResult-8;
		List<Yezhu> yezhu = yezhu_s.list_yezhu(firstResult, 8, "%"+search_name+"%", "%"+search_number+"%");
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("yezhu", yezhu);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		if(request.getParameter("p").equals("last"))
		{
		firstResult =count-count%8;
		List<Yezhu> yezhu = yezhu_s.list_yezhu(firstResult, 8, "%"+search_name+"%", "%"+search_number+"%");
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("yezhu", yezhu);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		return null;
	}
	
	public void save_yezhu_searchinfo()
	{
		search_name = this.name;
		search_number = this.number;
	}
	
	public void delete_yezhu()
	{
		try
		{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();	
		Yezhu_serviceImpl yezhu_s = new Yezhu_serviceImpl();
		Homes_serviceImpl homes_s = new Homes_serviceImpl();
		yezhu_s.delete_yezhu(Integer.parseInt(request.getParameter("id")));
		System.out.println("编号："+request.getParameter("id"));
		System.out.println("门牌号："+request.getParameter("number"));
		homes_s.ruzhu_homes(request.getParameter("number"), "无", "未入住");
		out.print("业主删除成功");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public String detail_yezhu()
	{
		Custom_account_serviceImpl c_a_s = new Custom_account_serviceImpl();
		Yezhu_serviceImpl yezhu_s = new Yezhu_serviceImpl();
		int len=c_a_s.search_yezhu_account(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("len",len);
		List<Yezhu> yezhu = yezhu_s.detail_yezhu(Integer.parseInt(request.getParameter("id")));
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("yezhu", yezhu);
		return "success";
	}
	
	public String modify_yezhu()
	{
		Yezhu_serviceImpl yezhu_s = new Yezhu_serviceImpl();
		List<Yezhu> yezhu = yezhu_s.detail_yezhu(Integer.parseInt(request.getParameter("id")));
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("yezhu", yezhu);
		return "success";
	}
	
	public void submit_modify()
	{
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Yezhu_serviceImpl yezhu_s = new Yezhu_serviceImpl();
		Homes_serviceImpl homes_s = new Homes_serviceImpl();
		yezhu_s.modify_yezhu(this.yezhuID, this.yezhu_name, this.yezhu_homesnumber, this.yezhu_sex, this.yezhu_age, this.yezhu_tel, this.yezhu_phone, this.yezhu_IDC, this.yezhu_member, this.yezhu_date, this.yezhu_memo);
		homes_s.ruzhu_homes(yezhu_homesnumber, this.yezhu_name, "已入住");
		out.print("修改成功");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void add_custom_account()
	{
		try{
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			Custom_account_serviceImpl c_a_s = new Custom_account_serviceImpl();
			System.out.println("账号数量"+c_a_s.search_yezhu_account(this.custom_yezhuID));
			if(c_a_s.search_yezhu_account(this.custom_yezhuID)>0)
			{
			   c_a_s.delete_custom_account(this.custom_yezhuID);
			}
			c_a_s.add_custom_account(this.custom_username, this.custom_password, this.custom_yezhuID);
			out.print("账号分配成功");
			}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			}
	}
	
	
	public String yezhu_info()
	{   
		Yezhu_serviceImpl yezhu_s = new Yezhu_serviceImpl();
		List<Yezhu> yezhu = yezhu_s.detail_yezhu(Integer.parseInt(request.getParameter("id")));
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("yezhu", yezhu);
		return "success";
	}
	
	public String search_yezhuinfo()
	{
		Yezhu_serviceImpl yezhu_s = new Yezhu_serviceImpl();
		HttpSession session = request.getSession();
		List<Yezhu> yezhu = yezhu_s.detail_yezhuinfo((String)(session.getAttribute("yezhu_number")));
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("yezhu", yezhu);
		return "success";
	}
	

}
