package houses.Dao;

import houses.Base.Notify;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Notify_serviceImpl implements Notify_service {
	
	
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
	public void Add_notify(String content, Date date, String title, String uper) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			
			Notify notify = new Notify();
			notify.setNotify_content(content);
			notify.setNotify_title(title);
			notify.setNotify_uper(uper);
			notify.setNotify_date(date);
			
			session.save(notify);
	        
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
		
	}

	@Override
	public List<Notify> List_notify(int firstResult,int maxResult) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Notify n order by n.notify_date DESC");
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			List<Notify> notify = query.list();
			System.out.println("共"+notify.size()+"条");
	        tx.commit();
	        
	        return notify;
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

	@Override
	public void Updata_notify(int id, String title, String content, Date date,String uper) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			System.out.println(id);
			Query query = session.createQuery("from Notify n where n.notifyID = ?");
			query.setParameter(0,id);
			List<Notify> list = query.list();
			System.out.println(list.size());
			for(Iterator iter=list.iterator();iter.hasNext();)
			{
				Notify notify = (Notify)iter.next();
				notify.setNotify_content(content);
				notify.setNotify_title(title);
				notify.setNotify_uper(uper);
				notify.setNotify_date(date);
			
				session.save(notify);
	        
				tx.commit();
			}
		}catch (Exception e) {
			// TODO: handle exception
			if(tx != null)
			{
				tx.rollback();
			}
		}finally{
			session.close();
		}	
	
		
	}

	@Override
	public void Del_notify(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Notify n where n.notifyID = ?");
			query.setParameter(0,id);
			List<Notify> list = query.list();
			for(Iterator iter=list.iterator();iter.hasNext();)
			{
				Notify notify = (Notify)iter.next();
			
				session.delete(notify);
	        
				tx.commit();
			}
		}catch (Exception e) {
			// TODO: handle exception
			if(tx != null)
			{
				tx.rollback();
			}
		}finally{
			session.close();
		}
		
	}

	@Override
	public int Notify_count() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Notify");
			List<Notify> notify = query.list();
			System.out.println("共"+notify.size()+"条");
	        tx.commit();
	        
	        return notify.size();
		}catch (Exception e) {
			// TODO: handle exception
			if(tx != null)
			{
				tx.rollback();
			}
		}finally{
			session.close();
		}
		
		
		return 0;
	}

	@Override
	public List<Notify> modify_notify(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Notify n where n.notifyID =?");
			query.setParameter(0,id);
			List<Notify> list = query.list();
			
			tx.commit();
			return list;
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

	@Override
	public List<Notify> new_notify() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Notify n order by n.notify_date DESC");
			query.setFirstResult(0);
			query.setMaxResults(5);
			List<Notify> notify = query.list();
	        tx.commit();
	        
	        return notify;
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
