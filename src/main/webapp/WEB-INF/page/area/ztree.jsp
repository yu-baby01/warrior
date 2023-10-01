<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="/ssm/res/jq/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/ssm/res/layer/layer.js"></script>
    <link rel="stylesheet" href="/ssm/res/ztree/css/demo.css" type="text/css"/>
    <link rel="stylesheet" href="/ssm/res/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
    <script type="text/javascript" src="/ssm/res/ztree/js/jquery.ztree.all.min.js"></script>
</head>
<body>
<form id="fm">
    <input type="hidden" name="parentId" value="${parentId}" id="parentId"/>
</form>
<button type="button" onclick="onclickOne()">ID</button>
<button type="button" onclick="onclickMany()">所有子集ID</button>
<button type="button" onclick="add()">增加数据</button>
<button type="button" onclick="show()">展示选中的ID</button>
<select onchange="pro(this.value, true)" id="pro">
</select>
<select onchange="pro(this.value, false)" id="city">
</select>
<select id="country">
</select>
<div id="areaDiv"></div>

<div class="zTreeDemoBackground left">
    <ul id="treeDemo" class="ztree"></ul>
</div>
</body>
<script type="text/javascript">
    $(function () {
        search();
        pro(0, null);
        // change(0);
    })

    function pro(id ,ids) {
        $.post(
            "/ssm/areas/show/" + id,
            function (result) {
                var html = "";
                for (let i = 0; i < result.data.length; i++) {
                    var u = result.data[i]
                    html += "<option value='" + u.id + "'>" + u.areaName + "</option>"
                }
                if (id == 0) {
                    pro(result.data[0].id, true);
                    $("#pro").html(html);
                }
                if (ids) {
                    pro(result.data[0].id, false);
                    $("#city").html(html)
                }
                if (!ids) {
                    $("#country").html(html)
                }
            }
        )
    }
    // var j = 0;
    // function change(id){
    //     j++;
    //     $.post(
    //         "/ssm/areas/show/" + id,
    //         function (result){
    //             if (result.data.length > 0){
    //                 var html = "<br><select onchange='change(this.value)' id='sel+"+j+"'>";
    //                 for (var i = 0; i < result.data.length; i++) {
    //                     var a = result.data[i];
    //                     html += "<option value='"+a.id+"'>"+a.areaName+"</option>";
    //                 }
    //                 html +=" </select>";
    //                 $("#areaDiv").append(html);
    //                 change($("#sel"+j).val());
    //             }
    //         }
    //     )
    // }
    var setting = {
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "areaParentId",
                rootPId: 0
            },
            key: {
                name: "areaName"
            }
        },
        check: {
            enable: true,     //这里设置是否显示复选框
        },
    };

    function search() {
        $.post(
            "/ssm/areas/ztree",
            function (result) {
                $(document).ready(function () {
                        $.fn.zTree.init($("#treeDemo"), setting, result.data);
                    }
                );
            })
    }

    //增加数据
    function add() {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var obj = treeObj.getSelectedNodes()[0];
        if (obj !== undefined && obj !== null) {
            // 访问对象的属性
            var id = obj.id;
        } else {
            var id = 0;
        }
        var index = layer.open({
            type: 2,
            title: '新增页面',
            shadeClose: true,
            shade: 0.8,
            area: ['380px', '90%'],
            content: "<%=request.getContextPath() %>/area/toAdd/" + id
        })
    }

    //展示选中ID
    function show() {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var t = "";
        for (let i = 0; i < nodes.length; i++) {
            t += nodes[i].id + ","
        }
        console.log(t)
    }

    function onclickOne() {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getSelectedNodes()[0];
        alert(nodes.areaName);
    }

    function onclickMany() {

        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getSelectedNodes()[0];
        var city = getCityByRecursion(nodes);
        console.log(city);
    }

    function getCityByRecursion(node) {
        var str = "";
        var ch = node.children;
        for (let i = 0; i < ch.length; i++) {
            str += ch[i].areaName;
            if (ch[i].isParent) {
                str += getCityByRecursion(ch[i]);
            }
        }
        return str;
    }

</script>
</html>