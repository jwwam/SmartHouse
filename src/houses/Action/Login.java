package houses.Action;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import houses.Base.Yezhu;
import houses.Dao.*;

import org.apache.struts2.ServletActionContext;



import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class Login extends ActionSupport{

	private String loginname;
	private String pwd;
	private String check;
	private HttpServletRequest request;
	
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
	@SuppressWarnings("unchecked")
	public  String checkLogin()
	{   
	    
		Admin_account_serviceImpl admin_account_service= new Admin_account_serviceImpl();
		Custom_account_serviceImpl custom_account_service = new Custom_account_serviceImpl();
		//验证管理员登录
		if(this.check.equals("admin")&&admin_account_service.loginCheck(this.loginname, this.pwd))
		{   
			request=ServletActionContext.getRequest(); 
    	    HttpSession sess = request.getSession();
    	    sess.setAttribute("username", this.loginname);
    	    String user = admin_account_service.admin_name(this.loginname);
    	    sess.setAttribute("user",user);
    	    sess.setAttribute("custom_user", null);
    		return "admin";
		}
		//验证住户登录
		if(this.check.equals("custom")&&custom_account_service.customLoginCheck(this.loginname, this.pwd))
		{	
			request=ServletActionContext.getRequest(); 
    	    HttpSession sess = request.getSession();
    	    List<Yezhu> yezhu = custom_account_service.search_yezhu_number(this.loginname, this.pwd);
    	    for(Iterator iter=yezhu.iterator();iter.hasNext();)
			{
    	    	Yezhu y = (Yezhu)iter.next();
    	    	sess.setAttribute("yezhu_id", y.getYezhuID());
	    	    sess.setAttribute("yezhu_name", y.getYezhu_name());
	    	    sess.setAttribute("yezhu_number", y.getYezhu_homesnumber());
	    	    sess.setAttribute("custom_user", this.loginname);
	    	    sess.setAttribute("user", null);
    	    
			}
    	    
    		return "custom";
			
		}
		else return "error";
	
	}
	
}