package com.yc.uglygroup.dao.impl;

import com.yc.uglygroup.dao.DBHelper;
import com.yc.uglygroup.dao.IUserDao;
import com.yc.uglygroup.entity.User;

public class UserDaoImpl implements IUserDao{

	@Override
	public User login(String account, String pwd) {
		DBHelper dbHelper = new DBHelper();
		String sql = "select uid, uname, upwd, utel, email, ustate from user where (utel=? or email=?) and upwd=?";
		return dbHelper.find(sql, User.class, account, account, pwd);
	}

	@Override
	public int register(String uname, String upwd, String utel) {
		DBHelper dbHelper = new DBHelper();
		String sql = "insert into user values(0,?,?,?,null,'0')";
		return dbHelper.update(sql, uname, upwd, utel);
	}

	@Override
	public int userup(Integer uid ,String uname, String upwd, String email, Integer ustate) {
		DBHelper db = new DBHelper();
		String sql = " update  user set uname= ? ,upwd= ? ,email = ? ,ustate=? where uid = ?";
		return db.update(sql, uname,upwd,email,ustate,uid);
	}


}
