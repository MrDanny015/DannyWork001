<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>易拉手管理系统</title>
  <link rel="stylesheet" href="/static/backstage/layui/css/layui.css">
    <script type="text/javascript" src="/static/backstage/javascript/jquery.min.js"></script>
    <script type="text/javascript" src="/static/backstage/javascript/index.js"></script>
    <script type="text/javascript" src="/static/backstage/layui/layui.js"></script>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">易拉手 YLaSour</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->

    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
            ${sessionScope.user.uname}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">个人资料</a></dd>
          <dd><a href="">安全中心</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="javascript:loginout();">注销</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">

      <!-- 左边tree页面 -->
      <div class="layui-side layui-bg-black">
          <div class="layui-side-scroll " >
              <div id="sidemenubar" lay-filter="test"></div>
          </div>
      </div>



  </div>
  
  <div class="layui-body" >
    <!-- 内容主体区域 -->
    <div style="">
        <!-- 选项卡要显示的地方 -->
        <div class="layui-body" style="left: 0px; top: 0px;">
            <div class="layui-tab" lay-filter="tabs" lay-allowClose="true" >
                <ul class="layui-tab-title">
                </ul>
                <div class="layui-tab-content" style="height: 831px;">
                </div>
            </div>
        </div>

    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © Danny.com - 丹尼先生
  </div>
</div>

</body>
<script type="text/javascript" >

    layui.use(['element','layer','jquery','tree'], function(){
        var element = layui.element;
        var layer = layui.layer;
        var $ = layui.jquery;
        $.ajax({
            type : "post",
            url : "selectTree?methodName=menuTreeList",
            dataType : "json",
            data : {// 传给servlet的数据,
                d : new Date()
            },
            success : function(data) {
                layui.tree({
                    elem: '#sidemenubar' //传入元素选择器
                    ,nodes: data
                    ,autoRefresh:true
                    ,click: function(node){
                        var exist=$("li[lay-id='"+node.id+"']").length;
                        if (exist > 0) {//判断是否已经发开选项卡
                            element.tabChange('tabs', node.id);// 切换到已有的选项卡
                        } else {//如果没打开就新建一个选项卡
                            if (node.hrefMD!=null) {
                                element.tabAdd('tabs', {
                                    title:node.name//选项卡的名称
                                    //把这个页面嵌套进选项卡中
                                    ,content:'<iframe scrolling="no" frameborder="0" src="'+node.hrefMD+'" width="99%" height="99%" />'//支持传入html
                                    //这是选项卡的id
                                    ,id:node.id
                                });
                                element.tabChange('tabs', node.id);
                            }
                        }
                    }
                });
            }
        });
    });

    function loginout() {
        $.post("/loginout.do");
        location.href="login.do";
    }
</script>
<style>


</style>
</html>