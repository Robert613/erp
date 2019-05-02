package cn.edu.hbpu.erp.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerExceptionResolverComposite;

public class CustomExceptionResolve extends HandlerExceptionResolverComposite {
//自定义异常处理器
	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception exception) {

        ModelAndView modelAndView=new ModelAndView();
        
        //判断异常类型
        if(exception != null){
        	 modelAndView.setViewName("/404");//跳转到错误的页面 
        } 
		return modelAndView;
	}

}
