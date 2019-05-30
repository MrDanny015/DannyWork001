package www.util;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {

    /**
     * 加密
     * @param content
     * @return
     */
    public static String encoderByMd5(String content){
       //确定计算方法
        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
            BASE64Encoder base64en = new BASE64Encoder();
            //加密内容的字节
            byte[] bytes = content.getBytes("UTF-8");
            //加密后的字节
            byte[] digest = md5.digest(bytes);
            //把加密后的字节转换成字符串
            String md5content = base64en.encode(digest);
            return md5content;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * mysql5 MD5加密的算法
     * @param content
     * @return
     */
    public static String mysqlMd5(String content){
        byte[] secretByte;
        try {
            secretByte = MessageDigest.getInstance("md5")
                    .digest(content.getBytes());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("找不到md5算法");
        }
        StringBuilder md5Code = new StringBuilder(new BigInteger(1, secretByte).toString(16));
        for (int i = 0; i < 32 - md5Code.length(); i++) {
            md5Code.insert(0, "0");
        }
        return md5Code.toString();

    }
}
