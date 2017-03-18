<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
     
     	<link rel="stylesheet" href="css/bootstrap-ie6.css" type="text/css"></link>
	    <link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css"></link>
	    <link rel="stylesheet" href="css/ie.css" type="text/css"></link>
	    <link rel="stylesheet" href="css/non-responsive.css" type="text/css"></link>
	    <link rel="stylesheet" href="css/jianrong.css" type="text/css"></link>
     <![endif]-->
</head>
<body style="background:black;">
    <div class="container">
        <%@ include file="common.inc" %>
        <ol class="breadcrumb">
		  <li><a class="btn">您当前所在的位置：网站首页</a></li>
		  <li><a class="btn">交易中心</a></li>
		  <li class="active">排队列表</li>
		</ol>
        <div class="wrap panel">
             	<div class="list-group">
				  <a class="list-group-item active">
				    免费排队列表
				  </a>
				  <a class="list-group-item">当前排队的人数：<span class="color_red">56132</a>
				  <table class="table table-bordered">
				  	<thead>
				  		<tr>
				  			<th class="text_center">序列</th>
				  			<th class="text_center">钱包编号</th>
				  			<th class="text_center">排队时间</th>
				  			<th class="text_center">操作</th>
				  		</tr>
				  	</thead>
				  </table>
				</div>
             	
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
	<script type="text/javascript" src="js/html5shiv.js"></script>
	<script type="text/javascript" src="js/respond.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-ie.js"></script>
 <![endif]--> 

     <script type="text/javascript">
        $(".qidai_btn").click(function(){
            $("#qidai").modal();
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