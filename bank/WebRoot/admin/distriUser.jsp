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
<script type="text/javascript">

$(function() {
	});

</script>
</head>
<body>
 <div class="main-wrap">

        <div class="result-wrap">
            
                <div class="result-title">
                     <div class="result-list"  style="display: inline-block;">
                       <form action="${basePath }/admin/user/distriUser">
                        	<input type="text" name="search" placeholder="输入关键字" />
                        	<input type="submit" style="padding: 3px 12px 3px 12px;" value="搜索">
                        </form>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>序列</th>
                            <th>会员ID</th>
                            <th>姓名</th>
                            <th>身份证号</th>
                            <th>当前状态</th>
                            <th>操作</th>
                        </tr>
                    <c:forEach items="${userList}" var="user" varStatus="vs">
                        <tr>
                            <td>${vs.index+1}</td>
                            <td>${user.uname}</td>
                            <td>${user.uxm}</td>
                            <td>${user.ucard}</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${user.cid!=null }">已分配</c:when>
                            		<c:otherwise>未分配</c:otherwise>
                            	</c:choose>
                            </td>
                            <td>
                                <a class="link-update" href="${basePath }/admin/user/distri?uid=${user.uid}&pid=${pid}">分配</a>
                                <a class="link-update" href="${basePath }/admin/user/delDistri?uid=${user.uid}&pid=${pid}">解除分配</a>
                            </td>
                        </tr>
                       </c:forEach>
                       <tr>
				  			<td colspan="6">
				  				<nav>
								  <ul class="pagination">
								     总 ${totalRow } 条记录,每页 15 条,当前为第 ${nowPage } 页,总 ${totalPage } 页.
								    <li>
								    <c:choose>
								    	<c:when test="${nowPage <= 1 }"><span aria-hidden="true">上一页</span></c:when>
								    	<c:otherwise>
								    	  <a href="${basePath }/admin/user/distriUser?nowPage=${nowPage-1}" aria-label="Previous">
									        <span aria-hidden="true">上一页</span>
									      </a>
								    	</c:otherwise>
								    </c:choose>
								    </li>
								    <li>
								     <c:choose>
								    	<c:when test="${nowPage >= totalPage }"><span aria-hidden="true">下一页</span></c:when>
								    	<c:otherwise>
									    	 <a href="${basePath }/admin/user/distriUser?nowPage=${nowPage+1}" aria-label="Next">
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
</body>
</html>