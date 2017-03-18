<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MHB 感恩互助社区后台管理</title>
    <link rel="stylesheet" type="text/css" href="${basePath }/admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath }/admin/css/main.css"/>
    <script type="text/javascript" src="${basePath }/admin/js/jquery.js"></script>
    <script type="text/javascript" src="${basePath }/admin/js/modernizr.min.js"></script>
     <script src="${basePath }/admin/js/pintuer.js"></script>
</head>
<body>
<div class="topbar-wrap white">
<%@ include file="common.inc" %>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i>
           	 首页<span class="crumb-step">&gt;</span><span class="crumb-name">修改密码</span></div>
        </div>
        <div class="result-wrap">
            <form action="${basePath }/admin/updatePwd" method="post" id="myform" name="myform">
                 <input type="hidden" name="method" value="update">
                <div class="config-items">
                    <div class="config-title">
                        <h1><i class="icon-font">&#xe00a;</i>设置新密码</h1>
                    </div>
                    <div class="result-content">
                        <table width="86%" class="insert-tab">
                            <tbody>
                            <tr style="text-align: center;">
                              
                                <td colspan="2">&nbsp;<span style="color: red;">${requestScope.error}</span>&nbsp;</td>
                            </tr>
                                <tr>
                                    <th><i class="require-red">*</i>新密码：</th>
                                    <td><input type="password" id="" value="" size="65" name="newPwd" class="common-text" /></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>重复新密码：</th>
                                    <td><input type="password" id="" value="" size="65" name="rePwd" class="common-text" /></td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td>
                                        <input type="submit" value="提交" class="btn btn-primary btn6 mr10">
                                        <input type="button" value="返回" onclick="history.go(-1)" class="btn btn6">
                                    </td>
                                </tr>
                            </tbody></table>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>>