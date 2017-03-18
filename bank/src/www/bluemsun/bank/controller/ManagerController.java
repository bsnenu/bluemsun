package www.bluemsun.bank.controller;

import www.bluemsun.bank.interceptor.AdminLoginInterceptor;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

@Before(AdminLoginInterceptor.class)
public class ManagerController extends Controller {

}
