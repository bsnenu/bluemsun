package www.bluemsun.bank.model;

import com.jfinal.plugin.activerecord.Model;

public class Person extends Model<Person> {

	private static final long serialVersionUID = 1L;
	
	public static final Person dao = new Person();
}
