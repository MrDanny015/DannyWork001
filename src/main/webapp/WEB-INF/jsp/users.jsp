<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>用户管理</title>
    <link rel="stylesheet" href="/static/backstage/layui/css/layui.css">
    <script type="text/javascript" src="/static/backstage/javascript/jquery.min.js"></script>
    <script type="text/javascript" src="/static/backstage/layui/layui.js"></script>
    <script type="text/javascript" src="/static/backstage/javascript/dw_form_submit.js"></script>
    <script type="text/javascript" src="/static/jquery.min.js"></script>

</head>
<body>

    <blockquote class="layui-elem-quote role_search">
        <div style="margin-top: 17px;margin-left: 1103px;">
            <span>用户名搜索：</span><input type="text" style="height: 27px;width: 220px;" id="sear1" placeholder="请输入姓名进行模糊查询"/>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-normal newsAdd_btn" onclick="addTea('')">添加用户</a>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-danger batchDel" onclick="getDatas();">批量删除</a>
        </div>
    </blockquote>
    <div class="layui-card-body">
        <table class="layui-hide" id="test" lay-filter="tools"  ></table>
    </div>
    <script type="text/html" id="tools"  >
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"  >删除</a>
    </script>

</body>

<script  type="text/javascript">

    //表格加载时触发
    layui.use('table', function () {
        var kw = '';
        addData(kw);

    });
    //渲染表格数据
    function addData(kwx) {
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: 'showData?keyWord=' + kwx
            , limit: 11 //默认为10
            , cols: [[
                {fixed : 'left', checkbox:true},
                {field: 'uid', width: 170, title: '编号', sort: true} //sort：true页面可进行排序操作
                , {field: 'uname', width: 170, title: '姓名'}
                , {field: 'address', width: 120, title: '家庭住址', sort: true}
                , {field: 'brithday', width: 130, title: '生日'}
                , {field: 'username', width: 160, title: '用户名'}
                , {field: 'stauts', width: 130, title: '状态', sort: true}
                , {field: 'rname', width: 130, title: '职位', sort: true}
                ,{title : '操作', width : 300, align : 'center', toolbar : '#tools'
                } ] ]
            , page: true
            , done: function (res, curr, count) {
                //数据的回调用，可不写
            }

        });
        // 监听工具条
        table.on('tool(tools)', function(obj) { // 注：tool是工具条事件名，test是table原始容器的属性
            var data = obj.data // 获得当前行数据
                , layEvent = obj.event; // 获得 lay-event 对应的值
            if ('edit' == layEvent) {
                addTea(data.uid);
            } else if ('del' == layEvent) {
                del(data.uid);
            }
        });

    }

    $("#sear1").keyup(function (event) {
        if (event.keyCode == 13) {
            var keyWord = $("#sear1").val();
            addData(keyWord);
        }
    });

    function close() {
        layer.close(index);
    }

    //删除方法
    function del(uid) {
        layer.open({
            type : 1,
            content : '<div style="padding: 20px 80px;">确定删除记录?</div>',
            btn : [ '确定', '取消' ],
            yes : function(index, layero) {
                $.ajax({
                    url : "deleteUsers",
                    data : {
                        "ids" : uid
                    },
                    dataType : "text",
                    success : function(data) {
                        if(data){
                            layer.msg("删除成功！");
                            layer.close(index);
                            document.location.reload();
                        }else{
                            layer.msg("删除失败！");
                        }
                    },
                    error : function() {
                    }
                });
            }
        });

    }
    /**
     * 获取选中数据
     */
    function getDatas(){
        var checkStatus = layui.table.checkStatus('test');
        //var rows = $('#test').datagrid('getSelections');
        var data = checkStatus.data;
        var ids = "";
        for(var i=0;i<data.length;i++){
            ids += data[i].uid;
            if(i<data.length-1){
                ids += ",";
            }
        }
        if(data.length != 0){
            del(ids);
        }
    }
    var index;
    function addTea(uid) {
        index = layer.open({
            type : 2,
            title : "用户信息",
            content : '/create.do?uid=' + uid
        });
        layer.full(index);
    }

</script>

</html>