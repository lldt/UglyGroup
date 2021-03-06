package com.yc.uglygroup.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yc.uglygroup.biz.IUserBiz;
import com.yc.uglygroup.biz.impl.UserBizImpl;
import com.yc.uglygroup.entity.User;
import com.yc.uglygroup.sendmsg.SendMsg;

@WebServlet("/admin")
public class UserServlet extends BasicServlet{
	private static final long serialVersionUID = 1L;
	private String code = "null";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		
		if ("login".equals(op)) { // 如果是登录操作
			login(request, response);
		} else if ("utel".equals(op)) { // 发送验证码
			utel(request, response);
		} else if ("register".equals(op)) { // 注册操作
			register(request, response);
		} else if ("userup".equals(op)){//修改操作
			userup(request, response);
		}else if ("userid".equals(op)){//获取用户id
			userid(request, response);
		} else if ("getUstate".equals(op)){// 查询用户身份
			getUstate(request, response);
		}
	}
	/**
	 * 获取用户id
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void userid(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User user= (User) request.getSession().getAttribute("user");
		Integer uid = null;
		if(user != null){
			uid= user.getUid();
		}else{
			System.out.println("空user");
		}
		System.out.println("获取到的用户id为"+uid);
		this.send(response, uid);
	}

	/**
	 * 查询用户身份
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void getUstate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		this.send(response, user.getUstate());
	}

	/**
	 * 用户修改的操作
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void userup(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String uid = request.getParameter("uid");
		String uname= request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String email = request.getParameter("email");
		User user1= (User) request.getSession().getAttribute("user");
		int  ustate = user1.getUstate();
		IUserBiz userBiz = new UserBizImpl();
		int result = userBiz.userup(Integer.parseInt(uid), uname, upwd, email,ustate);
		this.send(response, result);
		
	}

	/**
	 * 注册操作
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String utel = request.getParameter("utel");
		String usercode = request.getParameter("code"); // 用户输入的验证码
		System.out.println("cooooooooooo!!!!!" + code);
		System.out.println("usercode" + usercode);
		if (usercode.equals(code)) { // 说明验证码正确
			IUserBiz userBiz = new UserBizImpl(); // 调用注册方法
			User user = userBiz.register(uname, upwd, utel);
			int result = -1;
			if (user != null) { // 说明登录成功，查询到了此账户的信息
				// 将当前用户信息存到session，方便以后获取
				request.getSession().setAttribute("user", user);
				result = 1;
			} else {
				result = -1;
			}
			this.send(response, result);
		}
	}

	/**
	 * 验证码
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	private void utel(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
		String utel = request.getParameter("utel");
		SendMsg sendMsg = new SendMsg();
		code = sendMsg.sendCode(utel); // 发送的验证码(系统生成的)
		System.out.println("utelcode" + code);
		this.send(response, code);
	}

	/**
	 * 处理用户登录的方法
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取-运算-跳转
		String account = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		
		IUserBiz userBiz = new UserBizImpl();
		User user = userBiz.login(account, pwd);
		System.out.println(user);
		int result = -1;
		if (user != null) { // 说明登录成功，查询到了此账户的信息
			// 将当前用户信息存到session，方便以后获取
			request.getSession().setAttribute("user",user);
			result = 1;
		} else {
			result = -1;
		}
		this.send(response, result);
	}
}
