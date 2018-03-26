package houses.Action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import houses.Base.Homes;
import houses.Dao.Homes_serviceImpl;
import houses.Dao.Yezhu_serviceImpl;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class HomesAction extends ActionSupport implements 

ServletRequestAware,ServletResponseAware{
	

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

	private String Homes_lou;
	private String Homes_number;
	private String Homes_type;
	private int Homes_area;
	private String Homes_yezhu;
	private String Homes_sell;
	private String Homes_danyuan;
	private String Homes_louceng;
	private String Homes_chaoxiang;
	private String Homes_memo;
	
	private String number;
	private String huxing;
	private int mianji;
	private String danyuan;
	private String louceng;
	
	
	public String getHomes_lou() {
		return Homes_lou;
	}
	public void setHomes_lou(String homesLou) {
		Homes_lou = homesLou;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	

	public String getHuxing() {
		return huxing;
	}
	public void setHuxing(String huxing) {
		this.huxing = huxing;
	}
	public int getMianji() {
		return mianji;
	}
	public void setMianji(int mianji) {
		this.mianji = mianji;
	}
	public String getDanyuan() {
		return danyuan;
	}
	public void setDanyuan(String danyuan) {
		this.danyuan = danyuan;
	}
	public String getLouceng() {
		return louceng;
	}
	public void setLouceng(String louceng) {
		this.louceng = louceng;
	}


	private static int firstResult;
	private static String searchcondition;
	private static String searchnumber;
	private static String searchhuxing;
	private static int searchmianji;
	private static String searchdanyuan;
	private static String searchlouceng;
	
	private int homes_count;
	private int current_page;
	
	
	public int getHomes_count() {
		return homes_count;
	}
	public void setHomes_count(int homesCount) {
		homes_count = homesCount;
	}
	public int getCurrent_page() {
		return current_page;
	}
	public void setCurrent_page(int currentPage) {
		current_page = currentPage;
	}

	
	private String homes_searchcondition;
	public String getHomes_searchcondition() {
		return homes_searchcondition;
	}
	public void setHomes_searchcondition(String homesSearchcondition) {
		homes_searchcondition = homesSearchcondition;
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
	public String getHomes_number() {
		return Homes_number;
	}
	public void setHomes_number(String homesNumber) {
		Homes_number = homesNumber;
	}
	public String getHomes_type() {
		return Homes_type;
	}
	public void setHomes_type(String homesType) {
		Homes_type = homesType;
	}
	public int getHomes_area() {
		return Homes_area;
	}
	public void setHomes_area(int homesArea) {
		Homes_area = homesArea;
	}
	
	public String getHomes_yezhu() {
		return Homes_yezhu;
	}
	public void setHomes_yezhu(String homesYezhu) {
		Homes_yezhu = homesYezhu;
	}
	public String getHomes_sell() {
		return Homes_sell;
	}
	public void setHomes_sell(String homesSell) {
		Homes_sell = homesSell;
	}
	public String getHomes_danyuan() {
		return Homes_danyuan;
	}
	public void setHomes_danyuan(String homesDanyuan) {
		Homes_danyuan = homesDanyuan;
	}

	public String getHomes_louceng() {
		return Homes_louceng;
	}
	public void setHomes_louceng(String homesLouceng) {
		Homes_louceng = homesLouceng;
	}
	public String getHomes_chaoxiang() {
		return Homes_chaoxiang;
	}
	public void setHomes_chaoxiang(String homesChaoxiang) {
		Homes_chaoxiang = homesChaoxiang;
	}
	public String getHomes_memo() {
		return Homes_memo;
	}
	public void setHomes_memo(String homesMemo) {
		Homes_memo = homesMemo;
	}
	
	public String List_homes()
	{
		Homes_serviceImpl homes_s = new Homes_serviceImpl();

		if(searchcondition == null)
		{
			searchcondition ="%";
		}
		if(searchnumber == null)
		{
			searchnumber ="%";
		}
		if(searchhuxing == null)
		{
			searchhuxing ="%";
		}
		if(searchdanyuan == null)
		{
			searchdanyuan ="%";
		}
		if(searchlouceng == null)
		{
			searchlouceng ="%";
		}
		
		System.out.println("面积"+searchmianji);

		System.out.println("查询条件:"+searchcondition+searchnumber);
		int count = homes_s.count_homes("%"+searchnumber+"%","%"+searchcondition+"%", "%"+searchhuxing+"%", searchmianji, "%"+searchdanyuan+"%", "%"+searchlouceng+"%");
		this.homes_count = count;
			if(request.getParameter("p") ==null||request.getParameter("p").equals("first"))
			{ 
			firstResult = 0;
			List<Homes> homes = homes_s.List_homes(firstResult,8,"%"+searchnumber+"%","%"+searchcondition+"%", "%"+searchhuxing+"%", searchmianji, "%"+searchdanyuan+"%", "%"+searchlouceng+"%");
			HttpServletRequest req = ServletActionContext.getRequest();
			req.setAttribute("homes", homes);
			this.current_page = 1;
			
			this.homes_searchcondition = searchcondition;
			return "success";
			}
			
			if(request.getParameter("p").equals("next"))
			{
			if(firstResult == count-count%8)firstResult = count-count%8;
			//如果是尾页，则firstResult不自加
			else firstResult = firstResult+8;
			List<Homes> homes = homes_s.List_homes(firstResult,8,"%"+searchnumber+"%","%"+searchcondition+"%", "%"+searchhuxing+"%", searchmianji, "%"+searchdanyuan+"%", "%"+searchlouceng+"%");
			HttpServletRequest req = ServletActionContext.getRequest();
			req.setAttribute("homes", homes);
			this.current_page = firstResult/8+1;
			
			this.homes_searchcondition = searchcondition;
			return "success";
			}
			
			if(request.getParameter("p").equals("prior"))
			{
			if(firstResult == 0)firstResult=0;//如果是首页，不改变
			else firstResult = firstResult-8;
			List<Homes> homes = homes_s.List_homes(firstResult,8,"%"+searchnumber+"%","%"+searchcondition+"%", "%"+searchhuxing+"%", searchmianji, "%"+searchdanyuan+"%", "%"+searchlouceng+"%");
			HttpServletRequest req = ServletActionContext.getRequest();
			req.setAttribute("homes", homes);
			this.current_page = firstResult/8+1;
			
			this.homes_searchcondition = searchcondition;
			return "success";
			}
			
			if(request.getParameter("p").equals("last"))
			{
			firstResult =count-count%8;
			List<Homes> homes = homes_s.List_homes(firstResult,8,"%"+searchnumber+"%","%"+searchcondition+"%", "%"+searchhuxing+"%", searchmianji, "%"+searchdanyuan+"%", "%"+searchlouceng+"%");
			HttpServletRequest req = ServletActionContext.getRequest();
			req.setAttribute("homes", homes);
			this.current_page = firstResult/8+1;
			
			this.homes_searchcondition = searchcondition;
			return "success";
			}
			
		return null;
	}
	
	public void savesearchinfo()//保存查询信息
	{

		searchcondition = this.homes_searchcondition;
		searchnumber = this.number;
		searchhuxing = this.huxing;
		searchmianji = this.mianji;
		searchdanyuan = this.danyuan;
		searchlouceng = this.louceng;
	}
	
	public void Add_homes()
	{
	try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Homes_serviceImpl homes_s = new Homes_serviceImpl();
		int t= homes_s.number_homes(this.Homes_number);
		if(t == 0)
		{
		homes_s.Add_homes(this.Homes_lou,this.Homes_number, this.Homes_type, this.Homes_area,"无", "未入住", this.Homes_danyuan, this.Homes_louceng, this.Homes_chaoxiang, this.Homes_memo);
		out.print("房产设置成功");
		}
		else{out.print("门牌号已存在");}
		
	   }catch (Exception e) {
		// TODO: handle exception
		   e.printStackTrace();
	   }
	}
	
	public void Add_yezhu()
	{
	   try{
		   response.setCharacterEncoding("utf-8");
		   PrintWriter out = response.getWriter();
		   Yezhu_serviceImpl yezhu_s = new Yezhu_serviceImpl();
		   Homes_serviceImpl homes_s = new Homes_serviceImpl();
		   
		   yezhu_s.add_yezhu(this.yezhu_name, this.yezhu_homesnumber, this.yezhu_sex, this.yezhu_age, this.yezhu_tel, this.yezhu_phone, this.yezhu_IDC, this.yezhu_member, this.yezhu_date, this.yezhu_memo, this.yezhu_custom_account);
		   homes_s.ruzhu_homes(this.yezhu_homesnumber,this.yezhu_name,"已入住");
		   out.print("登记入住成功");
	   }catch (Exception e) {
		// TODO: handle exception
		   e.printStackTrace();
	   }
		   
	}
	
	public String detail_homes()
	{	
		Homes_serviceImpl homes_s = new Homes_serviceImpl();
		List<Homes> homes =homes_s.detail_homes(Integer.parseInt(request.getParameter("id")));
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("homes", homes);
		return "success";
	}
	
	public void delete_homes()
	{
		System.out.println("要删除的门牌号"+request.getParameter("number"));
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(request.getParameter("number")==null)
		{
		Homes_serviceImpl homes_s = new Homes_serviceImpl();
		homes_s.delete_homes(Integer.parseInt(request.getParameter("id")));
		out.print("房产删除成功");
		}
		else
		{
			Homes_serviceImpl homes_s = new Homes_serviceImpl();
			Yezhu_serviceImpl yezhu_s = new Yezhu_serviceImpl();
			homes_s.delete_homes(Integer.parseInt(request.getParameter("id")));
			yezhu_s.delete_yezhu_bynumber(request.getParameter("number"));
			out.print("房产删除成功");
		}
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
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

}
