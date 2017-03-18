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
	           		 联系人管理
	        </div>
        </div>
        
        <div class="result-wrap">
            
                <div class="result-title">
                    <div class="result-list">
                        <a href="${basePath }/admin/person/addPerson"><i class="icon-font"></i>新增联系人</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="86%">
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>联系电话</th>
                            <th>操作</th>
                        </tr>
                    <c:forEach items="${personList}" var="person" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${person.pname}</td>
                            <td>${person.ptel}</td>
                            <td>
                                <a class="link-update" href="${basePath }/admin/person/updatePerson?pid=${person.pid}">修改</a>
                                <a class="link-update" href="${basePath }/admin/person/remove?pid=${person.pid}" onclick="return confirm('确认删除?')">删除</a>
                            
                            </td>
                        </tr>
                       </c:forEach>
                    </table>
                </div>
            
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>