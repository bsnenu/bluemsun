package www.bluemsun.bank.controller;

import java.util.List;

import www.bluemsun.bank.interceptor.AdminLoginInterceptor;
import www.bluemsun.bank.model.Person;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

@Before(AdminLoginInterceptor.class)
public class AdminPersonController extends Controller {

	public void index(){
		List<Person> personList = Person.dao.find("select * from t_person");
		setAttr("personList", personList);
		render("person.jsp");
	}
	
	public void addPerson(){
		render("addPerson.jsp");
	}
	public void add(){
		Person person = getModel(Person.class);
		System.out.println(person);
		person.save();
		List<Person> personList = Person.dao.find("select * from t_person");
		setAttr("personList", personList);
		render("person.jsp");
	}
	public void updatePerson(){
		int pid = getParaToInt("pid",0);
		Person person = Person.dao.findById(pid);
		setAttr("person", person);
		render("addPerson.jsp");
	}
	
	public void update(){
		Person person = getModel(Person.class);
		person.update();
		List<Person> personList = Person.dao.find("select * from t_person");
		setAttr("personList", personList);
		render("person.jsp");
	}
	public void remove(){
		int pid = getParaToInt("pid",0);
		Person.dao.deleteById(pid);
		List<Person> personList = Person.dao.find("select * from t_person");
		setAttr("personList", personList);
		render("person.jsp");
	}
}
