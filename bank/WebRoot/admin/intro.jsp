<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MHB 感恩互助社区后台管理</title>
    <link rel="stylesheet" type="text/css" href="${basePath }/admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath }/admin/css/main.css"/>
    <script type="text/javascript" src="${basePath }/admin/js/modernizr.min.js"></script>
    <script type="text/javascript" src="${basePath }/admin/js/jquery.js"></script>
    <script type="text/javascript" charset="utf-8" src="${basePath }/admin/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${basePath }/admin/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${basePath }/admin/lang/zh-cn/zh-cn.js"></script>
     <script src="${basePath }/js/plugins/layer/layer.min.js"></script>

</head>
<body>

<div class="topbar-wrap white">
    <%@ include file="common.inc" %>
 	<div class="main-wrap">

        	<div class="crumb-wrap">
	         	<div class="crumb-list"><i class="icon-font"></i>
		           		 首页
		            <span class="crumb-step">&gt;</span>
		           		 公司介绍
		        </div>
		     </div>
	        <div class="result-wrap">
	                <div class="result-content" >
	                  	
	                  	<div >
						    <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
						</div>
						<div style="text-align:center">
							 <input class="btn btn6" onclick="getContent()" value="提交" type="button">
						</div>
					</div>
	  		</div>  
	</div>
</div>
</body>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    function getContent() {
        var arr = [];
        arr.push(ue.getContent());
        //alert(arr.join("\n"));
        $.ajax({
  			cache: false,
  			type: "POST",	
  			url: "${basePath}/admin/intro/addIntro",	
  			data: {iintro: arr.join("")},	
  			async: false,
  			success: function(data) {
  				layer.msg('公司介绍添加成功!');
  			},
  			error: function(request) {
  				layer.msg('公司介绍添加失败!');
  			}
 		});
    }

</script>
</html>