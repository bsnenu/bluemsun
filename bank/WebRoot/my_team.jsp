<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		  <li class="active">我的团队</li>
		</ol>
        <div class="wrap panel member_div">
                 <table class="table table-bordered">
				  	<thead>
				  		<tr class="bg_primary">
				  			<th class="text_center">序列</th>
				  			<th class="text_center">会员ID</th>
				  			<th class="text_center">注册时间</th>
				  			<th class="text_center">级别</th>
				  			<th class="text_center">推荐人</th>
				  			<th class="text_center">开通时间</th>
				  		</tr>
				  	</thead>
				  		<c:forEach items="${userList }" var="user" varStatus="vs">
					  		<tr>
					  			<td>${vs.index+1 }</td>
					  			<td>${user.uname }</td>
					  			<td><fmt:formatDate value="${user.uregist }" type="both" /></td>
					  			<td>vip</td>
					  			<td>${sessionScope.user.uxm }</td>
					  			<td><fmt:formatDate value="${user.utime }" type="both" /></td>
					  		</tr>
				  		</c:forEach>
				  		<tr>
				  			<td colspan="6">
				  				<nav>
								  <ul class="pagination">
								    <li>
								    <c:choose>
								    	<c:when test="${nowPage <= 1 }"><span aria-hidden="true">上一页</span></c:when>
								    	<c:otherwise>
								    	  <a href="${basePath }/user/team?nowPage=${nowPage-1}" aria-label="Previous">
									        <span aria-hidden="true">上一页</span>
									      </a>
								    	</c:otherwise>
								    </c:choose>
								    </li>
								    <li>
								     <c:choose>
								    	<c:when test="${nowPage>=totalPage }"><span aria-hidden="true">下一页</span></c:when>
								    	<c:otherwise>
									    	 <a href="${basePath }/user/team?nowPage=${nowPage+1}" aria-label="Next">
									       		 <span aria-hidden="true">下一页</span>
									      	</a>
								    	</c:otherwise>
								    </c:choose>
								    </li>
								  </ul>
								</nav>
				  			</td>
				  		</tr>
				  </table>
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