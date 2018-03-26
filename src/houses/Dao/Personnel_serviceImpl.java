package houses.Dao;

import houses.Base.Maintain;
import houses.Base.Personnel;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Personnel_serviceImpl implements Personnel_service {
	
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
	public void Add_personnel(String name, int age, String sex, String idcard,
			String jiguan, String phone, String addr, String xueli,
			String gongling, String oldwork, String worktype, String daozhimemo,String status) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		Date today = new Date();
		try{
			tx = session.beginTransaction();
			Personnel p = new Personnel();
			p.setPersonnel_name(name);
			p.setPersonnel_age(age);
			p.setPersonnel_sex(sex);
			p.setPersonnel_idcard(idcard);
			p.setPersonnel_jiguan(jiguan);
			p.setPersonnel_phone(phone);
			p.setPersonnel_addr(addr);
			p.setPersonnel_xueli(xueli);
			p.setPersonnel_gongling(gongling);
			p.setPersonnel_oldwork(oldwork);
			p.setPersonnel_worktype(worktype);
			p.setPersonnel_daozhimemo(daozhimemo);
			p.setPersonnel_status(status);
			
			p.setPersonnel_update(today);
			session.save(p);
			
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
	public List<Personnel> List_personnel(int firstResult, int maxResult) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Personnel p order by p.personnel_update DESC");
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			List<Personnel> personnel = query.list();
			System.out.println("人事分页共"+personnel.size()+"条");
	        tx.commit();
	        
	        return personnel;
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
	public int Personnel_count() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Personnel");
			List<Personnel> personnel = query.list();
			System.out.println("人事信息共"+personnel.size()+"条");
	        tx.commit();
	        
	        return personnel.size();
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
	public List<Personnel> Detail_personnel(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Personnel p where p.personnelID=?");
			query.setParameter(0, id);
			List<Personnel> personnel = query.list();
	        
			tx.commit();
	        return personnel;
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
	public void Lizhi_personnel(int id, String lizhimemo, Date lizhidate) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Personnel p where p.personnelID=?");
			query.setParameter(0, id);
			List<Personnel> personnel = query.list();
			Date today=new Date();
			for(Iterator iter=personnel.iterator();iter.hasNext();)
			{
				Personnel p = (Personnel)iter.next();
				p.setPersonnel_lizhidate(lizhidate);
				p.setPersonnel_lizhimemo(lizhimemo);
				p.setPersonnel_status("已离职");
				
				p.setPersonnel_update(today);
				
				session.save(p);
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
	public void Ruzhi_personnel(int id, String worktype, String daozhimemo,
			Date daozhidate) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			Date today = new Date();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Personnel p where p.personnelID=?");
			query.setParameter(0, id);
			List<Personnel> personnel = query.list();
			for(Iterator iter=personnel.iterator();iter.hasNext();)
			{
				Personnel p = (Personnel)iter.next();
				p.setPersonnel_worktype(worktype);
				p.setPersonnel_daozhimemo(daozhimemo);
				p.setPersonnel_daozhidate(daozhidate);
				p.setPersonnel_status("在职");
				
				p.setPersonnel_update(today);
				session.save(p);
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
	public void Modify_personnel(int id, String name, int age, String sex,
			String idcard, String jiguan, String phone, String addr,
			String xueli, String gongling, String oldwork, String worktype,
			String daozhimemo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			Date today = new Date();
			tx = session.beginTransaction();
			Query query = session.createQuery("from Personnel p where p.personnelID=?");
			query.setParameter(0, id);
			List<Personnel> personnel = query.list();
			for(Iterator iter=personnel.iterator();iter.hasNext();)
			{
				Personnel p = (Personnel)iter.next();
				p.setPersonnel_name(name);
				p.setPersonnel_age(age);
				p.setPersonnel_sex(sex);
				p.setPersonnel_idcard(idcard);
				p.setPersonnel_jiguan(jiguan);
				p.setPersonnel_phone(phone);
				p.setPersonnel_addr(addr);
				p.setPersonnel_xueli(xueli);
				p.setPersonnel_gongling(gongling);
				p.setPersonnel_oldwork(oldwork);
				p.setPersonnel_worktype(worktype);
				p.setPersonnel_daozhimemo(daozhimemo);
				
				p.setPersonnel_update(today);
				session.save(p);
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
	public List<Personnel> Search_personnel(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			System.out.println(name);
			Query query = session.createQuery("from Personnel p where p.personnel_name like ?");
			query.setParameter(0, name);
			List<Personnel> personnel = query.list();
			System.out.println("姓名查询共"+personnel.size()+"条");
	        tx.commit();
	        
	        return personnel;
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
	public List worker_list(String worktype) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("select p.personnel_name from Personnel p where p.personnel_worktype = ? and p.personnel_status = ?");
			query.setParameter(0, worktype);
			query.setParameter(1, "在职");
			List personnel = query.list();
			System.out.println("姓名查询共"+personnel.size()+"条");
	        tx.commit();
	        
	        return personnel;
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
