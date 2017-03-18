<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>MHB 感恩互助社区后台管理</title>
    <link rel="stylesheet" href="${basePath }/admin/css/pintuer.css">
    <link rel="stylesheet" href="${basePath }/admin/css/admin.css">
    <script src="${basePath }/admin/js/jquery.js"></script>
    <script src="${basePath }/admin/js/pintuer.js"></script>

    

	<script type="text/javascript">
		function _pic() {
	/*
	 * 1. 获取<img>元素
	 * 2. 重新设置它的src
	 * 3. 使用毫秒来添加参数
	 */
	$("#imgVerifyCode").attr("src", "${basePath}/vCode?a=" + new Date().getTime());
}
	</script>
</head>

<body>
<div class="container">
    <div class="line">
        <div class="xs6 xm4 xs3-move xm4-move">
        	
            <br /><br />
             <div class="media media-y">
                <span style="font-size: 18px;color: red;">${error}</span>
            </div>
            <br /><br />
            <form action="${basePath }/admin/check" method="post">
            <div class="panel">
                <div class="panel-head"><strong>管理员登录</strong></div>
                <div class="panel-body" style="padding:30px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input" name="manager.mname" value="" placeholder="登录账号" data-validate="required:请填写账号,length#>=1:账号长度不符合要求" />
                            <span class="icon icon-user"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                        	<input type="hidden" name="method" value="login">
                            <input type="password" class="input" value="" name="manager.mpwd" placeholder="登录密码" data-validate="required:请填写密码,length#>=1:密码长度不符合要求" />
                            <span class="icon icon-key"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <input name="code" type="text" id="code" class="sdf" placeholder="验证码" />
					        <a id="verifyCode" href="javascript:_pic()" >
					        	<img src="${basePath}/vCode" width="80" height="32" class="passcode" id="imgVerifyCode" title="换一张" alt="title="换一张"" />
					        </a>
                        </div>
                    </div>
                </div>
                <div class="panel-foot text-center"><button class="button button-block bg-main text-big">立即登录后台</button></div>
            </div>
            </form>
            
        </div>
    </div>
</div>

</body>
</html>