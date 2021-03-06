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
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="Font-Awesome-3.2.1\css\font-awesome.css">
    
    
     
   
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
    
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
        
        <div class="wrap index_wrap">
            <div class="row">
                <div class="col-md-3">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h3 class="panel-title">新用户注册</h3>
                      </div>
                      <div class="panel-body new_uesr_reg">
                            <a  class="reg_btn" href="member_buy.jsp"><i class="glyphicon glyphicon-hand-right"></i> 新用户注册</a>
                      </div>
                    </div>
                    <div class="panel panel-primary">
                      <div class="panel-heading active">
                        <h3 class="panel-title">新闻中心</h3>
                      </div>
                      <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item"><a target="_blank" href="news_list_one.jsp">这是一条新闻一条新闻一条新闻一条新闻一条新闻</a></li>
                            <li class="list-group-item"><a target="_blank" href=WW"news_list_one.jsp">这是一条新闻</a></li>
                            <li class="list-group-item"><a target="_blank" href="news_list_one.jsp">这是一条新闻</a></li>
                            <li class="list-group-item"><a target="_blank" href="news_list_one.jsp">这是一条新闻</a></li>
                        </ul>
                      </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <table class="table">
                        <tr>
                            <td class="each_td">初始排队</td>
                            <td class="each_td">接受资助</td>
                        </tr>
                        <tr>
                            <td class="each_td">正式排队</td>
                            <td class="each_td">交易钱包：<a class="qidai_btn">点击查看</a></td>
                        </tr>
                        <tr>
                            <td class="each_td">出局钱包：<a class="qidai_btn">点击查看</a></td>
                            <td class="each_td">管理钱包：<a class="qidai_btn">点击查看</a></td>
                        </tr>
                        <tr>
                            <td class="each_td">申请列表：<a class="qidai_btn">点击查看</a></td>
                            <td class="each_td">接受列表：<a  style="font-size:14px;letter-spacing:-2px;">余额：2000元</a></td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-3 index_user_center">
                    <div class="list-group">
                      <a href="#" class="list-group-item active">
                        用户中心
                      </a>
                      <a href="#" class="list-group-item">用户ID：<span class="color_info">张广友</span></a>
                      <a href="#" class="list-group-item">姓名：<span class="color_info">张广友</span></a>
                      <a href="#" class="list-group-item">服务中心：<span class="color_red">张广友</span></a>
                      <a href="#" class="list-group-item">信用级别：<span class="color_red">2级</span></a>
                    </div>
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
            <p class="text_center please">请等待开盘!</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
           

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.min.js"></script>

<!--[if lt IE 9]> 
	<script type="text/javascript" src="js/html5shiv.js"></script>
	<script type="text/javascript" src="js/respond.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-ie.js"></script>
 <![endif]--> 
<script src="./js/slider.js"></script>
    <script src="./js/common.js"></script>

     <script type="text/javascript">
        $(".qidai_btn").click(function(){
            $("#qidai").modal();
        });
        $(".reg_btn").click(function(){
            $("#reg").modal();
        });
        
    	

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