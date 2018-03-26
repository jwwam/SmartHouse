package houses.Dao;

import houses.Base.Homes;
import houses.Base.Wuyefei;
import houses.Base.Xuncha;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Wuyefei_serviceImpl implements Wuyefei_service {
	
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
	public List list_wuyefei(int firstResult, int maxResult,
			String year, String month) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Wuyefei w where w.wuyefei_year like ? and w.wuyefei_month like ? order by w.wuyefei_date desc");
			query.setParameter(0, year);
			query.setParameter(1, month);
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			List wuyefei = query.list();
	        
	        return wuyefei;
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
	public int count_wuyefei(String year, String month) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Wuyefei w where w.wuyefei_year like ? and w.wuyefei_month like ?");
			query.setParameter(0, year);
			query.setParameter(1, month);
			List<Wuyefei> wuyefei = query.list();
			
	        tx.commit();
	        return wuyefei.size();
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
	public void shengcheng_wuyefei(double danjia,String year,String month,String uper,String memo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query1 = session.createQuery("from Homes h where h.homes_sell =?");
			query1.setParameter(0, "已入住");
			List<Homes> homes = query1.list();
			for(Iterator iter=homes.iterator();iter.hasNext();)
			{
				
				Homes h = (Homes)iter.next();
				double a = h.getHomes_area()*danjia;
				Date date = new Date();
				Wuyefei w = new Wuyefei();
				w.setWuyefei_yezhu(h.getHomes_yezhu());
				w.setWuyefei_homes_number(h.getHomes_number());
				w.setWuyefei_danjia(danjia);
				w.setWuyefei_status("未缴纳");
				w.setWuyefei_year(year);
				w.setWuyefei_month(month);
				w.setWuyefei_money(a);
				w.setWuyefei_date(date);
				w.setWuyefei_uper(uper);
				w.setWuyefei_memo(memo);
				
				session.save(w);
				
				
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
	public int p_wuyefei(String year, String month) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Wuyefei w where w.wuyefei_year like ? and w.wuyefei_month like ?");
			query.setParameter(0, year);
			query.setParameter(1, month);
			List<Wuyefei> wuyefei = query.list();
			
	        tx.commit();
	        return wuyefei.size();
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
	public List<Wuyefei> detail_wuyefei(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Wuyefei w where w.wuyefeiID =?");
			query.setParameter(0, id);
			List<Wuyefei> wuyefei = query.list();
			
	        tx.commit();
	        return wuyefei;
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
	public void shouqu_wuyefei(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Wuyefei w where w.wuyefeiID =?");
			query.setParameter(0, id);
			List<Wuyefei> wuyefei = query.list();
			for(Iterator iter=wuyefei.iterator();iter.hasNext();)
			{
				Wuyefei w = (Wuyefei)iter.next();
				w.setWuyefei_status("已缴纳");
				session.save(w);
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
	public List<Wuyefei> new_wuyefei(String number) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Wuyefei w where w.wuyefei_homes_number = ? and w.wuyefei_status =? order by w.wuyefei_date desc");
			query.setParameter(0, number);
			query.setParameter(1, "未缴纳");
			List<Wuyefei> wuyefei = query.list();
			
			
			tx.commit();
			return wuyefei;
	       
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
