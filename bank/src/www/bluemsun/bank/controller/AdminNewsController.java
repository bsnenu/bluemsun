package www.bluemsun.bank.controller;

import java.util.Date;

import www.bluemsun.bank.interceptor.AdminLoginInterceptor;
import www.bluemsun.bank.model.News;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

@Before(AdminLoginInterceptor.class)
public class AdminNewsController extends Controller {

	public void index(){
		int nowPage = getParaToInt("nowPage",1);
		String search = getPara("search","");
		String sql = "from t_news ";
				
		if(search!=null&&search.length()>0){
			sql += "where nname like '%"+search+"%'";
		}
		Page<News> newsPage = News.dao.paginate(nowPage, 20,
				"select nid,nname,ntime ",sql);
		setAttr("nowPage", nowPage);
		setAttr("totalPage",newsPage.getTotalPage());
		setAttr("newsList", newsPage.getList());
		setAttr("totalRow", newsPage.getTotalRow());
		render("news.jsp");
	}
	
	public void addNews(){
		int nid = getParaToInt("nid",0);
		News news = News.dao.findById(nid);
		setAttr("news", news);
		render("addNews.jsp");
	}
	
	public void add(){
		News news = getModel(News.class);
		System.out.println(news);
		int nid = getParaToInt("nid",0);
		if(nid==0){
			news.set("ntime", new Date()).save();
		}else{
			news.set("nid", nid).set("ntime", new Date()).update();
		}
		this.renderJson("{\"message\":\"success!\"}");
	}
	
	public void remove(){
		int nid = getParaToInt("nid",0);
		News.dao.deleteById(nid);
		this.redirect("/admin/news");
	}
}
