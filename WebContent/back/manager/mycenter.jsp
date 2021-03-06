<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
	<title>个人中心</title>
	<link rel="stylesheet" type="text/css" href="../../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../../css/public.css">
	<link rel="stylesheet" type="text/css" href="../../css/mycenter.css">
	<link rel="shortcut icon" href="favicon.ico" /> 
	<link rel="stylesheet" href="../../css/notiflix-1.3.0.min.css">
	<link rel="stylesheet" href="../../css/responsive.css">
	<script type="text/javascript" src="../../js/jquery-1.12.2.min.js"></script>
	<script type="text/javascript" src="../../js/menu.js"></script>
	<script src="../../js/notiflix-1.3.0.min.js" type="text/javascript"></script>
	
	

	<!--[if lt ie 9]>
		<script type="text/javascript" src="../../js/html5.js"></script>
	<![end if]-->
</head>
<body>
	<header>
		<div class="inner">
			<div class="logo">
				<h1><a href="#">丑团外卖</a></h1>
			</div>
			<div class="login">
				<a href="menu.html">返回</a>
				<div class="username">
					 <a href="#">${user.uname}</a>
					<ul id="userMenu" class="userMenu">
						<li><a href="#">我的资料</a></li>
						<li><a href="#">我的订单</a></li>
						<li><a href="../index.html">退出登陆</a></li>
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
				<li ><a href="#"class="active-li" onclick="findPageressreceipt()">个人中心</a></li>
				<li><a href="#">基本资料</a></li>
				<li><a href="#" onclick="findressreceipt()">配送资料</a></li>
				<li><a href="#" onclick="findorder()">我的订单</a></li>
			</ul>
		</div>


		<div class="main-right" id="main-right-inner">
			<div class="main-right-inner mycenter clearfix active" >
				<div class="information clearfix">
					<p class="clearfix">
						<span class="information-r-span1">${user.uname}</span>
					</p>
					<ul>
						<li><p>手机号:${user.utel}</p></li>
						<li><p>密码:${user.upwd}</p></li>
						<li><p>我的邮箱:${user.email} </p></li>
						
					</ul>
				</div>
				<div class="table table-add">
					<h2>已保存的配送地址</h2>
					<div class="list">
						<div class="small-list list-top">
							<ul>
								<li class="li-first" style="width:24%">姓名</li>
								<li style="width:24%">区域</li>
								<li style="width:24%">配送地址</li>
								<li style="width:24%">手机号码</li>

							</ul>
						</div>
						<div class="small-list list-bottom">
							<ul id= "mycenter_easy_show">
								<li>
									<input  class="noborder"style="width: 24%" type="text" name="address" readonly="readonly" value="tjy">
									 <select tyle="width: 24%" id="" class="foods_ipt"  name ="address"  disabled="disabled">
									 <option value ='area_id' >蒸湘区</option>
									 </select>
									<input style="width:24%" type="text" name="address" readonly="readonly" value="南华大学致远园12栋">
									<input style="width:24%" type="text" name="address" readonly="readonly" value="15226380133">
								</li>

							</ul>
						</div>
					</div>
				</div>
				<div class="table table-order">
					<h2>最近订单</h2>
					<div class="list">
						<div class="small-list list-top">
							<ul>
								<li class="li-first" style="width:24%">订单号</li>
								<li style="width:25%">订单商家</li>
								<li style="width:12%">订单金额</li>
								<li style="width:16%">下单时间</li>
								<li style="width:8%">订单状态</li>
							</ul>
							<p>  </p>
						</div>
						<div class="small-list list-bottom">
						</div>
					</div>
				</div>
			</div>
			<div class="main-right-inner base">
					<h2>基本资料</h2>
					<div class="list">
						<div class="list-inner">
							<ul>
								<li>手机：&nbsp;&nbsp;&nbsp;&nbsp;${user.utel}</li>
								<li>昵称：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly" value="${user.uname}" id = "username"><a href="javascript:void(0)" onclick="usernameup()" >修改</a></li>	
								<li>密码：&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" readonly="readonly" value="********" id="userpwd"><a href="javascript:void(0)" onclick="userpwdup()">修改密码</a></li>
								<li>邮箱：&nbsp;&nbsp;&nbsp;&nbsp;<input type="email" readonly="readonly" value="${user.email}"id="useremail"><a href="javascript:void(0)" onclick="useremailup()">修改</a></li>
								
								<li><div style="text-align: center;"><button type="button" onclick="userup()" >提交</button></div></li>
							</ul>
						</div>
					</div>
			</div>
			<div class="main-right-inner">
					<h2>配送资料</h2>
					<div class="list">
						<div class="small-list list-top" id="Delivery">
							<ul>
								<li class="li-first" style="width:8%">姓名</li>
								<li style="width:10%">区域</li>
								<li style="width:25%">配送地址</li>
								<li style="width:15%">手机号码</li>
								<li style="width:20%">操作</li>
								<li style="width:14%"><a  id="addrows" class="add" href="javascript:void(0)" onclick="addrow()">添加</a></li>
							</ul>
						</div>
						<div class="small-list list-bottom">
							<ul class="addressreceipt" id= "addressreceipt">
								<li class="li-first" id="x" onclick="dianji(this)">
								<input  style="width: 8%" type="text" name="address" readonly="readonly" value="tjy">
								 <select id="" class="foods_ipt"  name ="address"  disabled="disabled">
								 <option value ='area_id' >蒸湘区</option>
								 <option value ='area_id' >雁鸿区</option>
								 </select>
								<input style="width:25%" type="text" name="address" readonly="readonly" value="南华大学致远园12栋">
								<input style="width:15%" type="text" name="address" readonly="readonly" value="15226380133">
								<a  href="javascript:void(0)" onclick="addresscaseup()">修改</a>
								<a href="javascript:void(0)" onclick="addressup()">提交</a>
								</li>
							</ul>
						</div>
					</div>
			</div>
			<div class="main-right-inner order">
				<div class="list">
					<div class="small-list list-top">
						<ul>
							<li style="width:24%" class="li-first">商家</li>
							<li style="width:24%">订单金额</li>
							<li style="width:24%">下单时间</li>
							<li style="width:24%">订单状态</li>
						</ul>
					</div>
					<div class="small-list list-bottom">
						<ul  id = "mycenter_ordershow">
							<li class="li-first">
								<input  type="text" name="address" readonly="readonly" value="15226380133">
								<input  type="text" name="address" readonly="readonly" value="15226380133">
								<input  type="text" name="address" readonly="readonly" value="15226380133">
								<input  type="text" name="address" readonly="readonly" value="15226380133">
							</li>
						</ul>
					</div>
				</div>
				<div class="button">
					<a href="#"><</a>
					<a href="#" class="active-a">1</a>
					<a href="#">></a>
				</div>
			</div>

			<script>
				$("#main-left-ul li").click(function(){
					var index=$(this).index();
					$(this).find("a").addClass("active-li");
					$(this).siblings().find("a").removeClass("active-li");
					$("#main-right-inner>div").eq(index).addClass("active").siblings().removeClass("active");
				})


			</script>
		</div>


		<div class="goTop"></div>
	</section>
<script type="text/javascript">
	var  id;
	var uid;
	$(function(){
		Notiflix.Notify.Init();
		userid();
		
	});
	function userid(){
		$.post("../../admin", {
			op : "userid"
		}, function(data) {
			if(data != null){
				uid = data;//获取uid
			}else{
				Notiflix.Notify.Warning('请先登陆');
				location.href = "../index.html";
			}
		}, "json");
	}
	//获取当前元素的id	
    function dianji(e) {
        id = e.id;
    }
	//查找订单的方法
	function findorder(){
		$.post("../../order",{
			op:"findByPage",
			uid:uid,
			page:1,
			rows:5,
		},function(data){
			var str = "";
			//先清空
			 $("#mycenter_ordershow").html("");
			$.each(data,function(index,item){
				str += '<li class="li-first""><img src="../../'+item.rpic+'" class="mycenterimg" ><input style="width:20%"  type="text" name="address" readonly="readonly" value="'+item.rname+' "><input style="width:20%" type="text" name="address" readonly="readonly" value="'+item.oprice+'"><input style="width:30%" type="text" name="address" readonly="readonly" value="'+item.otime+'">'
				if(item.ostate == 0){
					str +='<input  type="text" name="address" readonly="readonly" value="已下单"></li>'
				}else if(item.ostate == 1){
					str +='<input  type="text" name="address" readonly="readonly" value="已付款"></li>'
				}else if(item.ostate == 2){
					str +='<input  type="text" name="address" readonly="readonly" value="已送达"></li>'
				}else if(item.ostate == 3){
					str +='<input  type="text" name="address" readonly="readonly" value="已取消"></li>'
				}
			})
			$("#mycenter_ordershow").append($(str));
		},"json")
	}
 	//查找所有的收货地址
 	function findressreceipt(){
		$.post("../../ressreceipt", {
			op : "findress",
			uid :uid
		}, function(data) {
			var length = data.length;
			if(length >= 10){
				$("#addrows").attr("disabled",true).css("pointer-events","none")
			}
			if(data == null){
				return;
			}
			//先清空
			 $("#addressreceipt").html("");
			//循环添加查出来的收货地址
			$.each(data, function(index, item) {
				var str = '<li class="li-first"  id="'+item.arid+'" onmouseover="dianji(this)" > <input type="text"  id="arname'+item.arid+'" name="address"  readonly="readonly" style="width:8%; " value="'+item.arname+'">&nbsp;<select id="center_area_select'+item.arid+'" class="foods_ipt"  name ="address" disabled="disabled"><option vlaue= "'+item.aid+'" >'+ item.aname+ '</option>"</select>&nbsp;<input type="text" id="aradd'+item.arid+'" name="address" readonly="readonly" style="width:25%;" value="'+item.aradd+'">&nbsp;<input type="text" id="artel'+item.arid+'" readonly="readonly" name="address" style="width:15%;" value="'+item.artel+'">&nbsp;<a  href="javascript:void(0)" onclick="addresscaseup()">修改</a><a href="javascript:void(0)" onclick="addressup()">提交</a></a><a href="javascript:void(0)" onclick="deleteaddress()">删除</a></li>';
				$("#addressreceipt").append($(str));
			})
		}, "json");
	}
 	//分页查找所有的收货地址
 	function findPageressreceipt(){
		$.post("../../ressreceipt", {
			op : "findByPageress",
			uid :uid,
			page:1,
			rows:3
		}, function(data) {
			var length = data.length;
			if(length >= 10){
				$("#addrows").attr("disabled",true).css("pointer-events","none")
			}
			if(data == null){
				return;
			}
			//先清空
			 $("#mycenter_easy_show").html("");
			//循环添加查出来的收货地址
			$.each(data, function(index, item) {
				var str = '<li class="li-first"  style="line-height:20px;" id="'+item.arid+'" onmouseover="dianji(this)" > <input type="text"  id="arname'+item.arid+'" name="address"  readonly="readonly" style="width:24%; " value="'+item.arname+'">&nbsp;<input type="text"  id="arname'+item.aid+'" name="address"  readonly="readonly" style="width:24%; " value="'+item.aname+'">&nbsp;<input type="text" id="aradd'+item.arid+'" name="address" readonly="readonly" style="width:25%;" value="'+item.aradd+'">&nbsp;<input type="text" id="artel'+item.arid+'" readonly="readonly" name="address" style="width:24%;" value="'+item.artel+'">&nbsp;</li>';
				$("#mycenter_easy_show").append($(str));
			})
		}, "json");
	}
	
	//配送资料行添加
	function addrow(){
		//先添加行
		var str = '<li class="li-first"><input  id ="arname"type="text" name="address" style="background: #fff;border: 2px;width:8%; ">&nbsp;<select id="center_area" class="foods_ipt"  name ="address"></select>&nbsp;<input  id ="aradd" type="text" name="address" style="background: #fff;border: 2px;width:25%;">&nbsp;<input id="artel" type="text" name="address" style="background: #fff;border: 2px;width:15%;">&nbsp;<a class="add" href="javascript:void(0)" onclick="add()">添加</a></li>'
		$("#addressreceipt").append($(str));
		//再添加区域信息
			$.post("../../ressreceipt", {
				op : "findarea",
			}, function(data) {
				var str1 = "";
				$.each(data, function(index, item) {
					str1 += "<option value = '" + item.aid + "'>"
							+ item.aname + "</option>";
				})
				$("#center_area").append($(str1));
			}, "json");
		
	}
	//添加配送资料
	function add(){
		$("input[name='address']").attr("readonly","readonly");
		$("input[name='address']").removeAttr("style");
		var arname=$("#arname").val();//名字
		var artel = $("#artel").val();//电话
		var aradd= $("#aradd").val();//详细地址
		var aname =$("#center_area option:selected").text();//区域名
		var aid =$("#center_area option:selected").val();//区域编号
		$.post("../../ressreceipt",{
			op : "address",
			uid:uid,
			arname:arname,
			artel:artel,
			aradd:aradd,
			aid:aid
		},function(data){
			if(data > 0){
				Notiflix.Notify.Success('添加成功');
			}else{
				Notiflix.Notify.Failure('添加失败');

			}
		},"json");
		//重新查询(刷新)
		findressreceipt();
		
	}
	//配送资料修改
	function addresscaseup(){
		$("#arname"+id+"").removeAttr("readonly");
		$("#aradd"+id+"").removeAttr("readonly");
		$("#artel"+id+"").removeAttr("readonly");
		$.post("../../ressreceipt", {
			op : "findarea",
		}, function(data) {
			var str1 = "";
			$.each(data, function(index, item) {
				str1 += "<option value = '" + item.aid + "'>"
						+ item.aname + "</option>";
			})
			$("#center_area_select"+id+"").append($(str1));
		}, "json");
		$("#center_area_select"+id+"").removeAttr("disabled");
	}
	//配送资料提交
	function addressup(){
		var arname = $("#arname"+id+"").val();//名字
		var aradd= $("#aradd"+id+"").val();//详细地址
		var artel= $("#artel"+id+"").val();//电话
		var aid  =$("#center_area_select"+id+" option:selected").val();//区域编号
		$.post("../../ressreceipt", {
			op : "addressup",
			arname:arname,
			aradd:aradd,
			artel:artel,
			aid:aid,
			arid:id
		}, function(data) {
			if(data>0){
				Notiflix.Notify.Success('修改成功');
				//重新查询(刷新)
				findressreceipt();
			}else{
				Notiflix.Notify.Failure('遇到未知错误，修改失败');
			}
		}, "json");
		
	}
	function deleteaddress(){
		$.post("../../ressreceipt", {
			op : "deleteaddress",
			arid:id
		}, function(data) {
			if(data>0){
				Notiflix.Notify.Success('删除成功');
				//重新查询(刷新)
				findressreceipt();
			}else{
				Notiflix.Notify.Failure('遇到未知错误，修改失败');
				//重新查询(刷新)
				findressreceipt();
			}
		}, "json");
	}
	//用户修改
	function usernameup(){
		$("#username").removeAttr("readonly");
	}
	function userpwdup(){
		$("#userpwd").removeAttr("readonly");
	}
	function useremailup(){
		$("#useremail").removeAttr("readonly");
	}
	function userup(){
		var uname = $("#username").val();
		var upwd = $("#userpwd").val();
		var email = $("#useremail").val();
		$.post("../../admin",{op:"userup",uid:uid, uname:uname,upwd:upwd,email:email} , function(data){
			if (data>0){
				Notiflix.Notify.Success('修改成功');
				$("#username").attr("readonly","readonly");
				$("#userpwd").attr("readonly","readonly");
				$("#useremail").attr("readonly","readonly");
			}else{
				Notiflix.Notify.Failure('遇到未知错误，修改失败');
			}	
		},"json")
	}
</script>
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