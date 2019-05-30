<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="shortcut icon" href="" type="image/x-icon">
    <link rel="stylesheet" charset="UTF-8" href="/static/login/css/reset.css">
    <link rel="stylesheet" charset="utf-8" href="/static/login/css/web_pop.css">
    <link rel="stylesheet" charset="UTF-8" href="/static/login/css/login.css">
    <script type="text/javascript" charset="utf-8" src="/static/login/js/jquery.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="/static/login/js/jquery.form.js"></script>
    <script type="text/javascript" charset="utf-8" src="/static/login/js/layer.js"></script>
    <script type="text/javascript" charset="utf-8" src="/static/login/js/web_method/method.js~v=2"></script>
    <script type="text/javascript" charset="UTF-8" src="/static/login/js/login_register/user_register.js~v=10"></script>
</head>
<body>
    <div class="login_header">
        <div class="header_center clearfix">
            <div class="myfl">
                <a href="index.do"><img src="/static/login/img/logo_login_home.png"/></a>
                <span>欢迎登陆</span>
            </div>
            <div class="myfr">
                <a href="index.do">返回首页</a><span></span><a href="javascript:;" class="collection_web">收藏网站</a>
            </div>
        </div>
    </div>
    <div class="login_content clearfix">
        <input type="hidden" id="memberType" value="" />

            <input type="hidden" name="memberType" id="parameter" value="1"/>
            <div class="login_box myfr">
                <p class="tabchange clearfix">
                    <span class="myfl sign_select" id="usertype" style=" width: 171px;">用户登录</span>
                    <em class="myfl"></em>
                    <span class="myfl bor_bottom" id="sellertype">商家登录</span>
                </p>
                <p class="system_error"></p>
                <input type="text"  value="" placeholder="手机号/用户名" id="usernameid"/>
                <p class="username_error"><span>用户名不能为空!</span></p>
                <input type="password" placeholder="登录密码" id="userpwdid" maxlength="16" value=""/>
                <p class="password_error"><span>密码不能为空!</span></p>
                <p class="forget_password clearfix"><a href="" class="myfr">忘记密码？</a></p>
                <a  href="javascript:login();" ><input type="submit" value="立即登录"  class="submit_btn"></a>
                <p class="entry_mode clearfix">
                    <span class="myfl">你也可以用以下方式登录:</span>
                    <a href="/source.do" class="myfr">
                        <em></em>
                        <i>快速注册</i>
                    </a>
                </p>
            </div>

    </div>
    <div class="login_bottom">@Danny.com &nbsp;&nbsp;丹尼先生开源制作 &nbsp;&nbsp;浙ICP17088888号-1 &nbsp;&nbsp;版权所有</div>
</body>
<script type="text/javascript">
    //登陆方法
    function login() {
        var username=$("#usernameid").val();
        var userpwd=$("#userpwdid").val();
            $.post("loginis",{username:username,userpwd:userpwd}, function (data) {
            console.log(data);
            if (data.flag==10001){
                location.href="/index.do";
            }else {
                alert(data.msg);
            }
        },"json")
    }
</script>
</html>



















