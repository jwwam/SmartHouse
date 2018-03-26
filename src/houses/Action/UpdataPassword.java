package houses.Action;

import houses.Base.Admin_account;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UpdataPassword extends ActionSupport implements ServletRequestAware,ServletResponseAware {
	
	private String oldpsd;
	private String newpsd;
	
	public String getOldpsd() {
		return oldpsd;
	}
	public void setOldpsd(String oldpsd) {
		this.oldpsd = oldpsd;
	}
	public String getNewpsd() {
		return newpsd;
	}
	public void setNewpsd(String newpsd) {
		this.newpsd = newpsd;
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
		request = arg0;
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		response = arg0;
	}
	
	@SuppressWarnings("unchecked")
	public void updatapsd()
	{   
		try{
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		SessionFactory sessionFactory;
		Configuration config = new Configuration().configure();
		sessionFactory = config.buildSessionFactory();
			
		Session session = sessionFactory.openSession();
		Transaction ts=session.beginTransaction();
		
		Query query = session.createQuery("from Admin_account a where a.admin_username =?");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession sess = request.getSession();
		String r =(String)sess.getAttribute("username");
		query.setParameter(0,r);
		
		List<Admin_account> adminlist = query.list();

		for(Iterator iter=adminlist.iterator();iter.hasNext();)
        {	
			Admin_account Aa = (Admin_account)iter.next();
			if(Aa.getAdmin_password().equals(this.oldpsd))
			{
				Aa.setAdmin_password(this.newpsd);
				session.save(Aa);
				
				ts.commit();
				session.close();
				out.print("修改成功!"+"\n"+"你的新密码为"+this.newpsd+"\n"+"请妥善保管!");
			}
			else
			{
				out.print("旧密码输入错误");
			}
        }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
