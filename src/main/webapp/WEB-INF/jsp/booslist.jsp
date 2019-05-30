<%--
  Created by IntelliJ IDEA.
  User: 王炳达
  Date: 2019/4/11
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui-lang-zh_CN.js"></script>




<head>
    <title>XX管理系统</title>
</head>
<body>

<div id="layout" class="easyui-layout" style="width:1900px;height:850px;">
    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;"><h1 style="font-family: 华文行楷; text-align: center ">万 达 国 际 房 地 产 管 理 中 心</h1></div>
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:200px;" ></div>
    <div data-options="region:'west',title:'West',split:true" style="width:160px;">
        <ul id="tree" class="easyui-tree">
            <li>
                <span>管理中心</span>
                <ul>
                    <li>
                        <span>基本操作</span>
                        <ul>
                            <li>
                                <span><a href="#">员工管理</a></span>
                            </li>
                            <li>
                                <span>私人别墅</span>
                            </li>
                            <li>
                                <span><a href="javascript:showloupan()">商业楼盘</a></span>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <span>万达控股</span>
                    </li>
                    <li>
                        <span>个人信息</span>
                    </li>
                </ul>
            </li>
            <li>
                <span>设置</span>
            </li>
        </ul>
    </div>
    <div data-options="region:'center',title:'页面'" style="padding:5px;background:#eee;">
        <div id="listtable">
            <table id="dg" style="width: 1500px;"> </table>
        </div>
        <!--添加窗体-->
        <div id="addwin" class="easyui-window" title="添加窗体" style="width:600px;height:400px" data-options="iconCls:'icon-save',modal:true" closed="true">

            <form id="addmethod" method="post " style="margin-top: 50px; text-align: center;">
                <div style="margin-bottom: 10px; ">
                    <label for="bname">姓名:</label>
                    <input class="easyui-text" type="text" name="bname" />
                </div>
                <div style="margin-bottom: 10px; ">
                    <label for="age">年龄:</label>
                    <input type= "text" class= "easyui-text" name="age"  />
                </div>
                <div style="margin-bottom: 10px; ">
                    <label for="phone">手机:</label>
                    <input class="easyui-text" type="text" name="phone" />
                </div>
                <div style="margin-bottom: 10px; ">
                    <label for="gid">公司:</label>
                    <select class="kind easyui-combobox" name="gid" style="width:200px;">
                        <option value="请选择公司"></option>
                    </select>
                </div>
                <div>
                    <label for="city">用户地址:</label>
                    <input id="province" class="easyui-combobox">
                    <input id="city" class="easyui-combobox">
                    <input id="area" class="easyui-combobox">
                </div>
                <div>
                    <label for="aaddress">地址:</label>
                    <input class="easyui-textbox" id="address" type="text" name="address" data-options="required:true"/>
                </div>
                <div style="margin-bottom: 10px; ">
                    <a  href="javascript:add()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">添加</a>
                </div>
            </form>
        </div>
        <!--修改窗体-->
        <div id="updwin" class="easyui-window" title="修改窗体" style="width:600px;height:400px" data-options="iconCls:'icon-save',modal:true" closed="true">

            <form id="updfrm" method="post" style="margin-top: 50px; text-align: center;">
                <input name="bid" readonly hidden class="easyui-textbox">
                <div style="margin-bottom: 10px; ">
                    <label for="bname">姓名:</label>
                    <input class="easyui-text" type="text" name="bname" />
                </div>
                <div style="margin-bottom: 10px; ">
                    <label for="age">年龄:</label>
                    <input type= "text" class= "easyui-text"  name="age"  />
                </div>
                <div style="margin-bottom: 10px; ">
                    <label for="phone">手机:</label>
                    <input class="easyui-text" type="text" name="phone" />
                </div>
                <div style="margin-bottom: 10px; ">
                    <label for="gid">公司:</label>
                    <select class="kind easyui-combobox" name="gid" style="width:200px;">
                        <option value="请选择公司"></option>
                    </select>
                </div>
                <div>
                    <label for="city">用户地址:</label>
                    <input id="province" class="easyui-combobox">
                    <input id="city" class="easyui-combobox">
                    <input id="area" class="easyui-combobox">
                </div>
                <div>
                    <label for="aaddress">地址:</label>
                    <input class="easyui-textbox" id="address" type="text" name="address" data-options="required:true"/>
                </div>
                <div style="margin-bottom: 10px; ">
                    <a  href="javascript:upd()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">修改</a>
                </div>
            </form>
        </div>
        <!--查看窗体-->
        <div id="look" class="easyui-window" title="查看操作" style="width:600px;height:400px"
             data-options="iconCls:'icon-save',modal:true,closed:true">
            <table>
                <tr>
                    <td>姓名:</td>
                    <td id="look_id"></td>
                </tr>
                <tr>
                    <td>公司:</td>
                    <td id="look_name"></td>
                </tr>
                <tr>
                    <td>时间:</td>
                    <td id="look_date"></td>
                </tr>
                <tr>
                    <td>价格:</td>
                    <td id="look_price"></td>
                </tr>
                <tr>
                    <td>房源:</td>
                    <td id="look_dname"></td>
                </tr>
            </table>
        </div>
    </div>
</div>

<div id="serdiv">
    <a href="javascript:deletes()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">批量删除</a>
    <a href="javascript:openadd()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加老板</a>
    老板：<input class="easyui-textbox" id="fname" >
    <a href="javascript:selectall()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">搜索</a>
</div>



<script type="text/javascript">
    function showloupan() {
        $("#listtable").slideToggle(1000);
    }
    $(document).ready(function(){


        initData();
        $('.kind').combobox({
            url:"selectgs",
            valueField:"gid",
            textField:"gname"
        })

    });

    function initData(){
        $('#dg').datagrid({
            url:'selectObjects',
            toolbar:'#serdiv',
            pagination:true,

            PageSize:true,
            PageList:[3,5,8,10],
            onLoadSuccess:function(){
                $.parser.parse();
            },
            columns:[[
                {field:'kk',checkbox:true},
                {field:'bid',title:'序号',width:100},
                {field:'bname',title:'姓名',width:100},
                {field:'age',title:'年龄',width:100},
                {field:'phone',title:'电话',width:100},
                {field:'gname',title:'公司',width:100},
                {field:'address',title:'住址',width:100},
                {field:'ck',title:'操作',width:220,formatter: function(value,row,index){

                        return '<a href="javascript:openUpdataStudent('+index+')" class="easyui-linkbutton" data-options="iconCls:\'icon-edit\'">修改</a> '
                            + '<a href="javascript:deleteStudent('+row.bid+')" class="easyui-linkbutton" data-options="iconCls:\'icon-remove\'" >删除</a> '
                            +'<a href="javascript:lookStudent('+index+')" class="easyui-linkbutton" data-options="iconCls:\'icon-cut\'">查看</a> '
                    }}
            ]]
        });
    }
    function selectall() {
        $("#dg").datagrid('load',{
            bname:$('#fname').val()
        });
    }
    function openadd() {
        $('#addwin').window("open");
        $('#addwin').form('clear');
        initDate(0);
    }
    function add() {
        $('#addmethod').form('submit', {
            url:"addandupd",
            success:function(data){
                data=$.parseJSON(data);
                if (data.flag){
                    alert("添加成功");
                    $('#addwin').window("close");
                    $("#dg").datagrid('reload');
                }else alert("添加失败")
            }
        });
    }
    function upd() {
        $('#updfrm').form('submit', {
            url:"addandupd",
            success:function(data){
                data=$.parseJSON(data);
                if (data.flag){
                    alert("修改成功");
                    $('#updwin').window("close");
                    $("#dg").datagrid('reload');
                }else alert("修改失败")
            }
        });
    }
    function openUpdataStudent(index) {
        $('#updwin').window("open");
        var row = $('#dg').datagrid('getRows')[index];
        $('#updfrm').form('load',row);
        initDate(0);
    }
    function lookStudent(index) {
        //打开查看的窗体
        $('#look').window('open');
        var row = $('#dg').datagrid('getRows')[index];
        $('#look_id').text(row.id);
        $('#look_name').text(row.name);
        $('#look_date').text(row.date);
        $('#look_price').text(row.price);
        $('#look_dname').text(row.dname);
    }
    function deleteStudent(bid) {
        $.messager.confirm('确认对话框', '您想要删除该条数据吗？', function(r){
            if (r){
                $.post("del",{ids:bid},function (data) {
                    if(data.flag){
                        alert("删除成功");
                        $("#dg").datagrid('reload');
                    }else {
                        alert("删除失败")
                    }
                },'json');
            }
        });
    }
    function deletes() {
        //获取要集合删除的数据
        var rows = $('#dg').datagrid('getSelections');
        if(rows.length<=0){
            alert("请至少选择一条数据删除");
        }else {
            var ids="";
            for (var i=0;i<rows.length;i++){
                var row = rows[i];
                ids+=row.bid;
                if(i!=rows.length-1){
                    ids+=",";
                }
            }
            deleteStudent(ids);
        }
    }


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
    </script>

    </body>
</html>
