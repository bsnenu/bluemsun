<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
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
            <span class="crumb-step">&gt;</span><span>
            <c:choose>
            	<c:when test="${person eq null}">新增联系人</c:when>
            	<c:otherwise>修改联系人</c:otherwise>
            </c:choose>
            	</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
            <c:choose>
            	<c:when test="${person eq null}">
            		 <form action="${basePath }/admin/person/add" method="post" >
            	</c:when>
            	<c:otherwise>
            		 <form action="${basePath }/admin/person/update" method="post" >
            	</c:otherwise>
            </c:choose>
                   <c:if test="${person!=null}">
					  <input type="hidden" name="person.pid" value="${person.pid}">
					</c:if>        
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red">*</i>姓名：</th>
                                <td>
                                    <input class="common-text required" id="wtitle" name="person.pname" size="50" value="${person.pname}" type="text">
                                </td>
                            </tr>
               
                            <tr>
                            	<th><i class="require-red">*</i>联系电话：</th>
                                <td>
                                    <input class="common-text required" id="wtitle" name="person.ptel" size="50" value="${person.ptel}" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>