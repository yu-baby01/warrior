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
    <title>登陆页面</title>
    <script type="text/javascript" src="/ssm/res/jq/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/ssm/res/layer/layer.js"></script>
</head>
<body>
<form id="fm">
    用户名:<input type="text" name="username"/>
    密码:<input type="password" name="password"/>
    <button type="button" onclick="login()">登录</button>
</form>
</body>
<script>
    function login() {
        var index = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.post(
            "/ssm/u/login",
            $("#fm").serialize(),
            function (result) {
                if (result.code != 200) {
                    layer.close(index);
                    layer.msg(result.msg)
                    return
                }
                layer.msg(result.msg)
                location.href = "/ssm/index/toIndex"
            }
        )
    }
</script>
</html>
