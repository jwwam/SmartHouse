package houses.Action;

import houses.Base.Notify;
import houses.Dao.Notify_serviceImpl;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.googlecode.jsonplugin.annotations.JSON;

@SuppressWarnings("serial")
public class NotifyAction extends ActionSupport implements ServletRequestAware,
		ServletResponseAware {

	private String notify_uper;
	private Date notify_date;
	private static int firstResult;
	private int notify_count;
	private int current_page;

	public int getNotify_count() {
		return notify_count;
	}

	public void setNotify_count(int notifyCount) {
		notify_count = notifyCount;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int currentPage) {
		current_page = currentPage;
	}

	private HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}

	private HttpServletResponse response;
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		response = arg0;
	}

	private int notifyID;
	private String notify_title;
	private String notify_content;

	@JSON
	public String getNotify_title() {
		return notify_title;
	}

	public void setNotify_title(String notifyTitle) {
		notify_title = notifyTitle;
	}

	public String getNotify_content() {
		return notify_content;
	}

	public void setNotify_content(String notifyContent) {
		notify_content = notifyContent;
	}

	public int getNotifyID() {
		return notifyID;
	}

	public void setNotifyID(int notifyID) {
		this.notifyID = notifyID;
	}

	public String Add() {
		try{
		Date today = new Date();
		this.notify_date = today;
		request = ServletActionContext.getRequest();
		HttpSession sess = request.getSession();
		String s = (String) sess.getAttribute("user");
		this.notify_uper = s;

		Notify_serviceImpl notify_s = new Notify_serviceImpl();
		notify_s.Add_notify(this.notify_content, this.notify_date,
				this.notify_title, this.notify_uper);
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print("添加成功");
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return null;
	}

	public String List_notify() {
		//System.out.println(request);
		//System.out.println(request.getRequestURL());
		//System.out.println(request.getParameter("p"));
		Notify_serviceImpl notify_s = new Notify_serviceImpl();
		int count = notify_s.Notify_count();
		this.notify_count =count;
		if(request.getParameter("p") == null ||request.getParameter("p").equals("first"))
		{ 
		firstResult = 0;
		List<Notify> notify = notify_s.List_notify(firstResult,8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("notify", notify);
		this.current_page = 1;
		return "success";
		}
		
		if(request.getParameter("p").equals("next"))
		{
		if(firstResult == count-count%8)firstResult = count-count%8;
		//如果是尾页，则firstResult不自加
		else firstResult = firstResult+8;
		List<Notify> notify = notify_s.List_notify(firstResult,8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("notify", notify);
		//System.out.println(request.getRequestURL());
		
		this.current_page = firstResult/8+1;
		
		return "success";
		}
		
		if(request.getParameter("p").equals("prior"))
		{
		if(firstResult == 0)firstResult=0;//如果是首页，不改变
		else firstResult = firstResult-8;
		List<Notify> notify = notify_s.List_notify(firstResult,8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("notify", notify);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		if(request.getParameter("p").equals("last"))
		{
		firstResult =count-count%8;
		List<Notify> notify = notify_s.List_notify(firstResult,8);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("notify", notify);
		//System.out.println(request.getRequestURL());
		this.current_page = firstResult/8+1;
		return "success";
		}
		
		return null;
	}
	
	public String modify_notify()
	{
		Notify_serviceImpl notify_s = new Notify_serviceImpl();
		
		List<Notify> notify = notify_s.modify_notify(Integer.parseInt(request.getParameter("id")));
		System.out.println(notify);
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("notify", notify);
		return "success";
	}

	public void Updata_notify() {
		try {
			Date today = new Date();
			this.notify_date = today;
			request = ServletActionContext.getRequest();
			HttpSession sess = request.getSession();
			String s = (String) sess.getAttribute("user");
			this.notify_uper = s;

			Notify_serviceImpl notify_s = new Notify_serviceImpl();
			notify_s.Updata_notify(this.notifyID, this.notify_title,
						this.notify_content, this.notify_date, this.notify_uper);
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print("更新成功");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	public void Del_notify() {
		// System.out.println(request);
		// System.out.println(request.getRequestURI());
		// System.out.println(request.getParameter("id"));
		try{
		int ID = Integer.parseInt(request.getParameter("id"));
		Notify_serviceImpl notify_s = new Notify_serviceImpl();
		notify_s.Del_notify(ID);
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print("删除成功");
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public String new_notify()//最新公告
	{
		Notify_serviceImpl notify_s = new Notify_serviceImpl();
		List<Notify> notify = notify_s.new_notify();
		HttpServletRequest req = ServletActionContext.getRequest();
		req.setAttribute("notify", notify);
		return "success";
	}
	
}
