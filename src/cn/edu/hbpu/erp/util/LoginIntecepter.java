package cn.edu.hbpu.erp.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.hbpu.erp.pojo.Admin;

public class LoginIntecepter implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		//���ִ��֮��

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// �������֮��ִ��
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		// ����֮ǰִ��
		//�ж�Session������û�е�½����Ϣ,�жϷ��ʵ�Url
		HttpSession session=request.getSession();
		Admin  adminuser = (Admin) session.getAttribute("admin");
		String uri=request.getRequestURI();
		// System.out.println(uri);
		if(uri.endsWith("login.action")||uri.endsWith("login.jsp")||uri.endsWith("login")||uri.endsWith("Login")||uri.endsWith(".css")){
			return true;
		}else if(adminuser !=null){
		 	//System.out.println(adminuser);
			return true;
		}else{
			   // String localUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
			  //System.out.println(localUrl  );
			 //response.sendRedirect("/login");
			 request.getRequestDispatcher("/login").forward(request, response);
			 return false;
		}
		 
		 
	}

}
