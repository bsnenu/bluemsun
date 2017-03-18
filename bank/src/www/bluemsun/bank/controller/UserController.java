package www.bluemsun.bank.controller;


import java.util.Date;
import java.util.List;

import www.bluemsun.bank.interceptor.UserLoginInterceptor;
import www.bluemsun.bank.model.Intro;
import www.bluemsun.bank.model.News;
import www.bluemsun.bank.model.Person;
import www.bluemsun.bank.model.User;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

@Before(UserLoginInterceptor.class)
public class UserController extends Controller {

	@Clear(UserLoginInterceptor.class)
	public void index(){
		render("login.jsp");
	}
	
	@Clear(UserLoginInterceptor.class)
	public void login(){
		this.render("login.jsp");
	}
	
	
	@Clear(UserLoginInterceptor.class)
	public void check(){
		User user = getModel(User.class);
		String code = getPara("code");
		String vCode = (String)getSessionAttr("vCode");
		if(vCode!=null&&vCode.equalsIgnoreCase(code)){
			User existUser = User.dao.findFirst("select * from t_user where uname='"+user.getStr("uname").trim()+"' and upwd='"+user.getStr("upwd").trim()+"'");
			if(existUser!=null){
				if(existUser.get("utime")==null){
					existUser.set("utime",new Date()).update();
				}
				setSessionAttr("user", existUser);
				this.redirect("/user/main");
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
		Page<News> newsPage = News.dao.paginate(1, 5,"select * ","from t_news ");
		setAttr("newsList", newsPage.getList());
		this.render("main.jsp");
	}
	
	public void personList(){
		List<Person> personList = Person.dao.find("select * from t_person");
		System.out.println(personList.size());
		setAttr("personList", personList);
		render("member_buy.jsp");
	}
	public void getIntro(){
		Intro intro = Intro.dao.findFirst("select * from t_intro");
		setAttr("intro", intro);
		render("comp_center.jsp");
	}
	public void userInfo(){
		User u = getSessionAttr("user");
		if(u!=null){
			User user = User.dao.findFirst("select u1.*,u2.uxm tjr from "
					+"t_user u1 left join t_relation re on u1.uid=re.cid "
					+"left join t_user u2 on u2.uid=re.pid where u1.uid="+u.getLong("uid"));
			setAttr("user", user);
		}
		render("person_info.jsp");
	}
	public void updateUserInfo(){
		User u = getSessionAttr("user");
		if(u!=null){
			User user = User.dao.findById(u.getLong("uid"));
			setAttr("user", user);
		}
		render("person_info_update.jsp");
	}
	public void updateInfo(){
		User user = getModel(User.class);
		user.update();
		this.redirect("/user/main");
	}
	public void updateUserPwd(){
		User u = getSessionAttr("user");
		if(u!=null){
			User user = User.dao.findById(u.getLong("uid"));
			setAttr("user", user);
		}
		render("person_info_psw_update.jsp");
	}
	public void updatePwd(){
		User u = getSessionAttr("user");
		if(u!=null){
			String newpwd = getPara("newpwd",u.getStr("upwd"));
			u.set("upwd", newpwd).update();
		}
		this.redirect("/user/main");
	}
	public void team(){
		User u = getSessionAttr("user");
		if(u!=null){
			int nowPage = getParaToInt("nowPage",1);
			Page<User> userPage = User.dao.paginate(nowPage, 15,"select u.* ","from t_relation re inner join t_user "
					+ "u on re.cid=u.uid where re.pid="+u.getLong("uid"));
			setAttr("nowPage", nowPage);
			setAttr("totalPage",userPage.getTotalPage());
			setAttr("totalRow",userPage.getTotalRow());
			setAttr("userList", userPage.getList());
		}
		this.render("my_team.jsp");
	}
	public void out(){
		getSession().invalidate();
		this.render("login.jsp");
	}
	
	public void freeQueue(){
		this.render("free_queue.jsp");
	}	
}
