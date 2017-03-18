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
		  <li><a class="btn">业务管理</a></li>
		  <li class="active">购买激活码</li>
		</ol>
        <div class="wrap panel member_div buy_panel">
            <p class="bg-info">! 提示：挂单币200元。</p>   
            <div class="panel panel-primary">
                      <div class="panel-heading active">
                        <h3 class="panel-title">联系人</h3>
                      </div>
                      <div class="panel-body">
                        <ul class="list-group">
                           <c:forEach items="${personList }" var="person">
                           	 <li class="list-group-item">${person.pname }&nbsp;&nbsp;&nbsp;&nbsp;<span class="color_red">${person.ptel }</span></li>
                           </c:forEach>
                        </ul>
                      </div>
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
	<script type="text/javascript" src="${basePath}/js/html5shiv.js"></script>
	<script type="text/javascript" src="${basePath}/js/respond.min.js"></script>
	<script type="text/javascript" src="${basePath}/js/bootstrap-ie.js"></script>
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