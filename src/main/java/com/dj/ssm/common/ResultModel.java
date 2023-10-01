package com.dj.ssm.common;


public class ResultModel {

	private Integer code;
	private String msg;
	private Object data;

	
	public static ResultModel success() {
		return new ResultModel(200, "请求成功", null);
	}
	
	public static ResultModel success(Object data) {
		return new ResultModel(200, "请求成功", data);
	}
	
	public static ResultModel success(String msg, Object data) {
		return new ResultModel(200, msg, data);
	}
	
	public static ResultModel error() {
		return new ResultModel(-1, "服务器处理异常，请稍后重试", null);
	}
	public static ResultModel error(String msg) {
		return new ResultModel(-1, msg, null);
	}
	public static ResultModel error(Integer code, String msg) {
		return new ResultModel(code, msg, null);
	}
	public static ResultModel error(String msg, Object data) {
		return new ResultModel(-1, msg, data);
	}
	
	public ResultModel(Integer code, String msg, Object data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
}
