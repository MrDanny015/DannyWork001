package www.util;

import java.io.Serializable;

public class MessageCode implements Serializable {

    public static MessageCode  SELECT_SUCCESS=new MessageCode(10000,"数据查询成功");
    public static MessageCode USER_ERROR=new MessageCode(10001,"用户名不存在");
    public static MessageCode PASS_ERROR=new MessageCode(10002,"用户名存在密码错误");
    public static MessageCode USER_SUCCESS=new MessageCode(10003,"用户名验证通过");

    //定义状态码
    private int code;
    //返回信息
    private String message;

    /**
     * 私有的构造函数
     * @param code
     * @param message
     */
    private MessageCode(int code,String message){
        this.code=code;
        this.message=message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
