/**
 * 
 */
package www.bluemsun.bank.config;

import www.bluemsun.bank.controller.AdminController;
import www.bluemsun.bank.controller.AdminIntroController;
import www.bluemsun.bank.controller.AdminNewsController;
import www.bluemsun.bank.controller.AdminPersonController;
import www.bluemsun.bank.controller.AdminUserController;
import www.bluemsun.bank.controller.IndexController;
import www.bluemsun.bank.controller.UserController;
import www.bluemsun.bank.controller.UserNewsController;
import www.bluemsun.bank.model.Intro;
import www.bluemsun.bank.model.Manager;
import www.bluemsun.bank.model.News;
import www.bluemsun.bank.model.Person;
import www.bluemsun.bank.model.Relation;
import www.bluemsun.bank.model.User;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;


/**  
 * AppConfig配置文件
 * @Author: zhanggy
 * @Date: 2015年11月25日
 * @Version:V1.0
 */
public class AppConfig extends JFinalConfig {
	/**
	 * 配置常量
	 * @Discription:扩展说明
	 * @Author: zhanggy
	 * @Date: 2015年11月25日
	 * @see com.jfinal.config.JFinalConfig#configConstant(com.jfinal.config.Constants)
	 */
	@Override
	public void configConstant(Constants me) {
		//加载系统属性配置文件 随后可用getProperty(...)获取值
		loadPropertyFile("system_config_info.txt");
		//设置开发模式
		me.setDevMode(getPropertyToBoolean("devMode", false));
		//设置编码方式
		me.setEncoding("utf-8");
		//设置视图类型为Jsp，否则默认为FreeMarker
		me.setViewType(ViewType.JSP);
		//设置404和500错误页面 相对于项目webRoot根目录路径
		me.setError404View("/login.jsp");
		me.setError500View("/login.jsp");
	}

	/**
	 * 配置路由
	 * @Discription:扩展说明
	 * @Author: zhanggy
	 * @Date: 2015年11月25日
	 * @see com.jfinal.config.JFinalConfig#configRoute(com.jfinal.config.Routes)
	 */
	@Override
	public void configRoute(Routes me) {
		//第三个参数为该Controller的视图存放路径
		me.add("/", IndexController.class,"/");
		me.add("user", UserController.class,"/");
		me.add("user/news", UserNewsController.class,"/");
		
		me.add("admin", AdminController.class,"/admin");
		me.add("admin/user", AdminUserController.class,"/admin");
		me.add("admin/news", AdminNewsController.class,"/admin");
		me.add("admin/person", AdminPersonController.class,"/admin");
		me.add("admin/intro", AdminIntroController.class,"/admin");
		
		
		
	}

	/**
	 * 配置插件
	 * @Discription:扩展说明
	 * @Author: zhanggy
	 * @Date: 2015年11月25日
	 * @see com.jfinal.config.JFinalConfig#configPlugin(com.jfinal.config.Plugins)
	 */
	@Override
	public void configPlugin(Plugins me) {
		
		//配置Mysql支持
		//配置c3p0数据库连接池插件
		C3p0Plugin cp = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password"));
		me.add(cp);
		//配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
		//事务级别
		arp.setTransactionLevel(4);
		me.add(arp);
		
		//映射t_intro表到Intro模型
		arp.addMapping("t_intro","iid",Intro.class);
		
		//映射t_manager表到Manager模型
		arp.addMapping("t_manager","mid",Manager.class);
		
		//映射t_news表到News模型
		arp.addMapping("t_news","nid",News.class);
		
		//映射t_person表到Person模型
		arp.addMapping("t_person","pid",Person.class);
		
		//映射t_relation表到Relation模型
		arp.addMapping("t_relation","pid,cid",Relation.class);
		
		//映射t_user表到User模型
		arp.addMapping("t_user","uid",User.class);
		
	}

	/**
	 * 配置全局拦截器
	 * @Discription:扩展说明
	 * @Author: zhanggy
	 * @Date: 2015年11月25日
	 * @see com.jfinal.config.JFinalConfig#configInterceptor(com.jfinal.config.Interceptors)
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		//全局异常处理
		//me.add(new ExceptionInterceptor());
	}

	/**
	 * 配置处理器
	 * @Discription:扩展说明
	 * @Author: zhanggy
	 * @Date: 2015年11月25日
	 * @see com.jfinal.config.JFinalConfig#configHandler(com.jfinal.config.Handlers)
	 */
	@Override
	public void configHandler(Handlers me) {
		//处理后缀
		//me.add(new PostfixSkipHandler());
		me.add(new ContextPathHandler("basePath"));
	}
	
	/**
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebRoot", 8080, "/", 5);
	}

}
