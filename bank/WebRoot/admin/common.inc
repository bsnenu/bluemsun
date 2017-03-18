<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="#" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="${basePath }/admin/main">后台首页</a></li>
                <li><a href="${basePath }/" target="_blank">前台首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>当前管理员:&nbsp;&nbsp;<span>${sessionScope.manager.mname}</span></li>
            </ul>
        </div>
    </div>
</div>
 
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="${basePath }/admin/person"><i class="icon-font">&#xe008;</i>联系人管理</a></li>
                        <li><a href="${basePath }/admin/user"><i class="icon-font">&#xe008;</i>用户管理</a></li>
                        <li><a href="${basePath }/admin/intro"><i class="icon-font">&#xe008;</i>公司介绍</a></li>
                        <li><a href="${basePath }/admin/news"><i class="icon-font">&#xe008;</i>新闻管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>其他</a>
                    <ul class="sub-menu">
						<li><a href="${basePath }/admin/updateManagerPwd"><i class="icon-font">&#xe017;</i>修改密码</a></li>
                        <li><a href="${basePath }/admin/out" onclick="return confirm('确定退出?')"> <i class="icon-font">&#xe037;</i>退出</a></li>                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->