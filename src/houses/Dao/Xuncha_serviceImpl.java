package houses.Dao;

import houses.Base.Xuncha;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Xuncha_serviceImpl implements Xuncha_service {
	
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
	public List<Xuncha> List_xuncha(int firstResult, int maxResult) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Xuncha x order by x.xunchaID DESC");
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			List<Xuncha> xuncha = query.list();
			System.out.println("保安巡查共"+xuncha.size()+"条");
	        tx.commit();
	        
	        return xuncha;
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
	public int Count_xuncha() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Xuncha");
			List<Xuncha> xuncha = query.list();
			System.out.println("保安巡查共"+xuncha.size()+"条");
	        tx.commit();
	        
	        return xuncha.size();
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
	public void add_xuncha(String person, String type, Date time,
			String chuliren,String dangshiren,String result, String memo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			
			Xuncha xuncha = new Xuncha();
			xuncha.setXuncha_person(person);
			xuncha.setXuncha_type(type);
			xuncha.setXuncha_time(time);
			xuncha.setXuncha_chuliren(chuliren);
			xuncha.setXuncha_dangshiren(dangshiren);
			xuncha.setXuncha_result(result);
			xuncha.setXuncha_memo(memo);
			
			
			session.save(xuncha);
	        
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
	public List<Xuncha> detail_xuncha(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Xuncha x where x.xunchaID = ?");
			query.setParameter(0, id);
			List<Xuncha> xuncha = query.list();
	        tx.commit();
	        
	        return xuncha;
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
	public void modify_xuncha(int id, String person, String type, Date time,
			String chuliren, String dangshiren, String result, String memo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Xuncha x where x.xunchaID = ?");
			query.setParameter(0, id);
			List<Xuncha> xuncha = query.list();
			for(Iterator iter=xuncha.iterator();iter.hasNext();)
			{
				Xuncha x = (Xuncha)iter.next();
				x.setXuncha_person(person);
				x.setXuncha_type(type);
				x.setXuncha_time(time);
				x.setXuncha_chuliren(chuliren);
				x.setXuncha_dangshiren(dangshiren);
				x.setXuncha_result(result);
				x.setXuncha_memo(memo);
				
				session.save(x);
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
	}

	@Override
	public void delete_xuncha(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Xuncha x where x.xunchaID = ?");
			query.setParameter(0, id);
			List<Xuncha> xuncha = query.list();
			for(Iterator iter=xuncha.iterator();iter.hasNext();)
			{
				Xuncha x = (Xuncha)iter.next();
				session.delete(x);
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
	}

}
