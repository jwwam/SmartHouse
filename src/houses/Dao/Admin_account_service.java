package houses.Dao;

public interface Admin_account_service {
	//管理员登录验证
	public Boolean loginCheck(String username,String password);
	
	public String admin_name(String username);//根据账户查找管理员的姓名
	
	

}
