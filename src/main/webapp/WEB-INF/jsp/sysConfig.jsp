<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>layout 后台大布局 - Layui</title>
  <link rel="stylesheet" href="../../../../../../../前端工作库/adminmagerlayui/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">layui 后台布局</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="admin.jsp">用户列表</a></li>
      <li class="layui-nav-item"><a href="member.jsp">会员列表</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          贤心
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item"><a href="../../../../../../../前端工作库/adminmagerlayui/index.html">控制台</a></li>
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">系统设置</a>
          <dl class="layui-nav-child">
            <dd><a class="layui-this" href="sysConfig.jsp">系统变量</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">用户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="admin.jsp">用户列表</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">权限管理</a>
            <dl class="layui-nav-child">
                <dd><a href="rule.html">规则列表</a></dd>
                <dd><a href="role.html">角色列表</a></dd>
                <dd><a href="adminRole.html">用户角色</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
                <a href="javascript:;">会员管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="member.jsp">会员列表</a></dd>
                </dl>
            </li>
        <li class="layui-nav-item">
            <a href="javascript:;">开发者工具</a>
            <dl class="layui-nav-child">
                <dd><a href="control.html">一键生成</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">集成Demo</a>
            <dl class="layui-nav-child">
                <dd><a href="upload.html">文件上传</a></dd>
                <dd><a href="upload.html">Execel导出</a></dd>
            </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>系统设置 - 系统变量</legend>
            <div class="layui-field-box">
                <div class="layui-btn-group">
                    <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="create.html" dw-title="新增系统变量">
                        <i class="layui-icon">&#xe654;</i>新增
                    </button>
                    <button class="layui-btn layui-btn-xs dw-refresh">
                        <i class="layui-icon">&#x1002;</i>刷新
                    </button>
                </div>
                <hr>
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">输入框</label>
                        <div class="layui-input-block">
                        <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码框</label>
                        <div class="layui-input-inline">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">辅助文字</div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择框</label>
                        <div class="layui-input-block">
                        <select name="city" lay-verify="required">
                            <option value=""></option>
                            <option value="0">北京</option>
                            <option value="1">上海</option>
                            <option value="2">广州</option>
                            <option value="3">深圳</option>
                            <option value="4">杭州</option>
                        </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">复选框</label>
                        <div class="layui-input-block">
                        <input type="checkbox" name="like[write]" title="写作">
                        <input type="checkbox" name="like[read]" title="阅读" checked>
                        <input type="checkbox" name="like[dai]" title="发呆">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">开关</label>
                        <div class="layui-input-block">
                        <input type="checkbox" name="switch" lay-skin="switch">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">单选框</label>
                        <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男">
                        <input type="radio" name="sex" value="女" title="女" checked>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">文本域</label>
                        <div class="layui-input-block">
                        <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script type="text/javascript" src="../../../../../../../前端工作库/adminmagerlayui/javascript/jquery.min.js"></script>
<script type="text/javascript" src="../../../../../../../前端工作库/adminmagerlayui/layui/layui.js"></script>
<script type="text/javascript" src="../../../../../../../前端工作库/adminmagerlayui/javascript/sys_config.js"></script>
</body>
</html>