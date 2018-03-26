package houses.Action;

import houses.Base.Admin;
import houses.Base.Admin_account;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UpdataAdmin  extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	
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
		request = arg0;
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		response = arg0;
	}
	private int adminID;
	private String admin_name;
	private String admin_sex;
	private int admin_age;
	private String admin_tel;
	private String admin_phone;
	private String admin_addr;
	private String admin_memo;
	
	
	
	public int getAdminID() {
		return adminID;
	}
	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String adminName) {
		admin_name = adminName;
	}
	public String getAdmin_sex() {
		return admin_sex;
	}
	public void setAdmin_sex(String adminSex) {
		admin_sex = adminSex;
	}
	public int getAdmin_age() {
		return admin_age;
	}
	public void setAdmin_age(int adminAge) {
		admin_age = adminAge;
	}
	public String getAdmin_tel() {
		return admin_tel;
	}
	public void setAdmin_tel(String adminTel) {
		admin_tel = adminTel;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String adminPhone) {
		admin_phone = adminPhone;
	}
	public String getAdmin_addr() {
		return admin_addr;
	}
	public void setAdmin_addr(String adminAddr) {
		admin_addr = adminAddr;
	}
	public String getAdmin_memo() {
		return admin_memo;
	}
	public void setAdmin_memo(String adminMemo) {
		admin_memo = adminMemo;
	}
	
	
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
	@SuppressWarnings("unchecked")
	public void updataAdmin(){
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			
		tx = session.beginTransaction();
		
		Query query1 = session.createQuery("from Admin_account a where a.admin_accountID =?");
		query1.setParameter(0, this.adminID);
		//System.out.println(this.adminID);
		List<Admin_account> admin_account = query1.list();
		
		
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		for(Iterator iter=admin_account.iterator();iter.hasNext();)
		{
		Admin_account Aa = (Admin_account)iter.next();
		
		Query query2 = session.createQuery("from Admin a where a.adminID =?");
    	query2.setParameter(0, Aa.getAdmin_accountID());
    	List<Admin> admin = query2.list();
    	
    		for(Iterator i=admin.iterator();i.hasNext();)
    		{
    			Admin a = (Admin)i.next();
    			a.setAdmin_name(this.admin_name);
    			a.setAdmin_sex(this.admin_sex);
    			a.setAdmin_age(this.admin_age);
    			a.setAdmin_tel(this.admin_tel);
    			a.setAdmin_phone(this.admin_phone);
    			a.setAdmin_addr(this.admin_addr);
    			a.setAdmin_memo(this.admin_memo);
    			
    			session.save(a);
    		}
		}
		tx.commit();
		out.print("更改成功");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		}catch(Exception e)
		{
			if(tx != null)
			{
				tx.rollback();
			}
		}finally
		{
			session.close();
    		
		}
	}
}
