package www.user.com.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import www.user.com.bean.F_Role;
import www.user.com.bean.F_RoleExample;
import www.user.com.bean.F_User;
import www.user.com.bean.F_UserExample;
import www.user.com.dao.F_RoleMapper;
import www.user.com.dao.F_UserMapper;
import www.user.com.service.UserService;
import www.util.MD5Util;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 丹尼 用户模块 业务实现
 */
@Service
public class UserServiceimpl implements UserService {

    @Resource
    private F_UserMapper userMapper;
    @Resource
    private F_RoleMapper roleMapper;


    /**
     * 登陆 用户名验证
     * @param username
     * @return
     */
    @Override
    public F_User loginis(String username) {
        F_UserExample f_userExample = new F_UserExample();
        f_userExample.createCriteria().andUsernameEqualTo(username);
        List<F_User> f_users = userMapper.selectByExample(f_userExample);
        if (f_users!=null && f_users.size()>0){
            return f_users.get(0);
        }else {
            return null;
        }
    }

    /**
     * 注册 添加用户
     * @param user
     * @throws Exception
     */
    @Override
    public void registered(F_User user) throws Exception {
        //设置状态
        user.setStauts(0);
        //MD5加密
        user.setUserpwd(MD5Util.mysqlMd5(user.getUserpwd()));
        userMapper.insert(user);
    }

    /**
     * 职位查询
     * @param f_roleExample
     * @return
     */
    @Override
    public List<F_Role> selectrole(F_RoleExample f_roleExample) {
        return roleMapper.selectByExample(f_roleExample);
    }

    /**
     * 列表 查询 分页
     * @param page
     * @param limit
     * @param keyWord
     * @return
     */
    @Override
    public List<F_User> queryAllDataFromTable(int page, int limit, String keyWord) {
        page = (page - 1) * limit;
        return userMapper.queryAllDataFromTable(page, limit, keyWord);
    }

    /**
     * 模糊查询
     * @param keyWord
     * @return
     */
    @Override
    public int queryAllCount(String keyWord) {
        return userMapper.queryAllCount(keyWord);
    }

    /**
     * 删除用户 批量删除
     * @param ids
     * @throws Exception
     */
    @Override
    public void deleteUsers(Integer[] ids) throws Exception {
        F_UserExample f_userExample = new F_UserExample();
        f_userExample.createCriteria().andUidIn(Arrays.asList(ids));
        userMapper.deleteByExample(f_userExample);
    }

    /**
     * 添加用户
     * @param f_user
     * @throws Exception
     */
    @Override
    public void adduser(F_User f_user) throws Exception {
        //MD5加密
        f_user.setUserpwd(MD5Util.mysqlMd5(f_user.getUserpwd()));
        userMapper.insert(f_user);
    }

    /**
     * 修改用户
     * @param f_user
     * @throws Exception
     */
    @Override
    public void upduser(F_User f_user) throws Exception {
        //MD5加密
        f_user.setUserpwd(MD5Util.mysqlMd5(f_user.getUserpwd()));
        userMapper.updateByPrimaryKey(f_user);
    }

    /**
     * 根据id查询用户信息
     * @param uid
     * @return
     */
    @Override
    public F_User selectById(Integer uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

}
