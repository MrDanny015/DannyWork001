package www.user.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import www.user.com.bean.*;
import www.user.com.service.AreaService;
import www.user.com.service.UserService;
import www.util.MD5Util;
import www.util.VerifyCode;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 丹尼 用户模块 控制层
 */
@Controller
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private HttpServletRequest request;
    @Resource
    private AreaService areaService;


    /**
     * 验证码模块
     *
     * @param response
     * @throws Exception
     */
    @RequestMapping("codeload")
    @ResponseBody
    public void codeload(HttpServletResponse response) throws Exception {
        VerifyCode code = new VerifyCode();
        BufferedImage image = code.createImage();
        request.getSession().setAttribute("code", code.getText());
        VerifyCode.output(image, response.getOutputStream());
    }

    /**
     * 登陆
     *
     * @param username
     * @param userpwd
     * @return
     */
    @RequestMapping("loginis")
    @ResponseBody
    public Map<String, Object> loginis(String username, String userpwd, String code) {
        HashMap<String, Object> map = new HashMap<>();
        //根据用户名查询数据库
        F_User loginis = userService.loginis(username);
        //判断用户名是否正确
        if (loginis != null) {
            //MD5加密
            String pwssword = MD5Util.mysqlMd5(userpwd);
            //判断密码是否正确
            if (loginis.getUserpwd().equals(pwssword)) {
                //判断用户是否激活
                if (loginis.getStauts() == 1) {
                    map.put("flag", 10001);
                    //将用户信息存入session
                    HttpSession session = request.getSession();
                    session.setAttribute("user", loginis);
                } else {
                    map.put("flag", 10002);
                    map.put("msg", "用户未激活，请联系客服激活账号");
                }
            } else {
                map.put("flag", 10003);
                map.put("msg", "密码错误，请重新登陆");
            }
        } else {
            map.put("flag", 10004);
            map.put("msg", "用户名不存在，请重新登陆");
        }
        return map;
    }

    /**
     * 注册
     *
     * @param user
     * @return
     */
    @RequestMapping("registeris")
    @ResponseBody
    public Map<String, Object> registeris(F_User user, String code) {
        HashMap<String, Object> map = new HashMap<>();
        //获取验证码
        String logincode = (String) request.getSession().getAttribute("code");
        System.out.println("当前验证码是：" + logincode);
        //判断验证码是否正确
        if (code.equals(logincode)) {
            try {
                userService.registered(user);
                map.put("flag", true);
            } catch (Exception e) {
                e.printStackTrace();
                map.put("flag", false);
                map.put("msg", "注册失败，请重新输入");
            }
        } else {
            map.put("flag", false);
            map.put("msg", "验证码错误，请重新输入");
        }
        return map;
    }

    /**
     * 用户名判断是否存在
     *
     * @param username
     * @return
     */
    @RequestMapping("ifusername")
    @ResponseBody
    public Boolean ifusername(String username) {
        F_User loginis = userService.loginis(username);
        if (loginis == null && !"".equals(username)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 职位表查询
     *
     * @param f_roleExample
     * @return
     */
    @RequestMapping("selectrole")
    @ResponseBody
    public List<F_Role> selectrole(F_RoleExample f_roleExample) {
        return userService.selectrole(f_roleExample);
    }

    /**
     * 省市县 三级联动查询
     *
     * @param parentId
     * @return
     */
    @RequestMapping("/selectAreas")
    @ResponseBody
    public List<T_area> selects(@RequestParam(defaultValue = "-1") Integer parentId) {
        return areaService.selectObjectByParentId(parentId);
    }

    /**
     * 模糊查询 分页 列表
     *
     * @param page
     * @param limit
     * @param keyWord
     * @return
     */
    @ResponseBody
    @RequestMapping("/showData")
    public Map<String, Object> methodx(@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "15") int limit, String keyWord) {
        List<F_User> datas = userService.queryAllDataFromTable(page, limit, keyWord);
        int countx = userService.queryAllCount(keyWord);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", countx);
        map.put("data", datas);
        System.out.println(map.toString());
        return map;
    }

    /**
     * 删除 批量删除
     *
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteUsers")
    public Boolean deleteUsers(Integer[] ids) {
        try {
            userService.deleteUsers(ids);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 添加 修改 用户
     *
     * @param f_user
     * @return
     */
    @ResponseBody
    @RequestMapping("/addandupdUser")
    public Boolean addandupdUser(F_User f_user) {
        try {
            if (f_user.getUid() != null) {
                userService.upduser(f_user);
            } else {
                userService.adduser(f_user);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 根据id查询用户信息
     * @param uid
     * @return
     */
    @ResponseBody
    @RequestMapping("/selectUserById")
    public F_User selectUserById(Integer uid){
        return userService.selectById(uid);
    }



}