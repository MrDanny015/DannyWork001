package www.tree.com.service.impl;

import org.springframework.stereotype.Service;
import www.tree.com.bean.Laytree;
import www.tree.com.dao.LaytreeMapper;
import www.tree.com.service.TreeService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 丹尼 左侧菜单树实现 业务层实现
 */
@Service
public class TreeServiceImpl implements TreeService {

    @Resource
    private LaytreeMapper laytreeMapper;

    /**
     * 树列表
     * @param
     * @return
     */
    @Override
    public List<Laytree> findRoot() {
        return laytreeMapper.findRoot();
    }

    /**
     * 递归查询树结构
     * @param id
     * @return
     */
    @Override
    public List<Laytree> findChild(Integer id) {
        //递归寻找所有子节点
        List<Laytree> list = new ArrayList<Laytree>();
        List<Laytree> child = laytreeMapper.findChild(id);
        if (child != null && child.size()>0){
            for ( Laytree t:child) {
                t.setChildren(findChild(t.getId()));
                list.add(t);
            }
        }
        return list;
    }
}
