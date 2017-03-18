package www.bluemsun.bank.controller;

import java.awt.image.BufferedImage;


import www.bluemsun.bank.interceptor.UserLoginInterceptor;
import www.bluemsun.bank.util.VerifyCode;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;

public class IndexController extends Controller {

	public void index(){
		render("login.jsp");
	}
	
	public void vCode() throws Exception{
		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage();
		//System.out.println(vc.getText());
		VerifyCode.output(image, getResponse().getOutputStream());
		setSessionAttr("vCode", vc.getText());
		renderNull();
	}
	
}
