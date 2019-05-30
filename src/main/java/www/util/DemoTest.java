package www.util;

import java.io.*;
import java.security.NoSuchAlgorithmException;

public class DemoTest {


    public static void main(String[] args) {
       String content="123";
       String md5Result = MD5Util.mysqlMd5(content);
        System.out.println(md5Result);
    }
}
