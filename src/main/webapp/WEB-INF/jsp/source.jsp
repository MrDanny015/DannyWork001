<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="shortcut icon" href="" type="image/x-icon">
    <link rel="stylesheet" charset="UTF-8" href="/static/login/css/reset.css">
    <link rel="stylesheet" charset="utf-8" href="/static/login/css/web_pop.css">
    <link rel="stylesheet" charset="UTF-8" href="/static/login/css/login.css">
    <script type="text/javascript" charset="utf-8" src="/static/login/js/jquery.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="/static/login/js/jquery.form.js"></script>
    <script type="text/javascript" charset="utf-8" src="/static/login/js/layer.js"></script>
    <script type="text/javascript" charset="utf-8" src="/static/login/js/web_method/method.js~v=2"></script>
    <script type="text/javascript" charset="UTF-8" src="/static/login/js/login_register/user_register.js~v=10"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui-lang-zh_CN.js"></script>

</head>
<body>
    <div class="register_header">
        <div class="header_center clearfix">
            <div class="myfl">
                <a href="index.do"><img src="/static/login/img/logo_login_home.png" /></a>
                                <span>用户注册</span>
                            </div>
            <div class="myfr">
                <a href="index.do">返回首页</a>
                <span></span>
                <a href="javascript:;">收藏网站</a>
                <span></span>
                                <a href="javacript:;">注册商家账号</a>
                                <span></span>
                <a href="/login.do">已有账户，直接<em>登录</em></a>
            </div>
        </div>
    </div>
    <div class="register_content clearfix" style="background:url('/static/login/img/user_register_bag.png') no-repeat 0 138px;">

        <input type="hidden" value="" id="iserror">
            <form id="source_from" >
                <div class="register_box myfr">
                <div class="title clearfix">
                    <span class="myfl"></span>
                    <h1 class="myfl">拉趣新用户注册</h1>
                    <input type="hidden" value="1" name="memberType" id="registeruser_type">
                    <span class="myfr"></span>
                </div>
                <input type="text" placeholder="请输入您的用户名，支持手机号" name="username" class="username" value=""  onclick="userstart()" onblur="userif()" />
                <p class="username_error"></p>
                    <div id="namefales" style="font-size: 14px;color: red;width: 300px;margin: 0 auto;display: none;" ><span>用户名已存在或者为空</span></div>
                    <div id="nametrue" style="font-size: 14px;color: green;width: 300px;margin: 0 auto;display: none;" ><span>用户名可以使用</span></div>
                <input id="passid" type="password" style="color: #666;" placeholder="请输入您的密码" name="userpwd" class="password" maxlength="16" value=""/>
                <p class="password_error"></p>
                <input id="passids" type="password" style="color: #666;" placeholder="请重复您的密码" name="userpwd1" onblur="validate()" class="password_again" maxlength="16" />
                <p class="password_again_error"></p>
                    <div id="pwdfales" style="font-size: 14px;color: red;width: 300px;margin: 0 auto;display: none;"><span>两次密码不相同</span></div>
                    <div id="pwdtrue" style="font-size: 14px;color: green;width: 300px;margin: 0 auto;display: none;"><span>两次密码相同</span></div>
                <input type="text" placeholder="请输入您的姓名" name="uname" maxlength="3" class="username" value="" /><br>
                <label for="city">出生日期:</label>
                <input type= "text" name="brithday" class= "easyui-datebox" required ="required">
                    <p class="phone_num_error"></p>

                <div class="clearfix message_code_box">
                    <div style="  margin-top: 14px;  margin-bottom: 0px;">
                        <label for="city">家庭住址:</label>
                        <input id="province" class="easyui-combobox" >
                        <input id="city" class="easyui-combobox" >
                        <input id="area" class="easyui-combobox" >
                    </div>
                    <div>
                        <label for="address">地址:</label>
                        <input class="easyui-textbox" id="address" type="text" name="address" data-options="required:true"/>
                    </div>
                </div>
                <p class="message_code_error"></p>

                    <label for="rid">职位:</label>
                    <select id="kind" class=" easyui-combobox" name="rid" style="width:200px;">
                        <option value="请选择职位"></option>
                    </select>
                <p class="qq_num_error">6</p>
                <div class="photo_code clearfix">
                    <input type="text" class="myfl" name="code" placeholder="请输入图片验证码" maxlength="4"/>
                    <img src="/codeload" onclick="yanz()"id="coco"class="myfr"/>
                </div>
                    <p class="photo_code_error"></p>
                <div class="my_agreement">
                    <input type="checkbox" name="agreement" value="1" checked>我已仔细阅读并同意接受
                                        <a href="" target="_blank">《用户使用协议》</a>
              </div>
                <p class="source_error">8</p>
                <a href="javascript:zhuce();" class="submit_btn">注册</a>
                <!--短信的token-->
                <input type="hidden" name="token" value="47016a045c820bc2857e84547b11a380" id="tonkenNum">
            </div>
                </form>
    </div>
    <!--错误提示-->
    <div class="normal_pop pop_password" id="pop_load">
        <h3>提示</h3>
        <p class="error" style="font-size: 20px;line-height: 24px;margin: 40px 0 36px;color: #666;">注册失败，请稍后再试</p>
        <i id="true_btn" class="layui-layer-close">确定</i>
    </div>
    <div class="register_bottom">@Danny.com &nbsp;&nbsp;丹尼先生开源制作 &nbsp;&nbsp;浙ICP17088888号-1 &nbsp;&nbsp;版权所有</div>
</body>

<script type="text/javascript">
    function yanz() {
        $("#coco").attr("src","codeload?time="+new Date().getTime());
    }


    $(document).ready(function(){
        userstart()
        initDate(0);
        $('#kind').combobox({
        url:"selectrole",
        valueField:"rid",
        textField:"rname"
        })
    });

    var content = "";

    function initDate() {
        $('#province').combobox({
            url: 'selectAreas',
            valueField: 'areaid',
            textField: 'areaname',
            onChange: function (newValue, oldValue) {
                content = $('#province').combobox('getText');
                $('#address').textbox('setValue', content);
                //初始化,第二个,第三个下拉框
                $('#city').combobox('clear');
                $('#area').combobox('clear');

                //初始化
                initCity(newValue);
            }
        });
    }

    function initCity(newValue) {
        $('#city').combobox({
            url: 'selectAreas?parentId=' + newValue,
            valueField: 'areaid',
            textField: 'areaname',
            onChange: function (newValue, oldValue) {
                content += $('#city').combobox('getText');
                $('#address').textbox('setValue', content);
                //初始化,第二个,第三个下拉框
                $('#area').combobox('clear');
                //初始化
                initArea(newValue);
            }
        });
    }

    function initArea(newValue) {
        $('#area').combobox({
            url: 'selectAreas?parentId=' + newValue,
            valueField: 'areaid',
            textField: 'areaname',
            onChange: function (newValue, oldValue) {
                content += $('#area').combobox('getText');
                $('#address').textbox('setValue', content);
            }
        });
    }

    //用户名验证
    function userif() {
        $.post("ifusername",$("#source_from").serialize(),function (data) {
            if (data) {
                var cc = document.getElementById('namefales');
                cc.style.display="none";
                var cc = document.getElementById('nametrue');
                cc.style.display="block";
            } else {
                var bb = document.getElementById('nametrue');
                bb.style.display="none";
                var cc = document.getElementById('namefales');
                cc.style.display="block";
            }
        },'json')
    }

    //初始化输入框
    function userstart() {
        var cc = document.getElementById('nametrue');
        var bb = document.getElementById('namefales');
        cc.style.display="none";
        bb.style.display="none";
    }

    <!-- 对比两次输入的密码 -->
    function validate() {
        var pwd1 = document.getElementById("passid").value;
        var pwd2 = document.getElementById("passids").value;
        <!-- 对比两次输入的密码 -->
        if(pwd1 == pwd2) {
            var cc = document.getElementById('pwdfales');
            cc.style.display="none";
            var cc = document.getElementById('pwdtrue');
            cc.style.display="block";
        }
        else {
            var bb = document.getElementById('pwdtrue');
            bb.style.display="none";
            var cc = document.getElementById('pwdfales');
            cc.style.display="block";
        }
    }
    //注册
    function zhuce() {
        var codevalue=$("#code").val();
        if (codevalue==''){
            alert("请输入验证码");
        }else {
            $.post("registeris", $("#source_from").serialize(), function (data) {
                if (data.flag) {
                    alert("注册成功");
                    location.href = "login.do";
                } else {
                    alert(data.msg);
                    yanz();
                }
            }, "json")
        }
    }

</script>
</html>

















