package www.bluemsun.bank.interceptor;

//import javax.servlet.http.HttpServletRequest;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

public class UserLoginInterceptor implements Interceptor{
	
	public void intercept(Invocation ai) {
		Controller controller = ai.getController();
		//HttpServletRequest request = controller.getRequest();
		
		try {
			if(controller.getSessionAttr("user")!=null){
				ai.invoke();
			}else{
				System.out.println("进入登录拦截器LoginInterceptor!");
				controller.setAttr("error", "请输入用户名和密码!");
				controller.render("/login.jsp");
			}
		} catch (Exception e) {
			
            }
		}
	}
