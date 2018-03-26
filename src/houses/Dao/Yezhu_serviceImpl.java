package houses.Dao;

import houses.Base.Homes;
import houses.Base.Yezhu;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Yezhu_serviceImpl implements Yezhu_service {
	
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
	public void add_yezhu(String name,String number, String sex, int age, String tel,
			String phone, String IDC, String member, Date date, String memo,
			int account) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
		    Yezhu yezhu = new Yezhu();
		    yezhu.setYezhu_name(name);
		    yezhu.setYezhu_homesnumber(number);
		    yezhu.setYezhu_sex(sex);
		    yezhu.setYezhu_age(age);
		    yezhu.setYezhu_tel(tel);
		    yezhu.setYezhu_phone(phone);
		    yezhu.setYezhu_IDC(IDC);
		    yezhu.setYezhu_member(member);
		    yezhu.setYezhu_date(date);
		    yezhu.setYezhu_memo(memo);
		    yezhu.setYezhu_custom_account(account);
	
		    
		    session.save(yezhu);

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
	public List<Yezhu> list_yezhu(int firstResult, int maxResult, String name,
			String homesnumber) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Yezhu y where y.yezhu_name like ? and y.yezhu_homesnumber like ?");
			query.setParameter(0, name);
			query.setParameter(1, homesnumber);
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			List<Yezhu> yezhu = query.list();
			System.out.println(yezhu.size());
			
	        tx.commit();
	        
	        return yezhu;
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
	public int count_yezhu(String name,
			String homesnumber) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Yezhu y where y.yezhu_name like ? and y.yezhu_homesnumber like ?");
			query.setParameter(0, name);
			query.setParameter(1, homesnumber);
			List<Yezhu> yezhu = query.list();
			
	        tx.commit();
	        
	        return yezhu.size();
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
	public void delete_yezhu(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Yezhu y where y.yezhuID =?");
			query.setParameter(0, id);
			List<Yezhu> yezhu = query.list();
			for(Iterator iter=yezhu.iterator();iter.hasNext();)
			{
				Yezhu y= (Yezhu)iter.next();
				session.delete(y);
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
	public List<Yezhu> detail_yezhu(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Yezhu y where y.yezhuID =?");
			query.setParameter(0, id);
			List<Yezhu> yezhu = query.list();
			
	        tx.commit();
	        
	        return yezhu;
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
	public void modify_yezhu(int id, String name, String number, String sex,
			int age, String tel, String phone, String IDC, String member,
			Date date, String memo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Yezhu y where y.yezhuID =?");
			query.setParameter(0, id);
			List<Yezhu> yezhu = query.list();
			for(Iterator iter=yezhu.iterator();iter.hasNext();)
			{
				Yezhu y= (Yezhu)iter.next();
				y.setYezhu_name(name);
				y.setYezhu_homesnumber(number);
				y.setYezhu_sex(sex);
				y.setYezhu_age(age);
				y.setYezhu_tel(tel);
				y.setYezhu_phone(phone);
				y.setYezhu_IDC(IDC);
				y.setYezhu_member(member);
				y.setYezhu_date(date);
				y.setYezhu_memo(memo);
				session.save(y);
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
	public void delete_yezhu_bynumber(String number) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Yezhu y where y.yezhu_homesnumber =?");
			query.setParameter(0, number);
			List<Yezhu> yezhu = query.list();
			for(Iterator iter=yezhu.iterator();iter.hasNext();)
			{
				Yezhu y= (Yezhu)iter.next();
				session.delete(y);
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
	public List<Yezhu> detail_yezhuinfo(String number) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Yezhu y where y.yezhu_homesnumber =?");
			query.setParameter(0, number);
			List<Yezhu> yezhu = query.list();
			
	        tx.commit();
	        
	        return yezhu;
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
