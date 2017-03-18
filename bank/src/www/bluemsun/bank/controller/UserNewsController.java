package www.bluemsun.bank.controller;


import java.util.List;

import www.bluemsun.bank.interceptor.UserLoginInterceptor;
import www.bluemsun.bank.model.News;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

@Before(UserLoginInterceptor.class)
public class UserNewsController extends Controller {

	public void getNewsById(){
		int nid = getParaToInt("nid",0);
		News news = News.dao.findFirst("select * from t_news where nid="+nid);
		setAttr("news", news);
		render("news_list_one.jsp");
	}
	
	public void getNewsList(){
		List<News> newsList = News.dao.find("select * from t_news");
		setAttr("newsList", newsList);
		render("news_list.jsp");
	}
}
