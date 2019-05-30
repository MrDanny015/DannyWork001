package www.util;

import java.io.Serializable;
import java.util.List;

public class ApiResult<T> implements Serializable {
    //定义返回状态码
    private int code; //200
    //附带信息
    private String message;

    //返回实体对象
    private T entity;
    //easyui 集合
    private List<T> rows;
    //总记录数
    private int total;

    public ApiResult<T> setCode(int code) {
        this.code = code;
        return this;
    }

    public  ApiResult<T> setMessage(String message) {
        this.message = message;
        return this;
    }

    public ApiResult<T> setRows(List<T> rows) {
        this.rows = rows;
        return this;
    }

    public ApiResult<T> setTotal(int total) {
        this.total = total;
        return this;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public T getEntity() {
        return entity;
    }

    public List<T> getRows() {
        return rows;
    }

    public int getTotal() {
        return total;
    }
}
