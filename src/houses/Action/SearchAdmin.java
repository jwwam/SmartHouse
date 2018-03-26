package houses.Action;

import houses.Base.Admin;
import houses.Base.Admin_account;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SearchAdmin extends ActionSupport{
	
private static SessionFactory sessionFactory;
static{
	try{
	Configuration config = new Configuration().configure();
	sessionFactory = config.buildSessionFactory();
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	}
	
	@SuppressWarnings("unchecked")
	public String searchInfo()
	{
		Session session = sessionFactory.openSession();
		Transaction tx  = null;
		try {
	
		tx = session.beginTransaction();
		/*Query query = session.createQuery("from Custom_account");
		List<Custom_account> adminlist = query.list();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("adminlist",adminlist);*/
		
		Query query1 = session.createQuery("from Admin_account a where a.admin_username =?");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession sess = request.getSession();
		String r =(String)sess.getAttribute("username");
		//System.out.print(r);
		query1.setParameter(0,r);
		
		
		
		List<Admin_account> adminlist = query1.list();

		for(Iterator iter=adminlist.iterator();iter.hasNext();)
        {	
			Admin_account Aa = (Admin_account)iter.next();
        	
        	Query query2 = session.createQuery("from Admin a where a.adminID =?");
        	query2.setParameter(0, Aa.getAdmin_accountID());
        	List<Admin> admin = query2.list();
        	
        	HttpServletRequest req = ServletActionContext.getRequest();
    		req.setAttribute("admin",admin);
        	
        }
		tx.commit();
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
		return "success";
	}
		
}
