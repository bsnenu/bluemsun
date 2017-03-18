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
 <div class="main-wrap" style="text-align: center;">
        <div class="result-wrap">
        	<div style="text-align: center;color: red;">${msg }</div>
            		<form action="${basePath }/admin/user/product" method="post" >
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red">*</i>账号数量：</th>
                                <td>
                                    <select class="common-text required" id="num" name="num" >
                                    	<option value="100">100</option>
                                    	<option value="200">200</option>
                                    	<option value="500">500</option>
                                    	<option value="1000">1000</option>
                                    </select>
                                </td>
                            </tr>
               
                            <tr>
                            	<th><i class="require-red">*</i>账号类型：</th>
                                <td>
                                  <select class="common-text required" id="type" name="type" >
                                    	<option value="0">MHBA</option>
                                    	<option value="1">MHBC</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="生成" type="submit">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
        </div>
    </div>
</body>
</html>