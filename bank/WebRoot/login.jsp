<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MHB 感恩互助社区</title>
    <link href="${basePath}/Embed/bootstrap.min.css" rel="stylesheet" />
    <link href="${basePath}/Embed/supersized.css"  rel="stylesheet" />
    <link href="${basePath}/Embed/login.css" rel="stylesheet" />
    
    <!-- 后加的文件 -->
    <link href="${basePath}/Embed/logo.css"  rel="stylesheet" />
    <link rel="stylesheet" href="${basePath}/css/common.css">
    <link rel="stylesheet" href="${basePath}/css/logo.css">
    
    <!--[if IE 7]> 
     
     	<link rel="stylesheet" href="${basePath}/css/bootstrap-ie6.css" type="text/css"></link>
	    <link rel="stylesheet" href="${basePath}/css/bootstrap-theme.css" type="text/css"></link>
	    <link rel="stylesheet" href="${basePath}/css/ie.css" type="text/css"></link>
	    <link rel="stylesheet" href="${basePath}/css/non-responsive.css" type="text/css"></link>
	    <link rel="stylesheet" href="${basePath}/css/jianrong.css" type="text/css"></link>
     <![endif]-->

<body>

  <script type="text/javascript">
  //<![CDATA[
  var theForm = document.forms['ctl00'];
  if (!theForm) {
      theForm = document.ctl00;
  }
  function __doPostBack(eventTarget, eventArgument) {
      if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
          theForm.__EVENTTARGET.value = eventTarget;
          theForm.__EVENTARGUMENT.value = eventArgument;
          theForm.submit();
      }
  }
  
	function _pic() {
	/*
	* 1. 获取<img>元素
	* 2. 重新设置它的src
	* 3. 使用毫秒来添加参数
	*/
	$("#imgVerifyCode").attr("src", "${basePath}/vCode?a=" + new Date().getTime());
	}
  //]]>
  </script>
     <form method="post" action="${basePath}/user/check"  method="post">
    <div class="login-box">
      <div><span style="color:red">${error }</span></div>
      <div style="width:340px; height:40px; margin-bottom:60px;"><img width="340px" height="40px" src="${basePath}/images/logo.png" width="" height="40px"></div>
      <div class="row mr10">
        <div class="col-lg-4 text-left h40"> 用户名<!--用户名-->：</div>
        <div class="col-lg-8">
          <input name="user.uname" type="text" id="username" class="form-control" maxlength="16" />
        </div>
      </div>
      <div class="row mr10">
        <div class="col-lg-4 text-left h40"> 密码<!--密码-->：</div>
        <div class="col-lg-8">
          <input name="user.upwd" type="password" id="password" class="form-control" />
        </div>
      </div>
     <div class="row mr10">
        <div  class="col-lg-4 text-left h40">验证码<!--验证码-->：</div>
        <div class="col-lg-8">
        <input name="code" type="text" id="code" class="sdf" />
        <a id="verifyCode" href="javascript:_pic()" >
        	<img src="${basePath }/vCode" width="80" height="32" class="passcode" id="imgVerifyCode" title="换一张" alt="title="换一张"" />
        </a>
        </div>
      </div>
      <div class="row mr10">
        <div class="col-lg-4"></div>
        <div class="col-lg-8 text-left">
          <a class="forget_psw_btn" href="#">忘记密码?</a>
          </div>
      </div>
      <div class="row mr10">
        <div class="col-lg-12">
          <input name="button" type="submit" id="button" value="登录" class="btn btn-block btn-default" />
        </div>
      </div>
      <div class="row mr10">
        <div class="col-lg-4"></div>
       <!-- <div class="col-lg-8 text-left fontwhite"><a href="#">忘记密码</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">免费注册</a></div>-->
      </div>
    </div>
  </form>
  <div id="bottom"></div>
    <!-- 模态框，敬请期待 -->
    <div class="modal fade bs-example-modal-lg" id="forget_psw">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title ">温馨提示</h4>
          </div>
          <div class="modal-body">
            <div class="panel panel-primary">
              <div class="panel-body">
                忘记密码？请联系客服：</div>
              <div class="panel-footer panel-footer1 text_center">客服电话: 17097836642</div>
              <div class="panel-footer panel-footer1 text_center">工作时间: 9:00-16:00</div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          </div>
        </div>
      </div>
    </div>
   
</body>
	<script type="text/javascript" src="${basePath}/js/jquery-1.11.3.js"></script>
	<script src="${basePath}/js/bootstrap.min.js"></script>
    <script src="${basePath}/Embed/supersized.3.2.7.min.js"></script>
    <script src="${basePath}/Embed/supersized-init.js"></script>
    <!--[if lt IE 9]> 
	<script type="text/javascript" src="${basePath}/js/html5shiv.js"></script>
	<script type="text/javascript" src="${basePath}/js/respond.min.js"></script>
	<script type="text/javascript" src="${basePath}/js/bootstrap-ie.js"></script>
 <![endif]--> 
     <script type="text/javascript">
    $(".forget_psw_btn").click(function(){
      $("#forget_psw").modal();
    })
    </script>
</html>
