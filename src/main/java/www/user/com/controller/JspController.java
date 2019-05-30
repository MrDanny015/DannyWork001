package www.user.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author 丹尼 Jsp页面跳转方法集合类
 */
@Controller
public class JspController {

    @Resource
    private HttpServletRequest request;

    /**
     * 登陆页面跳转
     * @return
     */
    @RequestMapping("login.do")
    public String login(){
        return "login";
    }

    /**
     * 注册页面跳转
     * @return
     */
    @RequestMapping("source.do")
    public String source(){
        return "source";
    }

    /**
     * 主页页面跳转
     * @return
     */
    @RequestMapping("index.do")
    public String index(){
        return "index";
    }

    /**
     * 用户页面跳转
     * @return
     */
    @RequestMapping("admin.do")
    public String admin(){
        return "admin";
    }

    /**
     * create页面跳转
     * @return
     */
    @RequestMapping("create.do")
    public String create(){
        return "create";
    }

    /**
     * 会员列表页面跳转
     * @return
     */
    @RequestMapping("member.do")
    public String member(){
        return "member";
    }

    /**
     * sysConfig页面跳转
     * @return
     */
    @RequestMapping("sysConfig.do")
    public String sysConfig(){
        return "sysConfig";
    }

    /**
     * sysConfig页面跳转
     * @return
     */
    @RequestMapping("test.do")
    public String test(){
        return "test";
    }

    /**
     * 注销功能
     * @return
     */
    @RequestMapping("loginout.do")
    public void loginout(){
        HttpSession session = request.getSession();
        session.invalidate();
    }
    /**
     * 用户页面列表跳转
     * @return
     */
    @RequestMapping("usermanger.do")
    public String users(){
        return "users";
    }

}
