package houses.Action;

import houses.Base.Cars;
import houses.Dao.CarsServiceImpl;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CarsAction extends ActionSupport implements ServletRequestAware,
		ServletResponseAware {
	 private Integer id;
     private String carowner;
     private String carspace;
     private String housenumber;
     private String licensenumber;
     private String contactway;
     private String carmsg;
     private Date enddate;
     
     

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCarowner() {
		return carowner;
	}

	public void setCarowner(String carowner) {
		this.carowner = carowner;
	}

	public String getCarspace() {
		return carspace;
	}

	public void setCarspace(String carspace) {
		this.carspace = carspace;
	}

	public String getHousenumber() {
		return housenumber;
	}

	public void setHousenumber(String housenumber) {
		this.housenumber = housenumber;
	}

	public String getLicensenumber() {
		return licensenumber;
	}

	public void setLicensenumber(String licensenumber) {
		this.licensenumber = licensenumber;
	}

	public String getContactway() {
		return contactway;
	}

	public void setContactway(String contactway) {
		this.contactway = contactway;
	}

	public String getCarmsg() {
		return carmsg;
	}

	public void setCarmsg(String carmsg) {
		this.carmsg = carmsg;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
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
		this.request = arg0;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}

	
	private static int firstResult;
	private int currentPage;
	private int carsCount;
 
	public int getCarsCount() {
		return carsCount;
	}

	public void setCarsCount(int carsCount) {
		this.carsCount = carsCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String listCars(){
		CarsServiceImpl carsS = new CarsServiceImpl();
		int count = carsS.countCars();
		this.carsCount = count;
		if(request.getParameter("p") == null ||request.getParameter("p").equals("first"))
		{ 
		firstResult = 0;
		List<Cars> cars = carsS.listCars(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("cars", cars);
		this.currentPage = 1;
		return "success";
		}
		
		if(request.getParameter("p").equals("next"))
		{
		if(firstResult == count-count%8)firstResult = count-count%8;
		//如果是尾页，则firstResult不自加
		else firstResult = firstResult+8;
		List<Cars> cars = carsS.listCars(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("cars", cars);
		//System.out.println(request.getRequestURL());
		
		this.currentPage = firstResult/8+1;
		
		return "success";
		}
		
		if(request.getParameter("p").equals("prior"))
		{
		if(firstResult == 0)firstResult=0;//如果是首页，不改变
		else firstResult = firstResult-8;
		List<Cars> cars = carsS.listCars(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("cars", cars);
		//System.out.println(request.getRequestURL());
		this.currentPage = firstResult/8+1;
		return "success";
		}
		
		if(request.getParameter("p").equals("last"))
		{
		firstResult =count-count%8;
		List<Cars> cars = carsS.listCars(firstResult, 8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("cars", cars);
		//System.out.println(request.getRequestURL());
		this.currentPage = firstResult/8+1;
		return "success";
		}
		
		return null;
	}
	public void addCars()
	{
		try{
			System.out.println("++++++++++++++++++++++++++++++++++");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			CarsServiceImpl carsS = new CarsServiceImpl();
			carsS.addCars(carowner, carspace, housenumber, licensenumber, contactway, carmsg, enddate);
			out.print("车位登记成功");
			}catch(Exception e)
			{
				e.printStackTrace();
			}
	}
	
	public void deleteCars()
	{
		try{
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			CarsServiceImpl carsS = new CarsServiceImpl();
			carsS.deleteCars(Integer.parseInt(request.getParameter("p")));
			out.print("删除成功");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unused")
	private static SessionFactory sessionFactory;
	static{
		try{
		Configuration config = new Configuration().configure();
		sessionFactory = config.buildSessionFactory();
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings({ "unchecked", "unchecked" })
	public void updataCars(){
		try {
			request = ServletActionContext.getRequest();

			CarsServiceImpl CarsS = new CarsServiceImpl();
			CarsS.updataCars(this.id, this.carowner, this.carspace, this.housenumber, this.licensenumber, this.contactway, this.carmsg, this.enddate);
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print("更改成功");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
	
	
	public String modifyCars()
	{
		CarsServiceImpl CarsS = new CarsServiceImpl();
		List<Cars> cars = CarsS.modifyCars(Integer.parseInt(request.getParameter("id")));
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("cars", cars);
		return "success";
	}
}
