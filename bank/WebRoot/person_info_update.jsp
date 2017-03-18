<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>demo</title>
    <link rel="stylesheet" href="${basePath}/css/base.css">
    <link rel="stylesheet" href="${basePath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${basePath}/Font-Awesome-3.2.1\css\font-awesome.css">
    <link rel="stylesheet" href="${basePath}/css/common.css">
    <link rel="stylesheet" href="${basePath}/css/index.css">
    <!--[if IE 7]> 
     
     	<link rel="stylesheet" href="${basePath}/css/bootstrap-ie6.css" type="text/css"></link>
	    <link rel="stylesheet" href="${basePath}/css/bootstrap-theme.css" type="text/css"></link>
	    <link rel="stylesheet" href="${basePath}/css/ie.css" type="text/css"></link>
	    <link rel="stylesheet" href="${basePath}/css/non-responsive.css" type="text/css"></link>
	    <link rel="stylesheet" href="${basePath}/css/jianrong.css" type="text/css"></link>
     <![endif]-->
</head>
<body style="background:black;">
    <div class="container">
        <%@ include file="common.inc" %>
        <ol class="breadcrumb">
		  <li><a class="btn">您当前所在的位置：网站首页</a></li>
		  <li><a class="btn">个人中心</a></li>
		  <li class="active">资料修改</li>
		</ol>
        <div class="wrap panel person_div ">
            <form method="post" action="${basePath }/user/updateInfo" class="form-horizontal panel panel-primary">
             	<div class="panel-heading active">
                        <h3 class="panel-title">个人资料</h3>
                 </div>
			  	<div class="panel-body person_update_panel">
			  		<div class="form-group">
					    <label  class="col-sm-2 col-sm-offset-2 control-label">用户名</label>
					    <div class="col-sm-4">
					      <input type="hidden" name="user.uid" value="${user.uid }" />
					      <input type="text" name="user.uname" class="form-control" disabled="disabled" value="${user.uname }">
					    </div>
					  </div>
					  <div class="form-group">
					    <label  class="col-sm-2 col-sm-offset-2  control-label">姓名</label>
					    <div class="col-sm-4">
					      <input type="text" name="user.uxm" class="form-control" value="${user.uxm }">
					    </div>
					  </div>
					  <div class="form-group">
					    <label  class="col-sm-2 col-sm-offset-2 control-label">身份证号 :</label>
					    <div class="col-sm-4">
					      <input type="text" name="user.ucard" class="form-control number_id"  value="${user.ucard }">
					    </div>
					    <label  class="col-sm-4 control-label error_tip">*请输入正确的身份证号！</label>
					  </div>
					  <div class="form-group">
					    <label  class="col-sm-2 col-sm-offset-2 control-label">银行卡号 :</label>
					    <div class="col-sm-4">
					      <input type="text" name="user.ubank" class="form-control bank_card"  value="${user.ubank }">
					    </div>
					    <label  class="col-sm-4 control-label error_tip">*请输入正确的银行卡号！</label>
					  </div>
					  <div class="form-group">
					    <label  class="col-sm-2 col-sm-offset-2 control-label">开户银行 :</label>
					    <div class="col-sm-4">
					      <input type="text" name="user.uopen" class="form-control bank_name"  value="${user.uopen }">
					    </div>
					    <label  class="col-sm-4 control-label error_tip">*请输入开户银行！</label>
					  </div>
					  <div class="form-group">
					    <label  class="col-sm-2 col-sm-offset-2 control-label">手机号码 :</label>
					    <div class="col-sm-4">
					      <input type="text" name="user.utel" class="form-control phone_number"  value="${user.utel }">
					    </div>
					    <label  class="col-sm-4 control-label error_tip">*请输入正确的手机号！</label>
					  </div>
					  
					  <div class="form-group">
						<div class="col-sm-offset-4 col-sm-4">
							<a ><button type="submit" id="sure_update" class="btn btn-primary">确认修改</button></a>
						</div>
					</div>
					  
			  	</div>
			</form>
        </div>
        <%@ include file="footer.inc" %>
        <!-- container  end --> 
    </div>

    <!-- 模态框，敬请期待 -->
    <div class="modal fade" id="qidai">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title ">温馨提示</h4>
          </div>
          <div class="modal-body bg-info">
            <p class="">尚未开通，敬请期待~~</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
   

<script src="${basePath}/js/jquery-1.11.3.js"></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/slider.js"></script>
    <script src="${basePath}/js/common.js"></script>
    <!--[if lt IE 9]> 
	<script type="text/javascript" src="${basePath}/js/html5shiv.js"></script>
	<script type="text/javascript" src="${basePath}/js/respond.min.js"></script>
	<script type="text/javascript" src="${basePath}/js/bootstrap-ie.js"></script>
 <![endif]--> 

     <script type="text/javascript">
        $(".qidai_btn").click(function(){
            $("#qidai").modal();
        })
		
		
		
		/* 验证 */
		var flog1 = null;
		var flog2 = false;
		var flog3 = false;
		var flog4 = false;
		if($(".number_id").val() == ''){
			flog1 = false;
		}else{
			flog1 = true;
		}
		if($(".bank_card").val() == ''){
			flog2 = false;
		}else{
			flog2 = true;
		}
		if($(".bank_name").val() == ''){
			flog3 = false;
		}else{
			flog3 = true;
		}
		if($(".phone_number").val() == ''){
			flog4 = false;
		}else{
			flog4 = true;
		}
		$(".number_id").blur(function(){
			if($(this).val() == ''){
				$(this).parents(".form-group").find(".error_tip").show();
				flog1 = false;
			}else{
				$(this).parents(".form-group").find(".error_tip").hide();
				flog1 = true;
			}
		})
		$(".bank_card").blur(function(){
			if($(this).val() == ''){
				$(this).parents(".form-group").find(".error_tip").show();
				flog2 = false;
			}else{
				$(this).parents(".form-group").find(".error_tip").hide();
				flog2 = true;
			}
		})
		$(".bank_name").blur(function(){
			if($(this).val() == ''){
				$(this).parents(".form-group").find(".error_tip").show();
				flog3 = false;
			}else{
				$(this).parents(".form-group").find(".error_tip").hide();
				flog3 = true;
			}
		})
		$(".phone_number").blur(function(){
			if($(this).val() == ''){
				$(this).parents(".form-group").find(".error_tip").show();
				flog4 = false;
			}else{
				$(this).parents(".form-group").find(".error_tip").hide();
				flog4 = true;
			}
		})
		$("#sure_update").click(function(){
				if(flog1 == true && flog2 == true && flog3 == true && flog4 == true){
					alert("验证通过，可以修改");
					return true;
				}else{
					alert("不能提交！");
					return false;
					if(flog4 == false){
						$(".phone_number").focus();
					}
					if(flog3 == false){
						$(".bank_name").focus();
					}
					if(flog2 == false){
						$(".bank_card").focus();
					}
					if(flog1 == false){
						$(".number_id").focus();
					}
				}
			})
    </script>
    <!-- 图片轮播 -->
    <script type="text/javascript">
            $(function() {
                    var bannerSlider = new Slider($('#banner_tabs'), {
                        time: 5000,
                        delay: 400,
                        event: 'hover',
                        auto: true,
                        mode: 'fade',
                        controller: $('#bannerCtrl'),
                        activeControllerCls: 'active'
                    });
                    $('#banner_tabs .flex-prev').click(function() {
                        bannerSlider.prev()
                    });
                    $('#banner_tabs .flex-next').click(function() {
                        bannerSlider.next()
                    });
                })
                </script>

</body>
</html>