<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>问卷调查后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="/wenjuan/admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/wenjuan/admin/css/main.css"/>
    <script type="text/javascript" src="/wenjuan/admin/js/modernizr.min.js"></script>
    <script type="text/javascript" src="/wenjuan/admin/js/jquery.js"></script>
    <script type="text/javascript" src="/wenjuan/admin/js/Chart.min.js"></script>
<script type="text/javascript">

$(function() {
	});

</script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="/wenjuan/wenjuanServlet?method=getTotal">后台首页</a></li>
               <li><a href="/wenjuan/index.jsp" target="_blank">前台首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>当前管理员:&nbsp;&nbsp;<span>${sessionScope.admin.admin}</span></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
     <%@ include file="common.inc" %>
 <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="/wenjuan/wenjuanServlet?method=getTotal">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">问卷管理</span></div>
        </div>
        
        <div class="result-wrap">
            
                <div class="result-title">
                    <div class="result-list" style="font-size: 24px;color: red;">
                      		当前问卷
                    </div>
                </div>
                <div class="result-content">
                	<div id="wenjuan">
	                    <table class="result-tab" width="86%">
	                        <tr>
	                            <th>编号</th>
	                            <th>标题</th>
	                            <th>描述</th>
	                            <th>是否置顶</th>
	                            <th>操作</th>
	                        </tr>
	                        <tr>
	                            <td>${wenjuan.wid}</td>
	                            <td>${wenjuan.wtitle}</td>
	                            <td>${wenjuan.wdesc}</td>
	                            <td>
	                            	<c:choose >
		                            	<c:when test="${wenjuan.isTop eq 1}" >
		                            		<span style="color: red;">是</span>
		                            	</c:when>
		                            	<c:otherwise>否</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td><a class="link-update" href="/wenjuan/wenjuanServlet?method=updatePre&wid=${wenjuan.wid}">修改</a>
	                            	 <a class="link-del" href="/wenjuan/wenjuanServlet?method=deleteWenjuan&wid=${wenjuan.wid}" onclick="return confirm('确定删除?')">删除</a>
	                            </td>
	                        </tr>
	                    </table>
                    </div>
                    
                    <div class="result-title" style="margin-top: 30px;">
	                    <div class="result-list">
	                        <a href="/wenjuan/admin/add.jsp?wid=${wenjuan.wid}"><i class="icon-font"></i>新增问题</a>
	                    </div>
               	    </div>
                    <div class="result-content">
	                    <ul class="detail" >
	                    <c:forEach items="${wenjuan.wentiList}" var="wenti">
	                    	<li>
	                    		<ul class="detail_item">
	                    			<li>${wenti.qnum}:&nbsp;&nbsp;${wenti.qtitle}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		                    			<a class="link-update" href="/wenjuan/wentiServlet?method=updateWentiPre&qid=${wenti.qid}&wid=${wenjuan.wid}">修改</a>
	                                	<a class="link-del" href="/wenjuan/wentiServlet?method=deleteWenti&qid=${wenti.qid}&wid=${wenjuan.wid}&isDelete=true" onclick="return confirm('确定删除?')">删除</a>
	                    			</li>
	                    			<c:forEach items="${wenti.xuanxiangList}" var="xuanxiang">
	                    				<c:choose>
	                    					<c:when test="${xuanxiang.onum eq 'other'}">
	                    					<li>${xuanxiang.onum}:&nbsp;&nbsp;
	                    						<input class="common-text required" type="text" size="40">
	                    					</li>
	                    					</c:when>
	                    					<c:otherwise>
	                    					<li>${xuanxiang.onum}:&nbsp;&nbsp;${xuanxiang.otitle}</li></c:otherwise>
	                    				</c:choose>
	                    			
	                    			</c:forEach>
	                    		</ul>
	                    	</li>
	                    </c:forEach>
	                    </ul>
                    </div>
                </div>
            
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>