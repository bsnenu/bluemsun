package www.bluemsun.bank.controller;

import www.bluemsun.bank.interceptor.AdminLoginInterceptor;
import www.bluemsun.bank.model.Manager;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;

@Before(AdminLoginInterceptor.class)
public class AdminController extends Controller {

	@Clear(AdminLoginInterceptor.class)
	public void index(){
		render("login.jsp");
	}
	
	@Clear(AdminLoginInterceptor.class)
	public void login(){
		render("login.jsp");
	}
	@Clear(AdminLoginInterceptor.class)
	public void check(){
		Manager manager = getModel(Manager.class);
		String code = getPara("code");
		String vCode = (String)getSessionAttr("vCode");
		if(vCode!=null&&vCode.equalsIgnoreCase(code)){
			String sql = "select * from t_manager where mname='"
					+manager.getStr("mname").trim()+"' and mpwd='"+manager.getStr("mpwd").trim()+"'";
			Manager existManager = Manager.dao.findFirst(sql);
			if(existManager!=null){
					setSessionAttr("manager", existManager);
					this.redirect("/admin/main");
			}else{
				setAttr("error", "用户名或者密码错误");
				this.render("login.jsp");
			}
		}else{
			setAttr("error", "验证码错误");
			this.render("login.jsp");
		}
		
	}
	
	public void main(){
		this.render("main.jsp");
	}
	
	public void updateManagerPwd(){
		
		this.render("pwd.jsp");
	}
	
	public void updatePwd(){
		Manager manager = getSessionAttr("manager");
		
		if(manager!=null){
			String newPwd = getPara("newPwd","111111");
			String rePwd = getPara("rePwd","");
			if(!newPwd.equals(rePwd)){
				setAttr("error", "两次密码不一致");
				this.render("pwd.jsp");
			}else{
				manager.set("mpwd", newPwd).update();
				this.redirect("/admin/main");
			}
		}else{
			this.render("login.jsp");
		}
	}
	
	public void out(){
		getSession().invalidate();
		this.render("login.jsp");
	}
}
