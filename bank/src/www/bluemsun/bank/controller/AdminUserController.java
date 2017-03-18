package www.bluemsun.bank.controller;

import java.util.UUID;

import www.bluemsun.bank.interceptor.AdminLoginInterceptor;
import www.bluemsun.bank.model.Relation;
import www.bluemsun.bank.model.User;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

@Before(AdminLoginInterceptor.class)
public class AdminUserController extends Controller {
	public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f",
		"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
		"t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",
		"6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",
		"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
		"W", "X", "Y", "Z" };
	public void index(){
		int nowPage = getParaToInt("nowPage",1);
		String search = getPara("search","");
		String sql = "from t_user u1 LEFT JOIN t_relation re1 on u1.uid=re1.cid "
				+"LEFT JOIN t_user u2 on u2.uid=re1.pid "
				+"LEFT JOIN t_relation re2 on u1.uid =re2.pid "
				+"LEFT JOIN t_user u3 on u3.uid=re2.cid ";
		if(search!=null&&search.length()>0){
			sql += "where u1.uxm like '%"+search+"%' or u2.uxm like '%";
			sql += search+"%' or u3.uxm like '%"+search+"%' ";
			
			//更多字段
			sql += " or u1.uname like '%"+search+"%' ";
			sql += " or u1.ucard like '%"+search+"%' ";
		}
		sql += "GROUP BY u1.uid ";
		Page<User> userPage = User.dao.paginate(nowPage, 20,
				"select u1.*,u2.uxm tjr,group_concat(u3.uxm) team ",sql);
		setAttr("nowPage", nowPage);
		setAttr("totalPage",userPage.getTotalPage());
		setAttr("userList", userPage.getList());
		setAttr("totalRow", userPage.getTotalRow());
		render("user.jsp");
	}
	public void getUserList(){
		int nowPage = getParaToInt("nowPage",1);
		String search = getPara("search","");
		String sql = "from t_user u1 LEFT JOIN t_relation re1 on u1.uid=re1.cid "
				+"LEFT JOIN t_user u2 on u2.uid=re1.pid "
				+"LEFT JOIN t_relation re2 on u1.uid =re2.pid "
				+"LEFT JOIN t_user u3 on u3.uid=re2.cid ";
		if(search!=null&&search.length()>0){
			sql += "where u1.uxm like '%"+search+"%' or u2.uxm like '%";
			sql += search+"%' or u3.uxm like '%"+search+"%' ";
		}
		sql += "GROUP BY u1.uid ";
		Page<User> userPage = User.dao.paginate(nowPage, 20,
				"select u1.*,u2.uxm tjr,group_concat(u3.uxm) team ",sql);
		setAttr("nowPage", nowPage);
		setAttr("totalPage",userPage.getTotalPage());
		setAttr("userList", userPage.getList());
		setAttr("totalRow", userPage.getTotalRow());
		render("user.jsp");
	}
	public void getUserById(){
		int uid = getParaToInt("uid",0);
		String sql = "select u1.*,u2.uxm tjr,group_concat(u3.uxm) team  "
				+ "from t_user u1 LEFT JOIN t_relation re1 on u1.uid=re1.cid "
				+"LEFT JOIN t_user u2 on u2.uid=re1.pid "
				+"LEFT JOIN t_relation re2 on u1.uid =re2.pid "
				+"LEFT JOIN t_user u3 on u3.uid=re2.cid ";
		sql += "where u1.uid="+uid;
		sql += " GROUP BY u1.uid ";
		User user = User.dao.findFirst(sql);
		setAttr("user", user);
		render("user_info.jsp");
	}
	public void remove(){
		int uid = getParaToInt("uid",0);
		User user = User.dao.findById(uid);
		if(user!=null){
			/**原代码
			user.set("upwd", "111111")
			    .set("uxm", "")
			    .set("ucard", "")
			    .set("ubank", "")
			    .set("uopen", "")
			    .set("utel", "")
			    .set("utime", null)
			    .update();
			Db.update("delete from t_relation where pid="+uid+" or cid="+uid);
			*/
			
			/**
			 * 修改于2016/7/3，需求要求删除一个用户
			 */
			Db.update("delete from t_relation where pid="+uid+" or cid="+uid);
			user.delete();
		}
		this.redirect("/admin/user/getUserList");
	}
	public void distriUser(){
		int nowPage = getParaToInt("nowPage",1);
		int uid = getParaToInt("uid",0);
		System.out.println(uid);
		String search = getPara("search","");
		String sql = "from t_user u left join t_relation re on u.uid=re.cid where u.uxm like '%"+search
				+"%' and u.uxm is not null and u.uxm <>'' and uid <>"+uid;
		Page<User> userPage = User.dao.paginate(nowPage, 3,
				"select u.*,re.*",sql);
		setAttr("nowPage", nowPage);
		setAttr("totalPage",userPage.getTotalPage());
		setAttr("userList", userPage.getList());
		setAttr("totalRow", userPage.getTotalRow());
		setAttr("pid", uid);
		render("distriUser.jsp");
	}
	
	public void distri(){
		int uid = getParaToInt("uid",0);
		int pid = getParaToInt("pid",0);
		Relation.dao.deleteById(pid,uid);
	    new Relation().set("pid", pid).set("cid", uid).save();
		this.redirect("/admin/user/distriUser?uid="+pid);
	}
	public void delDistri(){
		int uid = getParaToInt("uid",0);
		int pid = getParaToInt("pid",0);
		Relation.dao.deleteById(pid,uid);
		this.redirect("/admin/user/distriUser?uid="+pid);
	}
	
	public void productUser(){
		render("productUser.jsp");
	}
	public void product(){
		int num = getParaToInt("num",100);
		int type = getParaToInt("type",0);
		StringBuffer shortBuffer = null;//每次的字符串
		String uuid = null; //uuid
		
		StringBuffer sql = new StringBuffer();
		sql.append("insert into t_user(uname,upwd,uregist) values ");
		for(int i=0;i<num;i++){
			uuid = UUID.randomUUID().toString().replace("-", "");
			shortBuffer = new StringBuffer();
			for (int j = 0; j < 7; j++) {
				String str = uuid.substring(j * 4, j * 4 + 4);
				int x = Integer.parseInt(str, 16);
				shortBuffer.append(chars[x % 0x3E]);
			}
			String pre = "";
			if(type==0){
				pre = "MHBA";
			}else{
				pre = "MHBC";
			}
			String uname = pre + shortBuffer.toString();
			sql.append("('"+uname+"','111111',now())");
			if(i==num-1){
				sql.append(";");
			}else{
				sql.append(",");
			}
		}
		//System.out.println(sql.toString());
		Db.update(sql.toString());
		setAttr("msg", "账号生成成功");
		render("productUser.jsp");
	}
}
