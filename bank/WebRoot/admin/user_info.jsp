<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
       <meta charset="UTF-8">
    <title>MHB 感恩互助社区后台管理</title>
    <link rel="stylesheet" type="text/css" href="${basePath }/admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath }/admin/css/main.css"/>
    <script type="text/javascript" src="${basePath }/admin/js/modernizr.min.js"></script>
    <script type="text/javascript" src="${basePath }/admin/js/jquery.js"></script>
<script type="text/javascript">

$(function() {
	});

</script>
</head>
<body>
<div class="topbar-wrap white">
    <%@ include file="common.inc" %>
 <div class="main-wrap">

        <div class="crumb-wrap">
         <div class="crumb-list"><i class="icon-font"></i>
         		  首页
            <span class="crumb-step">&gt;</span>
           		 用户管理
        </div>
        <div class="result-wrap" >
            <ul>
            	<li>用户ID: ${user.uid}</li>
            	<li>姓名: ${user.uxm }</li>
            	<li>推荐人: ${user.tjr }</li>
            	<li>团队人员: ${user.team }</li>
            	<li>注册时间: ${user.uregist }</li>
            	<li>身份证号: ${user.ucard }</li>
            	<li>银行卡号: ${user.ubank }</li>
            	<li>开户行: ${user.uopen }</li>
            	<li>电话: ${user.utel }</li>
            	<li>开通时间: ${user.utime }</li>
            </ul>
            <input class="btn btn6"  onclick="history.go(-1)" value="返回" type="button">
               
    </div>
    <!--/main-->
</div>
</body>
</html>