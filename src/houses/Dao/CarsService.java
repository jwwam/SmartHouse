package houses.Dao;

import houses.Base.Cars;

import java.util.Date;
import java.util.List;


public interface CarsService {
@SuppressWarnings("unchecked")
public List<Cars> listCars(int firstResult,int maxResult);//分页查询
	
	public int countCars();//车辆总记录数
	
	public void addCars(String carowner,String carspace,String housenumber,String licensenumber,String contactway,String carmsg,Date enddate);//车位登记
	
	public void deleteCars(int id);//删除车位信息
	
	public void updataCars(int id,String carowner,String carspace,String housenumber,String licensenumber,String contactway,String carmsg,Date enddate);
	
	public List<Cars> modifyCars(int id);
}
