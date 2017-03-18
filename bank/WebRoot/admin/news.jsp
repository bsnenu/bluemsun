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
     <script src="${basePath }/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript">

	
	function updateNews(nid){
		   layer.open({
               type: 2,
               title: ['&nbsp;&nbsp修改新闻', 'text-align:center;margin:0 auto;font-size:24px;'],
               shadeClose: false,
               shade: [0.3, '#393D49'],
               fix: true,
               //maxmin: true, //开启最大化最小化按钮
                area: ['76%', '76%'],
                end:function(){
                	location.reload();
                },
               //closeBtn: 2,
               content: '${basePath }/admin/news/addNews?nid='+nid
           });
	};
	
	function addNews(){
		   layer.open({
            type: 2,
            title: ['&nbsp;&nbsp添加新闻', 'text-align:center;margin:0 auto;font-size:24px;'],
            shadeClose: false,
            shade: [0.3, '#393D49'],
            fix: true,
            //maxmin: true, //开启最大化最小化按钮
             area: ['76%', '76%'],
             end:function(){
             	location.reload();
             },
            //closeBtn: 2,
            content: '${basePath }/admin/news/addNews'
        });
	};

</script>
</head>
<body>
<div class="topbar-wrap white">
    <%@ include file="common.inc" %>
 <div class="main-wrap">

        <div class="crumb-wrap">
         <div class="crumb-list"><i class="icon-font"></i>
           		首页
            <span class="crumb-step">&gt;</span>
           		新闻管理
        </div>
        
        <div class="result-wrap">
            
                <div class="result-title">
                    <div class="result-list" style="display: inline-block;">
                    	<a class="link-update" onclick="addNews()" href="#"><i class="icon-font"></i>添加新闻</a>
                    </div>
                     <div class="result-list"  style="display: inline-block;">
                       <form action="${basePath }/admin/news">
                        	<input type="text" name="search" placeholder="输入关键字" />
                        	<input type="submit" style="padding: 3px 12px 3px 12px;" value="搜索">
                        </form>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="86%">
                        <tr>
                            <th>编号</th>
                            <th>标题</th>
                            <th>发布时间</th>
                            <th>操作</th>
                        </tr>
                    <c:forEach items="${newsList}" var="news" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${news.nname}</td>
                            <td>${news.ntime}</td>
                            <td>
                                <a class="link-update" href="#" onclick="updateNews(${news.nid})">修改</a>
                                <a class="link-update" href="${basePath }/admin/news/remove?nid=${news.nid}" onclick="return confirm('确认删除?')">删除</a>
                            </td>
                        </tr>
                       </c:forEach>
                       <tr>
				  			<td colspan="7">
				  				<nav>
								  <ul class="pagination">
								     总 ${totalRow } 条记录,每页 15 条,当前为第 ${nowPage } 页,总 ${totalPage } 页.
								    <li>
								    <c:choose>
								    	<c:when test="${nowPage <= 1 }"><span aria-hidden="true">上一页</span></c:when>
								    	<c:otherwise>
								    	  <a href="${basePath }/admin/news?nowPage=${nowPage-1}" aria-label="Previous">
									        <span aria-hidden="true">上一页</span>
									      </a>
								    	</c:otherwise>
								    </c:choose>
								    </li>
								    <li>
								     <c:choose>
								    	<c:when test="${nowPage >= totalPage }"><span aria-hidden="true">下一页</span></c:when>
								    	<c:otherwise>
									    	 <a href="${basePath }/admin/news?nowPage=${nowPage+1}" aria-label="Next">
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
            
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>