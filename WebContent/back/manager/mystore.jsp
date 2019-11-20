<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的店铺</title>
<link rel="stylesheet" type="text/css" href="../../css/reset.css">
<link rel="stylesheet" type="text/css" href="../../css/public.css">
<link rel="stylesheet" type="text/css" href="../../css/mycenter.css">
<link rel="shortcut icon" href="../images/favicon.ico" />
<link rel="stylesheet" href="../../css/responsive.css">
<script type="text/javascript" src="../../js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="../../js/menu.js"></script>
<script type="text/javascript" src="../../js/ajaxfileupload.js"></script>


<!--[if lt ie 9]>
		<script type="text/javascript" src="../../js/html5.js"></script>
	<![end if]-->
</head>
<body>
	<header>
	<div class="inner">
		<div class="logo">
			<h1>
				<a href="#">丑团外卖</a>
			</h1>
		</div>
		<div class="login">
			<a href="menu.html">返回</a>
			<div class="username">
				<a href="#">${user.uname}</a>
				<ul id="userMenu" class="userMenu">
					<li><a href="#">我的资料</a></li>
					<li><a href="#">我的订单</a></li>
					<li><a href="#">退出登陆</a></li>
				</ul>
				<span class="triangle_icon"></span>

			</div>
		</div>
	</div>
	</header>
	<div class="kefu"></div>

	<section class="main inner clearfix">
	<div class="main-left">
		<ul id="main-left-ul">
			<li><a href="#" class="active-li">查看店铺</a></li>
			<li><a href="#">添加美食类型</a></li>
			<li><a href="#">添加菜系</a></li>
			<li><a href="#">修改菜系</a></li>
			<li><a href="#">发布活动</a></li>
		</ul>
	</div>


	<div class="main-right" id="main-right-inner">
		<div class="main-right-inner mycenter clearfix active">
			<div class="information clearfix">
				<p class="clearfix">	
					<img src=${restaurant["rpic"]}>
					<span class="information-r-span1">${restaurant["rname"]}</span>
				</p>
				<p>公告</p>
				<div>
				${restaurant['rdisc']}
				</div>
			</div>
			<div class="table table-add">
				<div class="list">
					<table width="90%" align="center" border="1px" cellspacing="0xp"
						cellpadding="0px" role="all">
						<caption>商品信息</caption>
						<thead id= "foodinfo_foodshow">
							<tr >
								<th>图片</th>
								<th>名称</th>
								<th>类型</th>
								<th>价格</th>
							</tr>							
						</thead>
						<tbody align="center" id="types">
							<c:forEach items="${foods}" var="item">
								<tr>
									<td><img src="${item.pic}" width="50px" height="50px"></td>
									<td>${item.fname}</td>
									<td>${item.trtype}</td>
									<td>${item.fprice}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="main-right-inner base">
			<h2>添加美食类型</h2>
			<div class="list">
				<div class="list-inner">
					<form id="add_types_form">
						<ul>
							<li><label for="add_type_name">美食类型</label> <input
								type="text" name="trname" id="add_types_name"  class ="foods_ipt"/>
							</li>
							<li style="width: 100%; text-align: center"><input
								type="button" value="添加" onclick="addtypes()" class="mybtn" /></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
		<div class="main-right-inner base">
			<h2>添加菜系</h2>
			<div class="list">
				<div class="list-inner">
					<form id="add_foods_form">
						<ul>
							<li><label>菜系类型：</label> <select id="add_foods_typeid"
								class="foods_ipt"></select></li>
							<li><label for="add_foods_name">菜系名称：</label> <input
								type="text" name="tname" id="add_foods_name" class="foods_ipt" />
							</li>
							<li><label for="add_foods_name">菜系价格：</label> <input
								type="text" name="price" id="add_foods_price" class="foods_ipt" />
							</li>
							<li><label for="add_foods_price">菜系图片：</label> <input
								type="file" name="pic" id="add_foods_pic" class="foods_ipt" /></li>
							<li style="width: 60%"><label for="add_foods_context">菜系描述：</label>
								<textarea name="context" id="add_foods_context" rows="3"
									cols="100"></textarea></li>
							<li style="width: 100%; text-align: center"><input
								type="button" value="添加" onclick="addfoods()" class="mybtn" /></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
		<div class="main-right-inner send">
			<h2>修改菜单</h2>
			<div class="list">
				<div class="small-list list-top">
					<ul>
						<li class="li-first" style="width: 25%">菜系类型</li>
						<li style="width: 25%">名称</li>
						<li style="width: 10%">价格</li>
						<li style="width: 25%">操作</li>
					</ul>
				</div>
				<div class="small-list list-bottom">
					<p>暂无相关数据。</p>
				</div>
			</div>
		</div>
		<div class="main-right-inner order">
			<form id="add_action_form">
				<table>
					<tr>
						<td>活动类型</td>
						<td><select>
								<option value="打折">打折</option>
								<option value="打折">满减</option>
						</select></td>
					</tr>
					<tr>
						<td>活 动 起 始 时 间:</td>
						<td><input type="date"></td>
						<td><input type="time"></td>
					</tr>
					<tr>
						<td>活 动 结束 时 间:</td>
						<td><input type="date"></td>
						<td><input type="time"></td>
					</tr>
					<tr>
						<td>折扣选择:</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>活动菜系:</td>
						<td><input type="checkbox" value="" name="check">菜名</td>
						<td><input type="checkbox" value="" name="check">菜名</td>
						<td><input type="checkbox" value="" name="check">菜名</td>
						<td><input type="checkbox" value="" name="check">菜名</td>
						<td><input type="checkbox" value="" name="check">菜名</td>
						<td><input type="checkbox" value="" name="check">菜名</td>
						<td><input type="checkbox" value="" name="check">菜名</td>
						<td><input type="checkbox" value="" name="check">菜名</td>
					</tr>
					<tr>
						<td><input type="button" value="发布" id="fb"></td>
					</tr>
				</table>
			</form>
		</div>

		<script>
		var rid = 4;
			$(function() {
				$.post("../../resturant", {
					op : "findres"
				}, function(data) {
					if (data < -1) {
						alert("您暂无商铺，请先注册");
						location.href = "../store/register.html";
					}else if(data == 2){
						alert("您的商铺审核中请等待");
						location.href = "../manager/menu.html";					
					}else if(data == 3){
						alert("您的商铺已注销");
						location.href = "../manager/menu.html";
					
					}else if(data == 4){
						alert("您未通过，请重新注册");
						location.href = "../store/register.html";
					}
				}, "json");
				$.post("../../ResfoodtypeServlet", {
					op : "findAllTypes",
					rid : rid
				}, function(data) {
					var str = "";
					$.each(data, function(index, item) {
						str += "<option value = '" + item.trid + "'>"
								+ item.trtype + "</option>";
					})
					$("#add_foods_typeid").append($(str));
				}, "json");
				$.post("../../foods", {
					op : "findfoods",
					rid : rid
				}, function(data) {
					var str = "";
					var str1="";
					$.each(data, function(index, item) {

						str += "<tr><th><img src ='../../"+item.fpic+"'></th><th>"+item.fname+"</th><th>"+item.trtype+"</th><th>"+item.fprice+"</th></tr>";
						str1 += "<tr><th>"+item.trtype+"'</th><th>"+item.fname+"</th><th>"+item.fprice+"</th><a>修改</a></tr>";
					})
					$("#foodinfo_foodshow").append($(str));
				}, "json");
			})
			//添加店铺美食类型
			function addtypes() {
				var trtype = $.trim($("#add_types_name").val());
				$.post("../../ResfoodtypeServlet", {
					op : "addTypes",
					rid : rid,
					trtype : trtype
				}, function(data) {
					if (data > 0) {
						alert("添加成功");
					} else {
						alert("添加失败");
					}
				}, "json");
			}

			//添加店铺美食
			function addfoods() {
				var trid = $.trim($("#add_foods_typeid").val());
				var fname = $.trim($("#add_foods_name").val());
				var fprice = $.trim($("#add_foods_price").val());
				var fdisc = $.trim($("#add_foods_context").val());
				if (trid == "" || fname == "" || fprice == "" 
						|| fdisc == "") {
					
					return -1;
				}
				$.ajaxFileUpload({
					url:"../../foods?op=addfoods",
					secureuri: false,
					fileElementId: ["add_foods_pic"],
					data: {rid:rid,trid:trid, fname:fname, fprice:fprice,fdisc:fdisc},
					dataType: "text",
					success: function(data, status) {
						data = parseInt($.trim(data));
						
						if (data == -1) {
							alert("您输入的信息不完整请确认后重新输入22222...");
						} else if (data > 0) {
							alert("添加成功...");
						} else {
							alert("添加失败...");

						}
					},
					error: function(data, status, e) {
						alert("店铺注册失败...\n" + e);
					}
				})
			}
			
			$("#main-left-ul li").click(
					function() {
						var index = $(this).index();
						$(this).find("a").addClass("active-li");
						$(this).siblings().find("a").removeClass("active-li");
						$("#main-right-inner>div").eq(index).addClass("active")
								.siblings().removeClass("active");  
						 
					})

			$("#fb").click(function() {

			})
		</script>
	</div>


	<div class="goTop"></div>
	</section>




	<footer>
	<div class="inner clearfix">
		<div class="footer-top clearfix">
			<nav>
			<ul class="clearfix">
				<li><a href="#">网站介绍</a></li>
				<li><a href="#">联系我们</a></li>
				<li><a href="#">常见问题</a></li>
				<li><a href="#">招贤纳士</a></li>
				<li><a href="#">网站地图</a></li>
				<li><a href="#">商家加盟</a></li>
			</ul>
			</nav>
			<div class="foot-kf">
				<a href="#"> <img src="../../images/foot-kf.jpg" alt="">
				</a>
				<div class="pt15">
					<span>关注我们:</span> <a href="#" class="sina"></a> <a href="#"
						class="wx"></a>
				</div>
			</div>
		</div>
		<div class="copyright">
			<p>
				© 2019 丑团 <a href="#">湘ICP备12042558号</a>
			</p>
			<div class="zjgs">
				<a href="#"> <img src="../../images/zjgs.png" alt="">
				</a>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>