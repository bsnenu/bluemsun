package www.bluemsun.bank.controller;

import www.bluemsun.bank.interceptor.AdminLoginInterceptor;
import www.bluemsun.bank.model.Intro;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

@Before(AdminLoginInterceptor.class)
public class AdminIntroController extends Controller {

	public void index(){
		
		render("intro.jsp");
	}
	
	public void addIntro(){
		String iintro = getPara("iintro");
		
		Intro.dao.findById(1).set("iintro", iintro).update();
		
		this.renderJson("{\"message\":\"success!\"}");
	}
}
