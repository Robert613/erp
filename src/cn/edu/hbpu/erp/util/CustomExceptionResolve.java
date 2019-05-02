package cn.edu.hbpu.erp.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerExceptionResolverComposite;

public class CustomExceptionResolve extends HandlerExceptionResolverComposite {
//�Զ����쳣������
	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception exception) {

        ModelAndView modelAndView=new ModelAndView();
        
        //�ж��쳣����
        if(exception != null){
        	 modelAndView.setViewName("/404");//��ת�������ҳ�� 
        } 
		return modelAndView;
	}

}
