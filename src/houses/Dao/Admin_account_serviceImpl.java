package houses.Dao;

import houses.Base.Admin;
import houses.Base.Admin_account;

import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Admin_account_serviceImpl implements Admin_account_service {

	
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
	@Override
	//管理员登录验证
	public Boolean loginCheck(String username,String password) {
		// TODO Auto-generated method stub
		Boolean r = false;
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			
			Query query = session.createQuery("from Admin_account a where a.admin_username =? and a.admin_password =?");
	        query.setParameter(0, username);
	        query.setParameter(1, password);
			List userlist = query.list();
			
			if(userlist.size()>0) r=true;
	        
	        tx.commit();
		}catch (Exception e) {
			// TODO: handle exception
			if(tx != null)
			{
				tx.rollback();
			}
		}finally{
			session.close();
		}
		
		return r;
	}
	@Override
	public String admin_name(String username) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			
			Query query = session.createQuery("from Admin_account a where a.admin_username =?");
	        query.setParameter(0, username);
			List userlist = query.list();
			for(Iterator iter=userlist.iterator();iter.hasNext();)
			{
				Admin_account Aa = (Admin_account)iter.next();
				Query query2 = session.createQuery("from Admin a where a.adminID =?");
		    	query2.setParameter(0, Aa.getAdmin_accountID());
		    	List<Admin> admin = query2.list();
		    	for(Iterator i=admin.iterator();i.hasNext();)
	    		{
	    			Admin a = (Admin)i.next();
	    			return a.getAdmin_name();
	    		}
			}
	        
	        tx.commit();
		}catch (Exception e) {
			// TODO: handle exception
			if(tx != null)
			{
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return null;
	}

}
