package com.dj.ssm.common;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 自定义-业务处理异常类
 */
@Data
@NoArgsConstructor
public class BusinessException extends RuntimeException implements Serializable {

    /**
     * 异常消息
     */
    private String errorMsg;

    /**
     * 异常码
     */
    private Integer errorCode = -1;

    public BusinessException(String errorMsg) {
        super(errorMsg);
        this.errorMsg = errorMsg;
    }

    public BusinessException(Integer errorCode, String errorMsg) {
        super(errorMsg);
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

    public BusinessException(Integer errorCode, String errorMsg, Throwable cause) {
        super(errorMsg, cause);
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

}
