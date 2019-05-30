<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>用户管理</title>
    <link rel="stylesheet" href="/static/backstage/layui/css/layui.css">
    <script type="text/javascript" src="/static/backstage/layui/layui.js"></script>
    <script type="text/javascript" src="/static/backstage/javascript/dw_form_submit.js"></script>
    <script type="text/javascript" src="/static/backstage/layui/lay/modules/laydate.js"></script>
    <link href="/static/backstage/layui/css/modules/laydate/default/laydate.css" rel="stylesheet" type="text/css" />

</head>
<body class="childrenBody">
<form class="layui-form changePwd">
    <input type="hidden" name="uid"  id="uid"  >
    <div class="layui-form-item">
        <label class="layui-form-label">用户姓名</label>
        <div class="layui-input-block">
            <input type="text" name="uname" value="" placeholder="用户姓名" id="uname"  lay-verify="required|uname" class="layui-input pwd">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否激活</label>
        <div class="layui-input-block">
            <input type="radio"  id="stautsno" name="stauts" value="0" title="否" checked="checked">
            <input type="radio"  id="stautsyes"  name="stauts" value="1" title="是" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">生日</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" id="brithday" name="brithday">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择职位</label>
        <div class="layui-input-inline">
            <select id="bg_id" name="rid" lay-verify="required"  lay-filter="business" class="select">
                <option></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">住址</label>
        <fieldset class="layui-elem-field" style="margin: 20px;">
            <legend>省市联动</legend>
            <div class="layui-field-box">
                <form class="layui-form layui-form-pane" action="javascript:;" >
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择地区</label>
                        <div class="layui-input-inline">
                            <select name="P1" lay-filter="province">
                                <option></option>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <select name="C1" lay-filter="city">
                                <option></option>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <select name="A1" lay-filter="area">
                                <option></option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <fieldset class="layui-elem-field" style="margin: 20px;">
            <legend>选择结果</legend>
            <div class="layui-field-box">
                <form class="layui-form" action="javascript:;">
                    <div class="layui-form-item">
                        <label class="layui-form-label pca-label-province" name="sheng"></label>
                        <label class="layui-form-label pca-label-city" name="shi"></label>
                        <label class="layui-form-label pca-label-area" name="xian"></label>
                    </div>
                </form>
            </div>
        </fieldset>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-block">
            <input type="text" name="username" value="" placeholder="用户姓名" id="username"  lay-verify="required|username" class="layui-input pwd">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="userpwd" value="" placeholder="用户密码" id="userpwd"  lay-verify="required|userpwd" class="layui-input pwd">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="*">保存</button>
            <button type="button" class="layui-btn layui-btn-primary" onclick="parent.close();">关闭</button>
        </div>
    </div>
</form>

</body>
<script type="text/javascript" charset="utf-8" src="/static/login/js/jquery.min.js"></script>
<script src="/static/backstage/layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/backstage/city-picker-master/src/citys.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    pca.init('select[name=P1]', 'select[name=C1]', 'select[name=A1]', '北京', '北京', '朝阳区');
</script>
<script type="text/javascript">

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#brithday' //指定元素
        });
    });

    $(function(){
        lond_urlvalue()
        selectrole()
        var uid = $("#uid").val();
        if(uid != ""){
            $.ajax({
                url: "selectUserById",
                data:{"uid":uid},
                dataType:"json",
                success: function(data){
                    $("#uname").val(data.uname);
                    $("input:radio[name='stauts']").eq(data.stauts).attr("checked",true);
                    $("#brithday").val(data.brithday);
                    $("#username").val(data.username);


                },error:function(){
                }
            });
        }
    })

    layui.use(['form','layer' ], function() {

        var form = layui.form;
        var layer = layui.layer;
        // 添加验证规则
        form.verify({
            name : function(value, item) {
                value = value.trim();
                if (value.length < 0) {
                    return "请输入教师名称";
                }
            }
        });



        form.on('submit(*)', function(data) {
            var index = layer.msg('提交中，请稍候',{icon: 16,time:false,shade:0.8});
            var d = data.uid;
            var url = "addandupdUser";
            if(d != ""){
                url = "addandupdUser";
            }
            $.ajax({
                url: url,
                data:d,
                dataType:"text",
                success: function(data){
                    layer.close(index);
                    if(data){
                        layer.msg("保存成功！");
                        parent.queryTea();
                        parent.close();
                    }else{
                        layer.msg("保存失败！");
                    }
                },error:function(){
                    layer.close(index);
                    layer.msg("保存失败！");
                }
            });
            return false;
        });
    });


    function lond_urlvalue(){
        var url=window.document.URL;
        var uid = url.split("=")[1]; //id
        $("#uid").val(uid);
    }

    function selectrole() {
        layui.use('form', function(){
            var form = layui.form;
            form.on('select(business)',function(data){
                $.ajax({
                    type:"POST",
                    url:'/selectrole',  //从数据库查询返回的是个list
                    dataType: "json",
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    async: false,
                    cache: false,
                    success: function (data) {
                        $.each(data,function(index,item){
                            $('#bg_id').append(new Option(item.rname,item.rid));//往下拉菜单里添加元素
                        })

                        form.render();//菜单渲染 把内容加载进去
                    }

                })
            });
        });
    }
</script>

</html>