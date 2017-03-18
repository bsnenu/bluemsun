<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="row logo_div">
        	<div class="col-md-10">
        		<img src="${basePath}/images/logo.png" height="75px">
        	</div>
            <div class="col-md-2 log_out color_red">
                <a class="color_red" href="${basePath}/user/out">退出</a>
            </div>
        </div>
        <!-- nav -->

        <div class="row nav_bg">
            <div class="col-md-12 nav_div">
            <ul class="nav nav-pills" role="tablist">
              <li role="presentation" class="dropdown">
                <a id="drop1" href="${basePath}/user/main">
                  网站首页
                </a>
              </li>
              <li role="presentation" class="dropdown">
                <a id="drop8" href="${basePath}/user/getIntro"  role="button" aria-haspopup="true" aria-expanded="false">
                  公司介绍
                  <!-- <span class="caret"></span> -->
                </a>
              </li>
              <li role="presentation" class="dropdown">
                <a id="drop3" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  个人中心
                  <span class="caret"></span>
                </a>
                <ul id="menu3" class="dropdown-menu" aria-labelledby="drop6">
                  <li><a  href="${basePath }/user/userInfo">个人资料</a></li>
                  <li><a  href="${basePath }/user/updateUserInfo">修改资料</a></li>
                  <li><a  href="${basePath }/user/updateUserPwd">密码修改</a></li>
                </ul>
              </li>
              <li role="presentation" class="dropdown">
                <a id="drop4" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  业务管理
                  <span class="caret"></span>
                </a>
                <ul id="menu4" class="dropdown-menu" aria-labelledby="drop6">
                  <li><a  href="${basePath }/user/personList">购买激活码</a></li>
                  <li><a  href="${basePath }/user/team">我的团队</a></li>
                </ul>
              </li>
              <li role="presentation" class="dropdown">
                <a id="drop5" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  交易中心
                  <span class="caret"></span>
                </a>
                <ul id="menu5" class="dropdown-menu" aria-labelledby="drop6">
                  <li><a class="wait_open_btn" href="#">提供资助</a></li>
                  <li><a class="wait_open_btn" href="#">接受资助</a></li>
                  <li><a class="wait_open_btn" href="#">申请资助列表</a></li>
                  <li><a class="wait_open_btn" href="#">接受资助列表</a></li>
                  <li><a class="wait_open_btn" href="#">正式排队</a></li>
                  <li><a class="wait_open_btn" href="#">查看正式列表</a></li>
                  <li><a  href="${basePath }/user/freeQueue">查看免费列表</a></li>
                </ul>
              </li>
              <li role="presentation" class="dropdown">
                <a id="drop6" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  现金管理
                  <span class="caret"></span>
                </a>
                <ul id="menu6" class="dropdown-menu" aria-labelledby="drop6">
                  <li><a class="no_start_btn" href="#">汇款通知</a></li>
                  <li><a class="no_start_btn" href="#">公司账号</a></li>
                  <li><a class="no_start_btn"  href="#">信用转账</a></li>
                </ul>
              </li>
              <li role="presentation" class="dropdown">
                <a id="drop7" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                  财务管理
                  <span class="caret"></span>
                </a>
                <ul id="menu7" class="dropdown-menu" aria-labelledby="drop6">
                  <li><a class="wait_open_btn"   href="#">报单账户</a></li>
                  <li><a class="wait_open_btn"  href="#">出局钱包</a></li>
                  <li><a class="wait_open_btn"   href="#">交易钱包</a></li>
                  <li><a class="wait_open_btn"   href="#">管理钱包</a></li>
                  <li><a class="wait_open_btn"   href="#">MH币钱包</a></li>
                  <li><a class="wait_open_btn"   href=#">管理钱包转出</a>
                  </li>
                  <li><a class="wait_open_btn"   href="#">奖金流水</a></li>

                </ul>
              </li>
              <li role="presentation" class="dropdown">
                <a id="drop2" href="${basePath }/user/news/getNewsList"  role="button" aria-haspopup="true" aria-expanded="false">
                  新闻中心
                </a>
              </li>
              
            </ul>
        </div>
        </div>

        <!-- pic -->
        <div class="row">
            <div class="col-md-12 picture_div">
            <div id="banner_tabs" class="flexslider">
                <ul class="slides">
                    <li>
                        <a title=""  href="#">
                            <img width="1200" height="302" alt="" style="background: url(${basePath}/images/banner1.jpg) no-repeat center;" src="${basePath}/images/banner01.jpg">
                        </a>
                    </li>
                    <li>
                        <a title="" href="#">
                            <img width="1200" height="302" alt="" style="background: url(${basePath}/images/banner2.jpg) no-repeat center;" src="${basePath}/images/banner02.jpg">
                        </a>
                    </li>
                    <li>
                        <a title="" href="#">
                            <img width="1200" height="302" alt="" style="background: url(${basePath}/images/banner3.jpg) no-repeat center;" src="${basePath}/images/banner05.jpg">
                        </a>
                    </li>
                </ul>
                <ul class="flex-direction-nav">
                    <li><a class="flex-prev" href="javascript:;">Previous</a></li>
                    <li><a class="flex-next" href="javascript:;">Next</a></li>
                </ul>
                <ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
                    <li><a>1</a></li>
                    <li><a>2</a></li>
                    <li><a>2</a></li>
                </ol>
            </div>
            
            </div>  
        </div>

        

    
    
        <!-- 模态框，尚未开始 -->
    <div class="modal fade" id="no_start">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title ">温馨提示</h4>
          </div>
          <div class="modal-body bg-info">
            <p class="text_center please">交易尚未开始!</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
        <!-- 模态框，尚未开盘 -->
    <div class="modal fade" id="wait_open">
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
    
    
