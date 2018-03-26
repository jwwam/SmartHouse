package houses.Dao;

import houses.Base.Lvhua;
import houses.Base.Xuncha;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Lvhua_serviceImpl implements Lvhua_service {

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
	public List<Lvhua> List_lvhua(int firstResult, int maxResult) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Lvhua l order by l.lvhuaID DESC");
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			List<Lvhua> lvhua = query.list();
			System.out.println("绿化记录共"+lvhua.size()+"条");
	        tx.commit();
	        
	        return lvhua;
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
	public int count_lvhua() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Lvhua");
			List<Lvhua> lvhua = query.list();

	        tx.commit();
	        return lvhua.size();
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
	public void add_lvhua(String area, String style, String fuzheren,
			Date date, String status, String yanshouren, String memo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
		    Lvhua lvhua = new Lvhua();
		    lvhua.setLvhua_area(area);
		    lvhua.setLvhua_style(style);
		    lvhua.setLvhua_fuzheren(fuzheren);
		    lvhua.setLvhua_date(date);
		    lvhua.setLvhua_status(status);
		    lvhua.setLvhua_yanshouren(yanshouren);
		    lvhua.setLvhua_memo(memo);
		    
		    session.save(lvhua);

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
	public void delete_lvhua(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Lvhua l where l.lvhuaID = ?");
			query.setParameter(0, id);
			List<Lvhua> lvhua = query.list();
			for(Iterator iter=lvhua.iterator();iter.hasNext();)
			{
				Lvhua l = (Lvhua)iter.next();
				session.delete(l);
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
	public List<Lvhua> detail_lvhua(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Lvhua l where l.lvhuaID = ?");
			query.setParameter(0, id);
			List<Lvhua> lvhua = query.list();
	        tx.commit();
	        
	        return lvhua;
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
	public void yanshou_lvhua(int id, String yanshouren, String status,
			String memo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Lvhua l where l.lvhuaID = ?");
			query.setParameter(0, id);
			List<Lvhua> lvhua = query.list();
			for(Iterator iter=lvhua.iterator();iter.hasNext();)
			{
				Lvhua l = (Lvhua)iter.next();
			    l.setLvhua_yanshouren(yanshouren);
			    l.setLvhua_status(status);
			    l.setLvhua_memo(memo);
			    
				
				session.save(l);
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
