<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2023/7/6
  Time: 16:39
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
<form id="fm" enctype="multipart/form-data">
    用户名:<input type="text" name="user.username"/><br/>
    密码:<input type="password" name="user.password"/><br/>
    年龄:<input type="text" name="userInfo.age"/><br/>
    性别:<input type="radio" name="userInfo.sex" value="男"/>男
    <input type="radio" name="userInfo.sex" value="女"/>女<br/>
    电话:<input type="text" name="userInfo.phone"/><br/>
    选择头像:<input type="file" name="userInfo.file"/>
    <button type="button" onclick="add()">注册</button>
</form>
</body>
<script>
    function add() {
        var index1 = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        var formData = new FormData($("#fm")[0]);
        $.ajax({
            url:"/ssm/u/add",
            type:"Post",
            data:formData,
            contentType:false,
            processData:false,
            success:function (result) {
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
    })
    }
</script>
</html>
