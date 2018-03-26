package houses.Dao;

import houses.Base.Homes;
import houses.Base.Lvhua;
import houses.Base.Notify;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Homes_serviceImpl implements Homes_service {
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
	public List<Homes> List_homes(int firstResult,int maxResult,String number,String sell,String huxing,int mianji,String danyuan,String louceng) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Homes h where h.homes_number like ? and h.homes_sell like ? and h.homes_type like ? and h.homes_area > ? and h.homes_danyuan like ? and h.homes_louceng like ? order by h.homesID desc");
			query.setParameter(0, number);
			query.setParameter(1, sell);
			query.setParameter(2, huxing);
			query.setParameter(3, mianji);
			query.setParameter(4, danyuan);
			query.setParameter(5, louceng);
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			List<Homes> homes = query.list();
			System.out.println(homes.size());
			
	        tx.commit();
	        
	        return homes;
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
	public void Add_homes(String lou,String number, String type, int area, String yezhu,
			String sell, String homesDanyuan, String loucheng, String chaoxiang, String memo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Homes homes = new Homes();
			homes.setHomes_lou(lou);
			homes.setHomes_number(number);
			homes.setHomes_type(type);
			homes.setHomes_area(area);
			homes.setHomes_yezhu(yezhu);
			homes.setHomes_danyuan(homesDanyuan);
			homes.setHomes_louceng(loucheng);
			homes.setHomes_chaoxiang(chaoxiang);
			homes.setHomes_memo(memo);
			homes.setHomes_sell(sell);
			
			session.save(homes);
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
	public int count_homes(String number,String sell,String huxing,int mianji,String danyuan,String louceng) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Homes h where h.homes_number like ? and h.homes_sell like ? and h.homes_type like ? and h.homes_area > ? and h.homes_danyuan like ? and h.homes_louceng like ?");
			query.setParameter(0, number);
			query.setParameter(1, sell);
			query.setParameter(2, huxing);
			query.setParameter(3, mianji);
			query.setParameter(4, danyuan);
			query.setParameter(5, louceng);
			List<Homes> homes = query.list();
			
	        tx.commit();
	        
	        return homes.size();
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
	public int number_homes(String number) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Homes h where h.homes_number=?");
			query.setParameter(0, number);
			List<Homes> homes = query.list();
			System.out.println(homes.size());
			
	        tx.commit();
	        
	        return homes.size();
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
	public void ruzhu_homes(String number,String yezhu,String sell){
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Homes h where h.homes_number = ?");
			query.setParameter(0, number);
			List<Homes> homes = query.list();
			for(Iterator iter=homes.iterator();iter.hasNext();)
			{
				Homes h = (Homes)iter.next();
				h.setHomes_yezhu(yezhu);
				h.setHomes_sell(sell);

				session.save(h);
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
	public List<Homes> detail_homes(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Homes h where h.homesID =?");
			query.setParameter(0, id);
			List<Homes> homes = query.list();
			
	        tx.commit();
	        
	        return homes;
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
	public void delete_homes(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Homes h where h.homesID =?");
			query.setParameter(0, id);
			List<Homes> homes = query.list();
			for(Iterator iter=homes.iterator();iter.hasNext();)
			{
				Homes h = (Homes)iter.next();
				session.delete(h);
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
