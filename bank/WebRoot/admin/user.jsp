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

	
	function distri(uid){
		   layer.open({
               type: 2,
               title: ['&nbsp;&nbsp分配', 'text-align:center;margin:0 auto;font-size:24px;'],
               shadeClose: false,
               shade: [0.3, '#393D49'],
               fix: true,
               //maxmin: true, //开启最大化最小化按钮
                area: ['76%', '76%'],
                end:function(){
                	location.reload();
                },
               //closeBtn: 2,
               content: '${basePath }/admin/user/distriUser?uid='+uid
           });
	};
	
	function product(){
		   layer.open({
            type: 2,
            title: ['&nbsp;&nbsp生成账号', 'text-align:center;margin:0 auto;font-size:24px;'],
            shadeClose: false,
            shade: [0.3, '#393D49'],
            fix: true,
            //maxmin: true, //开启最大化最小化按钮
             area: ['46%', '46%'],
             end:function(){
             	location.reload();
             },
            //closeBtn: 2,
            content: '${basePath }/admin/user/productUser'
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
           		 用户管理
        </div>
        
        <div class="result-wrap">
            
                <div class="result-title">
                    <div class="result-list" style="display: inline-block;">
                    	<a class="link-update" onclick="product()" href="#"><i class="icon-font"></i>生成账号</a>
                    </div>
                     <div class="result-list"  style="display: inline-block;">
                       <form action="${basePath }/admin/user" method="post">
                        	<input type="text" name="search" placeholder="输入关键字" />
                        	<input type="submit" style="padding: 3px 12px 3px 12px;" value="搜索">
                        </form>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="86%">
                        <tr>
                            <th>序列</th>
                            <th>会员ID</th>
                            <th>姓名</th>
                            <th>身份证号</th>
                            <th>推荐人</th>
                            <th>团队人员</th>
                            <th>操作</th>
                        </tr>
                    <c:forEach items="${userList}" var="user" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${user.uname}</td>
                            <td>${user.uxm}</td>
                            <td>${user.ucard}</td>
                            <td>${user.tjr}</td>
                            <td>${user.team}</td>
                            <td>
                                <a class="link-update" href="${basePath }/admin/user/getUserById?uid=${user.uid}">查看详细</a>
                                <a class="link-update" onclick="distri(${user.uid})" href="#">分配</a>
                                
                                <a class="link-update" href="${basePath }/admin/user/remove?uid=${user.uid}" onclick="return confirm('确认删除?')">删除</a>
                            
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
								    	  <a href="${basePath }/admin/user?nowPage=${nowPage-1}" aria-label="Previous">
									        <span aria-hidden="true">上一页</span>
									      </a>
								    	</c:otherwise>
								    </c:choose>
								    </li>
								    <li>
								     <c:choose>
								    	<c:when test="${nowPage >= totalPage }"><span aria-hidden="true">下一页</span></c:when>
								    	<c:otherwise>
									    	 <a href="${basePath }/admin/user?nowPage=${nowPage+1}" aria-label="Next">
									       		 <span aria-hidden="true">下一页</span>
									      	</a>
								    	</c:otherwise>
								    </c:choose>
								    </li>
								    
								    <!-- 更改与7月2日，添加跳转到功能 -->
								    <li>
								    跳转至
								    <select onchange="javascript:location.href=this.value;">
								    <c:forEach begin="1" end="${totalPage}" var="i">
								     <c:choose>
								    	<c:when test="${i == nowPage}">
								    		<span aria-hidden="true"><option selected="selected">${i}</option></span>
								    	</c:when>
								    	<c:otherwise>
									    	 <a href="${basePath }/admin/user?nowPage=${i}" aria-label="to">
									       		 <span aria-hidden="true"><option value="${basePath }/admin/user?nowPage=${i}">${i}</option></span>
									      	</a>
								    	</c:otherwise>
								    </c:choose>
								    </c:forEach>
								    </select>页
								    </li>
								    <!-- 修改结束 -->
								    
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