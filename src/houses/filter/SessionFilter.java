package houses.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession session = request.getSession();
		String page = request.getServletPath();
		// 请求的是用户登录页面，或用户登录的action，响应请求
		if (page.contains("index.jsp")
				|| page.contains("Login")
				|| page.contains("Database")
			    || page.endsWith(".js")
				|| page.contains(".css") || page.contains(".jpg")
				|| page.contains(".png") || page.contains(".gif")||page.contains(".swf")) {
				arg2.doFilter(request, response);
		} 
		// 响应的不是用户登录页面，先判断用户是否登录，用户已登录，响应请求，未登录，则跳转到登录界面
		else {
			if (session.getAttribute("user") == null && session.getAttribute("custom_user") == null) 
			{
				System.out.println("未登陆");
				request.getRequestDispatcher("../body/error.jsp").forward(request,response);
			}
			else if(page.contains("custom.jsp") && session.getAttribute("custom_user") ==null)
			{
				System.out.println("请求业主页面,但是未登陆");
				request.getRequestDispatcher("../body/error.jsp").forward(request,response);
			}
			else if(page.contains("admin.jsp")  && session.getAttribute("user") ==null)
			{
				System.out.println("请求管理员页面,但是未登陆");
				request.getRequestDispatcher("../body/error.jsp").forward(request,response);
			}
			else 
			{
				System.out.println("session未失效 !");
				arg2.doFilter(request, response);
			}
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}