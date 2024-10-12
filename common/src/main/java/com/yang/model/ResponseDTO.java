package com.yang.model;



import com.yang.enums.ResponseStatusEnum;
import lombok.Data;

import java.io.Serializable;

@Data
public class ResponseDTO<T> implements Serializable {

    private Integer code;

    private String msg;

    private T data;

    public ResponseDTO() {}

    public ResponseDTO(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public ResponseDTO(Integer code, T data) {
        this.code = code;
        this.data = data;
    }

    public ResponseDTO(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    private ResponseDTO(ResponseStatusEnum resultStatus, T data) {
        this.code = resultStatus.getCode();
        this.msg = resultStatus.getMessage();
        this.data = data;
    }

    /**
     * 执行成功返回描述和状态码
     */
    public static ResponseDTO<Void> success(){
        return new ResponseDTO(ResponseStatusEnum.SUCCESS, null);
    }
    /**
     * 执行成功返回描述、状态码、相关数据
     */
    public static <T> ResponseDTO<T> success(T data){
        return new ResponseDTO<T>(ResponseStatusEnum.SUCCESS, data);
    }

    /**
     * 执行完成返回描述、状态码、相关数据
     */
    public static <T> ResponseDTO<T> success(ResponseStatusEnum resultStatus, T data){
        if (resultStatus == null){
            return success(data);
        }
        return new ResponseDTO<T>(resultStatus, data);
    }

    /**
     * 业务异常返回描述和状态码
     */
    public static <T> ResponseDTO<T> failure() {
        return new ResponseDTO<T>(ResponseStatusEnum.FAILURE, null);
    }

    /**
     * 业务异常返回描述和状态码
     */
    public static <T> ResponseDTO<T> failure(ResponseStatusEnum resultStatus) {
        return failure(resultStatus, null);
    }

    /**
     * 业务异常返回业务代码,描述和返回的参数
     */
    public static <T> ResponseDTO<T> failure(ResponseStatusEnum resultStatus, T data) {
        if (resultStatus == null) {
            return new ResponseDTO<T>(ResponseStatusEnum.FAILURE, null);
        }
        return new ResponseDTO<T>(resultStatus, data);
    }

    public static <T> ResponseDTO<T> failure(Integer code, String msg) {
        return new ResponseDTO<T>(code, msg);
    }

}
