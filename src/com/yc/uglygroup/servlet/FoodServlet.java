package com.yc.uglygroup.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.yc.uglygroup.biz.IFoodBiz;
import com.yc.uglygroup.biz.impl.FoodBizlmpl;
import com.yc.uglygroup.util.FileUploadUtil;

@WebServlet("/foods")
public class FoodServlet extends BasicServlet{
	private static final long serialVersionUID = 1L;
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String op = request.getParameter("op");
			if ("addfoods".equals(op)) {//添加美食
				addfoods(request, response);
			}
		}
		/**
		* 添加商铺美食的方法
		* @param request
		* @param response
		 * @throws IOException 
		*/
		private void addfoods(HttpServletRequest request, HttpServletResponse response) throws IOException {
			FileUploadUtil fuu = new FileUploadUtil();
			PageContext pageContext = JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true);
			Map<String, String> map = fuu.upload(pageContext);
			IFoodBiz biz = new FoodBizlmpl();
			this.send(response, biz.addfood(map));
		}
	}