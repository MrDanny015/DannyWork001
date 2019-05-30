package www.user.com.service;

import www.user.com.bean.F_Role;
import www.user.com.bean.F_RoleExample;
import www.user.com.bean.F_User;
import www.user.com.bean.F_UserExample;

import java.util.List;
import java.util.Map;

/**
 * @author 丹尼 用户模块 业务接口
 */
public interface UserService {

    /**+
     * 登陆 用户名判断
     * @param username
     * @return
     */
    F_User loginis(String username);

    /**
     * 注册 添加用户
     * @param user
     * @throws Exception
     */
    void registered(F_User user) throws Exception;

    /**
     * 查询职位表
     * @param f_roleExample
     * @return
     */
    List<F_Role> selectrole(F_RoleExample f_roleExample);

    /**
     * 用户列表
     * @param page
     * @param limit
     * @param keyWord
     * @return
     */
    List<F_User> queryAllDataFromTable(int page, int limit, String keyWord);

    /**
     * 模糊查询
     * @param keyWord
     * @return
     */
    int queryAllCount(String keyWord);

    /**
     * 删除  批量删除
     * @param ids
     * @throws Exception
     */
    void deleteUsers(Integer[] ids)throws Exception;

    /**
     * 添加
     * @param f_user
     * @return
     * @throws Exception
     */
    void adduser(F_User f_user)throws  Exception;

    /**
     * 修改
     * @param f_user
     * @return
     * @throws Exception
     */
    void upduser(F_User f_user)throws  Exception;

    F_User selectById(Integer uid);

}
