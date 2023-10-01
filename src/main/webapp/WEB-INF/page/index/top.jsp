<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>i'm top page</title>
</head>
<body>
	<center>
		<h1>欢迎登陆</h1><br/>
	</center>
	本机IP地址:${addr}
	城市:${weather.city}
	天气:${weather.info}
	温度:${weather.temperature}
	湿度:${weather.humidity}
	风向:${weather.direct}
	风力:${weather.power}
	空气质量:${weather.aqi}
</body>
</html>