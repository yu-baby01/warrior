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
    <script type="text/javascript" src="/ssm/res/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<form id="fm">
    <button type="button" onclick="add()">新增</button>
    <button type="button" onclick="adds()">批量新增</button>
    用户名/手机号:<input type="text" name="username" />
    注册时间:<input type="text" name="createTimeMin" onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"/>~
    <input type="text" name="createTimeMax" onclick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"/>
    <button type="button" onclick="sea()">查询</button>
    <table>
        <tr>
            <th>用户名</th>
            <th>密码</th>
            <th>注册时间</th>
            <th>年龄</th>
            <th>性别</th>
            <th>手机号</th>
        </tr>
        <tbody id="tb"></tbody>
        <div id="pageDiv"></div>
    </table>
    <input type="hidden" id="pageNo" name="pageNo" value="1"/>
    <input type="hidden" name="pageSize" value="2"/>
    上传文件:<input type="file" name="file" id="mf"/>
    <button type="button" onclick="sea()">上传头像</button>
</form>
</body>
<script>
    $(function () {
        search();
    })

    function sea(){
        search();
    }

    function search() {
        var formData = new FormData($("#fm")[0]);
        $.ajax({
            url: "/ssm/u/list",
            type:"post",
            data: formData,
            contentType:false,
            processData: false,
            success:function(result) {
                var html = "";
                var pageHtml = "";
                for (let i = 0; i < result.data.records.length; i++) {
                    var u = result.data.records[i]
                    html += "<tr>"
                    html += "<td>" + u.username + "</td>"
                    html += "<td>" + u.password + "</td>"
                    html += "<td>" + u.createTime + "</td>"
                    html += "<td>" + u.userInfo.age + "</td>"
                    html += "<td>" + u.userInfo.sex + "</td>"
                    html += "<td>" + u.userInfo.phone + "</td>"
                    html += "<td><img src='"+u.userInfo.img+"' width='50px'/></td>"
                    html += "</tr>"
                }
                pageHtml += "<td><button type='button' onclick='pageUp()'>上一页</button>"
                pageHtml += "<button type='button' onclick='pageDown(" + result.data.pages + ")'>下一页</button></td>"
                $("#pageDiv").html(pageHtml);
                $("#tb").html(html);
            }
        })
    }

    function pageUp() {
        var pageNo = $("#pageNo").val() - 1;
        if (pageNo < 1) {
            layer.msg("第一页");
            return;
        }
        $("#pageNo").val(pageNo);
        search();
    }

    function pageDown(totalPage) {
        var pageNo = $("#pageNo").val() * 1 + 1;
        if (pageNo > totalPage) {
            layer.msg("最后一页");
            return;
        }
        $("#pageNo").val(pageNo);
        search();
    }

    function add() {
        var index = layer.open({
            type: 2,
            title: '新增页面',
            shadeClose: true,
            shade: 0.8,
            area: ['380px', '90%'],
            content: "<%=request.getContextPath() %>/u/toAdd"
        })
    }
    function adds() {
        var index = layer.open({
            type: 2,
            title: '批量新增页面',
            shadeClose: true,
            shade: 0.8,
            area: ['380px', '90%'],
            content: "<%=request.getContextPath() %>/u/toAdds"
        })
    }

</script>
</html>
