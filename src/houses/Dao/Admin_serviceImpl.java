package houses.Dao;

import houses.Base.Admin;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Admin_serviceImpl implements Admin_service {

	private static SessionFactory sessionFactory;
	static{
		try{
			Configuration config  = new Configuration().configure();
		    sessionFactory = config.buildSessionFactory();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	@Override
	public List search(int id) {
		// TODO Auto-generated method stub
		List adminlist = null;
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		
		try{
		tx = session.beginTransaction();
		Query query = session.createQuery("from Admin");
		adminlist = query.list();
		
		if(adminlist.size()>0)
			System.out.print("YESdasdasdasdasdasd");
		
		for(Iterator iter=adminlist.iterator();iter.hasNext();)
        {	
			System.out.print("2222222");
        	Admin admin = (Admin)iter.next();
        	System.out.print(admin.getAdmin_name());
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
		
		return adminlist;
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub

	}

}
