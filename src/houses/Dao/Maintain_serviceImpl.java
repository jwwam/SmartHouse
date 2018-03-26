package houses.Dao;

import houses.Base.Maintain;
import houses.Base.Notify;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Maintain_serviceImpl implements Maintain_service {

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
	public List<Maintain> List_maintain(int firstResult, int maxResult) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Maintain m order by m.maintain_sdate DESC");
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			List<Maintain> maintain = query.list();
			System.out.println("报修分页共"+maintain.size()+"条");
	        tx.commit();
	        
	        return maintain;
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
	public int Maintain_count() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Maintain");
			List<Maintain> maintain = query.list();
			System.out.println("报修总共"+maintain.size()+"条");
	        tx.commit();
	        
	        return maintain.size();
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
	public void Add_maintain(String thing, String homesnumber,
			Date sdate, String smemo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Maintain maintain = new Maintain();
			maintain.setMaintain_thing(thing);
			maintain.setMaintain_status("已报修");
			maintain.setMaintain_homesnumber(homesnumber);
			maintain.setMaintain_sdate(sdate);
			maintain.setMaintain_smemo(smemo);
			maintain.setMaintain_scost(0);
			maintain.setMaintain_tcost(0);
	        
			session.save(maintain);
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
	public List<Maintain> Detail_maintain(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Maintain m where m.maintainID =?");
			query.setParameter(0, id);
			List<Maintain> maintain = query.list();
			
	        tx.commit();
	        
	        return maintain;
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
	public List<Maintain> Un_maintain() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Maintain m where m.maintain_status =? order by m.maintain_sdate DESC");
			query.setParameter(0, "已报修");
			List<Maintain> maintain = query.list();
			
	        tx.commit();
	        
	        return maintain;
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
	public void Do_maintain(int maintainid, String maintainer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Maintain m where m.maintainID =?");
			query.setParameter(0,maintainid);
			List<Maintain> maintain = query.list();
			for(Iterator iter=maintain.iterator();iter.hasNext();)
			{
				Maintain m =(Maintain)iter.next();
				m.setMaintain_status("已安排");
				m.setMaintainer(maintainer);
				
				session.save(m);
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
	public List<Maintain> go_maintain() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Maintain m where m.maintain_status =? order by m.maintain_sdate DESC");
			query.setParameter(0, "已安排");
			List<Maintain> maintain = query.list();
			
	        tx.commit();
	        
	        return maintain;
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
	public void Result_maintain(int maintainid, String status, int tcost,
			int scost, String rmemo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			Date today = new Date();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Maintain m where m.maintainID =?");
			query.setParameter(0,maintainid);
			List<Maintain> maintain = query.list();
			for(Iterator iter=maintain.iterator();iter.hasNext();)
			{
				Maintain m =(Maintain)iter.next();
				m.setMaintain_status(status);
				m.setMaintain_tcost(tcost);
				m.setMaintain_scost(scost);
				m.setMaintain_rmemo(rmemo);
				m.setMaintain_rdate(today);
				
				session.save(m);
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
	public List<Maintain> yezhu_maintain(String number) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Maintain m where m.maintain_homesnumber =? order by m.maintain_sdate desc");
			query.setParameter(0, number);
			List<Maintain> maintain = query.list();
			
	        tx.commit();
	        
	        return maintain;
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
