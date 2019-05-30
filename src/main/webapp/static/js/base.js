/**
 *
 * @param loadurl  加载列表的路径
 * @param textboxIds 查询文本框id拼接的字符串 格式：qnaem,tname ；
 *                   也是后台接收的变量名  注意前后台保持一致 前面不加# 否则无法接收
 */
function toquery(loadurl,textboxIds){
    var qnameId = textboxIds.split(',')
    var url=loadurl+'?'
    for (var i=0;i<qnameId.length;i++)
    {
        if(qnameId[i]!=null && qnameId[i]!=''){
            var name = $('#'+qnameId[i]).textbox('getValue')
            url=url+qnameId[i]+'='+name+'&'
        }
    }
    url = url.substring(0, url.lastIndexOf('&'))
    $('#dg').datagrid({
        url:url
    })
}

/**
 *
 * @param divId
 * @param imgId
 */
function updtimg(divId,imgId){
    $(divId+'').html('')
    $(divId+'').append('<img width="30" height="30" src="/downfile?id=' +imgId + '">')
}

/**
 * 单选框回显
 * @param value 回显的值
 * @param name 属性名 
 */
function getradio(name,value){
    $('input[name="'+name+'"][value="'+value+'"]').attr('checked',true)
}

/**
 *
 * @param datagridId datagrid id
 * @param index      当前行号
 * @param imgId      图片Id属性名
 * @returns {string|*}
 */
function  getimg(datagridId,index,imgId) {
    var rows = $(datagridId+'').datagrid('getRows')
    obj = rows[index]
    btn = '<img width="30" height="30" src="/downfile?id=' + obj[imgId] + '">'
    return btn
}

/**
 *  jqurey 获取选中的复选框的值
 * @param filename   name 属性值
 * @returns {string}
 */
function getchecked(filename) {
    var obj = document.getElementsByName(filename+'')
    var s=''
    for(var i=0;i<obj.length;i++){
        if(obj[i].checked){
            s+=obj[i].value+','
        }
    }
    s=s.substring(0,s.lastIndexOf(','))
    return s
}

/**
 *
 * @param url_json 数据加载路径
 * @param firstId 一级分类
 * @param scendId 二级分类
 * @param thirdId 三级分类
 * @param addressId 地址递交文本框ID
 */
function getlinkage(url_json,firstId,scendId,thirdId,addressId){
    console.log(addressId);
    //定义全局变量
    var provinceName="";
    var cityName="";
    var countryName="";
    //加载省份
    $.ajax({
        url:''+url_json,  //请求的地址
        data:{pid:0}, //要传输的数据  加载省份时候   pid=0
        type:"post", //提交的方式
        success:function (obj){  //回调函数
            for(var i in obj){
                $(firstId+'').append("<option value='"+obj[i].id+"'>"+obj[i].name+"</option>")
            }
        },
        dataType:"json" // 预期服务器所返回的数据类型
    });

    //去加载市级信息
    $(firstId+'').change(function(){
        var provinceId=$(firstId+" option:selected").val();
        provinceName=$(firstId+" option:selected").text();
        alert(provinceName);
        //清空城市的信息
        /*    $("#city").empty();
         $("#city").text(""); */
        $(scendId+" option:not(:first)").remove();
        if(provinceId!=-1){
            $.ajax({
                url:''+url_json,  //请求的地址
                data:{pid:provinceId}, //要传输的数据  加载省份时候   pid=0
                type:"post", //提交的方式
                success:function (obj){  //回调函数
                    for(var i in obj){
                        $(scendId+'').append("<option value='"+obj[i].id+"'>"+obj[i].name+"</option>")
                    }
                },
                dataType:"json" // 预期服务器所返回的数据类型
            });
            //给地址赋值

            $(addressId+'').val(provinceName)
            alert( "ddddd"+$(addressId+'').value);
        }else{
            $(addressId+'').val("");
        }
    })

    //加载区域信息
    $(scendId+'').change(function(){
        var cityId=$(scendId+" option:selected").val();
        cityName=$(scendId+" option:selected").text();
        //清空城市的信息
        /*    $("#city").empty();
         $("#city").text(""); */
        $(thirdId+" option:not(:first)").remove();
        if(cityId!=-1){
            $.ajax({
                url:''+url_json,  //请求的地址
                data:{pid:cityId}, //要传输的数据  加载省份时候   pid=0
                type:"post", //提交的方式
                success:function (obj){  //回调函数
                    for(var i in obj){
                        $(thirdId+'').append("<option value='"+obj[i].id+"'>"+obj[i].name+"</option>")
                    }
                },
                dataType:"json" // 预期服务器所返回的数据类型
            });
            $(addressId+'').val(provinceName+'-'+cityName)
        }else{
            $(addressId+'').val(provinceName)
        }
    })



    $(thirdId+'').change(function (){
        var countryId=$(thirdId+" option:selected").val();
        countryName=$(thirdId+" option:selected").text();
        if(countryId!=-1){
            $(addressId+'').val(provinceName+'-'+cityName+'-'+countryName);
        }else{
            $(addressId+'').val(provinceName+'-'+cityName);
        }
    })
}



/**
 *
 * @param url 请求路径
 * @param datagridId  datagrid id 注意前面加上#
 * @param columName  删除根据 一般为主表
 *
 * 注意：后台集接收时数据一定要用ids变量名进行接收
 */
function deleteAll(url, datagridId, columName) {

    ids = getCheckedRows(datagridId, columName)
    if (confirm("确定要删除吗?")) {
        $.ajax({
            url: url + '?ids=' + ids,
            success: function (result) {
                if (result == true) {
                    alert("删除成功!")
                    $(datagridId + '').datagrid('reload')
                }
            }
        })
    } else {
        alert("已经取消!")
    }

}

/**
 * DESC:加载复选框（ids=''）以及复选框回显(ids='1,2')
 *
 * param:divId 复选框div容器的id 前面要+#
 *       ids   会显时候选中的值 格式 '1,2,3,4'
 *       value 复选框得值     填属性名
 *       text  复选框显示文本 填属性名
 *       url_json     获取数据链接
 * */
function showcheckbox(divId, ids, value, text, url_json,checkBoxName) {
    $(divId + '').empty()
    $.ajax({
        url: url_json,
        success: function (result) {
            for (var i = 0; i < result.length; i++) {
                id = result[i][value]
                fname = result[i][text]
                if (ids == '' || ids == null) {
                    $('' + divId + '').append('<input name="'+checkBoxName+'" type="checkbox" value="' + id + '">' + fname)
                } else {
                    if (ids.indexOf(id) >= 0)
                        $('' + divId + '').append('<input name="'+checkBoxName+'" type="checkbox" value="' + id + '" checked>' + fname)
                    else
                        $('' + divId + '').append('<input name="'+checkBoxName+'" type="checkbox" value="' + id + '">' + fname)
                }
            }
        }
    })
}


/**
 * esayUI中获取所有列中选中Checkbox的某一列的所有值拼成字符串，以逗号分隔
 * @param objname CheckBox控件的name属性
 * @returns {String}
 */
function getCheckedRows(datagridId, columName) {
    var rows = $(datagridId + '').datagrid('getChecked')
    ids = ''
    for (var i = 0; i < rows.length; i++) {
        ids = ids + rows[i][columName] + ','
    }
    ids = ids.substring(0, ids.lastIndexOf(','))

    return ids;
}


/**
 *
 * @param url 加载数据地址
 * @param datagridId     datagrid id  #dg
 * @param winId          窗口id
 * @param formId         表单id
 */
function dosave(url,datagridId,winId,formId) {
    $.ajax({
        url: url+'',
        data: $(formId+'').serialize(),
        success: function (result) {
            if (result == true) {
                alert('成功!')
                $(winId+'').window('close')
                $(datagridId+'').datagrid('reload')
            } else {
                alert('失败!')
            }
        }
    })
}

/**
 * 获取所有选中Checkbox的值，以逗号分隔
 * @param objname CheckBox控件的name属性
 * @returns {String}
 */
function getCheckedId(objname) {
    var rtnVal = '';
    var allCheck = document.getElementsByTagName("input");
    for (var i = 0; i < allCheck.length; i++) {
        if (allCheck[i].type == "checkbox") {
            if (allCheck[i].name == objname && allCheck[i].checked)
                rtnVal = rtnVal + allCheck[i].value + ',';
        }
    }
    return rtnVal;
}

/**
 * 根据Checkbox的名称chkname，全选或反选
 * @param chkname
 */
function selectCheckedOrNotByName(chkname) {
    $('input[name="' + chkname + '"').each(function () {
            this.checked = !this.checked;
        }
    );
}
/**
 * 根据传入CheckBox的值选中Check控件
 * @param chkname CheckBox的名称
 * @param val 传入的值，多值使用逗号分隔
 */
function setCheckValByName(chkname, val) {

    $('input[name="' + chkname + '"').each(function () {
        if (val.indexOf(this.value) >= 0)
            this.checked = true;
        else
            this.checked = false;
    });
}
/**
 * 判断数值oNum是否为数字
 * @param oNum
 * @returns {Boolean}
 */
function isNumber(oNum) {
    if (!oNum)
        return false;
    if (oNum == "0")
        return true;
    var strP = /^[0-9]*[1-9][0-9]*$/;
    if (!strP.test(oNum))
        return false;
    try {
        if (parseFloat(oNum) != oNum)
            return false;
    }
    catch (ex) {
        return false;
    }
    return true;
}
/**
 * 判断数值oNum是否为浮点数字
 * @param oNum
 * @returns {Boolean}
 */
function isFloat(oNum) {
    if (!oNum)
        return false;
    if (oNum == "0")
        return true;
    var strP = /^((-?|\+?)\d+)(\.\d+)?$/;
    if (!strP.test(oNum))
        return false;
    try {
        if (parseFloat(oNum) != oNum)
            return false;
    }
    catch (ex) {
        return false;
    }
    return true;
}
/**
 * 判断参数str是否为日期类型yyyy-MM-dd
 * @param str
 * @returns {Boolean}
 */
function isDate(str) {
    var reg = /^(\d{4})-(\d{2})-(\d{2})$/;
    var arr = reg.exec(str);
    if (str == "")
        return false;
    if (!reg.test(str))
        return false;
    return true;
}
/**
 * 根据Select控件的ID，获取选中的value值，使用Jquery类库
 * @param selId
 * @returns
 */
function getSelectedValById(selId) {
    return $("#" + selId + " option:selected").val();
}
/**
 * 根据Select控件的ID，获取选中的text值，使用Jquery类库
 * @param selId
 * @returns
 */
function getSelectedTextById(selId) {
    return $("#" + selId + " option:selected").text();
}
/**
 * 向Select控件添加数据，数据参数data是集合对象，集合中每个对象
 * 包含属性id和name
 * @param selId
 * @param data
 */
function fillSelectDataById(selId, data) {
    for (var i = 0; i < data.length; i++) {
        $("#" + selId).append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
    }
}
/**
 * 根据value选中id为selId的Select控件
 * @param selId
 * @param val
 */
function setSelectedValById(selId, val) {
    $("#" + selId).val(val);
}

/**
 * 处理字符串中HTML标签信息
 * 提取字符串<font color="red"><b>Test</b></font>中的Test
 */
function getRawStr(str) {
    var patt = /<font color='red'><b>.*<\/b><\/font>/;
    if (patt.test(str)) {
        var pos = str.indexOf('</b></font>');
        var len = "<font color='red'><b>".length;
        str = str.replace(/<font color='red'><b>/g, '');
        str = str.replace(/<\/b><\/font>/g, '');
        return str;
    }
    else
        return str;
}

/**
 *  处理分页
 */
function page_init(domid, jsondataurl, wherefield) {

    $(domid).datagrid({
        url: jsondataurl, //actionName
        queryParams: {pageNumber: 1, pageSize: 3},//查询参数
        loadMsg: "正在加载数据...",
        rownumbers: true,//查询结果在表格中显示行号
        fitColumns: true,//列的宽度填满表格，防止下方出现滚动条。
        pageNumber: 1,   //初始页码，得在这设置才效果，pagination设置没效果。
        pagination: true//分页控件
        //如果后端返回的json的格式直接是data={total:xx,rows:{xx}},不需要设置loadFilter了，
        //如果有多层封装，比如data.jsonMap = {total:xx,rows:{xx}}，则需要在loadFilter处理一下。
        /*
         loadFilter: function(data){
         if(data.jsonMap) {
         return data.jsonMap;
         }
         }*/
    });

    var p = $(domid).datagrid('getPager');
    $(p).pagination({
        pageSize: 3,//每页显示的记录条数，默认为10
        pageList: [3, 5, 7, 9],//可以设置每页记录条数的列表
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '共 {total} 条记录',
        onSelectPage: function (pageNumber, pageSize) {//分页触发
            //alert("aaa")
            find(jsondataurl, pageNumber, pageSize, domid, wherefield);
        }
    });
}

/**
 * 分页搜索的函数
 * @param pageNumber
 * @param pageSize
 * @param tbdom
 * @param wherefield
 */
function find(jsondataurl, pageNumber, pageSize, tbdom, wherefield) {
    //  获取属性值  .attr("value")  或者  $(" #test").val()

    $(tbdom).datagrid('getPager').pagination({pageSize: pageSize, pageNumber: pageNumber});//重置
    $(tbdom).datagrid("loading"); //加屏蔽

    $.ajax({
        type: "POST",
        dataType: "json",
        url: jsondataurl,
        data: {
            pageNumber: pageNumber,
            pageSize: pageSize,
            name: $(wherefield).val()
        },
        success: function (data) {
            $(tbdom).datagrid('loadData', data);
            $(tbdom).datagrid("loaded"); //移除屏蔽
        },
        error: function (err) {
            $.messager.alert('操作提示', '获取信息失败...请联系管理员!', 'error');
            $(tbdom).datagrid("loaded"); //移除屏蔽
        }
    });
}
function deldataBatch(delBatchUrl, frmid, tbdomid) {

    $.ajax({
        type: 'POST',
        datatype: "json",
        Content_Type: "application/json;charset=UTF-8",
        url: delBatchUrl,
        // data:$("#frm").serialize(),
        data: $(frmid).serialize(),
        success: function (data) {
            //刷新当前列表的数据
            $(tbdomid).datagrid('reload');
            //alert('ok');
            //  alert(data);
        },
        error: function (e) {
            alert("删除失败");

        }
    })

}

function deldata(delUrl, idField, idValue, tbdom) {

    $.ajax({
        type: 'GET',
        datatype: "json",
        Content_Type: "application/json;charset=UTF-8",
        url: delUrl,
        // data:$("#frm").serialize(),
        data: {id: idValue},
        success: function (data) {
            //刷新当前列表的数据
            $(tbdom).datagrid('reload');
            //alert('ok');
            //  alert(data);
        },
        error: function (e) {
            alert("删除失败");
        }
    })

}

function savedata(saveUrl, frmid, tbdom, windom) {
    $.ajax({
        type: 'POST',
        datatype: "json",
        Content_Type: "application/json;charset=UTF-8",
        url: saveUrl,
        // data:$("#frm").serialize(),
        data: $(frmid).serialize(),
        success: function (data) {
            //刷新当前列表的数据
            $(tbdom).datagrid('reload');
            $(windom).window("close");

            //alert('ok');
            //  alert(data);
        },
        error: function (e) {
            alert("保存失败");

        }
    })
}


