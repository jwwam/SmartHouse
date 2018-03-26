package houses.Dao;

import houses.Base.Cars;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class CarsServiceImpl implements CarsService {
	private static SessionFactory sessionFactory;
	static{
		try {
			Configuration config = new Configuration().configure();
			sessionFactory = config.buildSessionFactory();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void addCars(String carowner, String carspace, String housenumber,
			String licensenumber, String contactway, String carmsg, Date enddate) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
		    Cars cars = new Cars();
		    cars.setCarowner(carowner);
		    cars.setCarspace(carspace);
		    cars.setHousenumber(housenumber);
		    cars.setLicensenumber(licensenumber);
		    cars.setContactway(contactway);
		    cars.setCarmsg(carmsg);
		    cars.setEnddate(enddate);
		    
		    session.save(cars);

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

	@SuppressWarnings("unchecked")
	@Override
	public int countCars() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Cars");
			List<Cars> cars = query.list();

	        tx.commit();
	        return cars.size();
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
	@SuppressWarnings("unchecked")
	@Override
	public void deleteCars(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Cars c where c.id = ?");
			query.setParameter(0, id);
			List<Cars> cars = query.list();
			for(Iterator iter=cars.iterator();iter.hasNext();)
			{
				Cars c = (Cars)iter.next();
				session.delete(c);
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Cars> listCars(int firstResult, int maxResult) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from Cars c order by c.id DESC");
			query.setFirstResult(firstResult);
			query.setMaxResults(maxResult);
			List<Cars> cars = query.list();
			System.out.println("车位记录共"+cars.size()+"条");
			tx.commit();
			return cars;
			
		} catch (Exception e) {
			if (tx !=null) {
				// TODO Auto-generated catch block
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return null;
	}


	@SuppressWarnings("unchecked")
	@Override
	public void updataCars(int id, String carowner, String carspace,
			String housenumber, String licensenumber, String contactway,
			String carmsg, Date enddate) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			System.out.println(id);
			Query query = session.createQuery("from Cars c where c.id = ?");
			query.setParameter(0,id);
			List<Cars> list = query.list();
			System.out.println(list.size());
			for(Iterator iter=list.iterator();iter.hasNext();)
			{
				Cars cars = (Cars)iter.next();
				cars.setCarmsg(carmsg);
				cars.setCarowner(carowner);
				cars.setCarspace(carspace);
				cars.setContactway(contactway);
				cars.setHousenumber(housenumber);
				cars.setEnddate(enddate);
				cars.setLicensenumber(licensenumber);
			
				session.save(cars);
	        
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Cars> modifyCars(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Cars c where c.id =?");
			query.setParameter(0,id);
			List<Cars> list = query.list();
			
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


}
