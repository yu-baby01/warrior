<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2023/7/8
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <script type="text/javascript" src="/ssm/res/jq/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/ssm/res/layer/layer.js"></script>
</head>
<body>
<form id="fm">
    <button type="button" onclick="addHtml()">+</button>
    水果名:
    <select name="fruitList[0].fruitName">
        <option value="">===请选择===</option>
        <option value="苹果">苹果</option>
        <option value="橘子">橘子</option>
        <option value="桃子">桃子</option>
    </select><br/>
    水果数量:<input type="text" name="fruitList[0].fruitNum"/><br/>
    <div id="addFruit"></div>
    <button type="button" onclick="adds()">批量增加</button>
</form>
</body>
<script>
    var i=0
    function addHtml(){
        i++;
         var html="";
        html+="<div><button type='button' onclick='remove(this)'>-</button>"
        html+="水果名:"
        html+="<select name='fruitList["+i+"].fruitName'>"
        html+="<option value=''>===请选择===</option>"
        html+="<option value='苹果'>苹果</option>"
        html+="<option value='橘子'>橘子</option>"
        html+="<option value='桃子'>桃子</option>"
        html+="</select><br/>"
        html+="水果数量:<input type='text' name='fruitList["+i+"].fruitNum'/><br/></div>"
        $("#addFruit").append(html)
    }
    function remove(obj){
        $(obj).parent().remove();
    }
    function adds() {
        var index1 = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.post(
            "/ssm/u/adds",
            $("#fm").serialize(),
            function (result) {
                if (result.code != 200) {
                    layer.close(index1);
                    layer.msg(result.msg)
                    return
                }
                layer.msg(result.msg)
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭
                parent.search();
            }
        )
    }
</script>
</html>
