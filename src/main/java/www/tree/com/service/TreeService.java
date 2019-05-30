package www.tree.com.service;

import www.tree.com.bean.Laytree;

import java.util.List;

/**
 * @author 丹尼 左侧菜单树实现 业务层
 */
public interface TreeService {

    /**
     * 查询根节点
     * @return
     */
    List<Laytree> findRoot();

    /**
     * 寻找子节点
     * @param id
     * @return
     */
    List<Laytree> findChild(Integer id);
}
