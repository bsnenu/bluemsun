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
    <script src="${basePath }/js/plugins/layer/layer.min.js"></script>
     <script type="text/javascript" charset="utf-8" src="${basePath }/admin/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${basePath }/admin/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${basePath }/admin/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

$(function() {
	

});

</script>
</head>
<body>
<div class="main-wrap">

        <div class="result-wrap">
            
                <div class="result-content">
                	 <table  width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red">*</i>标题：</th>
                                <td>
                                <c:if test="${news!=null }" >
                                	<input type="hidden" id="nid" name="nid" value="${news.nid}">
                                </c:if>
                                    <input class="common-text required" id="nname" name="nname" size="50" value="${news.nname}" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>内容：</th>
                                <td>
									    <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
                                </td>
                            </tr>
                             <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn6" onclick="getContent()" value="提交" type="button">
                                </td>
                            </tr>
                          </tbody>
                       </table>
                </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    
    ue.ready(function() {
        //设置编辑器的内容
        ue.setContent('${news.ncontent}');
        //获取html内容，返回: <p>hello</p>
    });
    
    function getContent() {
        var arr = [];
        arr.push(ue.getContent());
        //alert(arr.join("\n"));
        var nid = 0;
        if($("#nid")){
        	nid = $("#nid").val();
        }
        $.ajax({
  			cache: false,
  			type: "POST",	
  			url: "${basePath}/admin/news/add",	
  			data: {'nid':nid,'news.nname':$("#nname").val(),'news.ncontent': arr.join("")},	
  			async: false,
  			success: function(data) {
  				layer.msg('新闻添加或修改成功!');
  			},
  			error: function(request) {
  				layer.msg('添加添加或修改失败!');
  			}
 		});
    }

</script>
</html>