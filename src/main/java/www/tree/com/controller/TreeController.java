package www.tree.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import www.tree.com.bean.Laytree;
import www.tree.com.service.TreeService;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 丹尼 树实现 控制层
 */
@Controller
public class TreeController {

    @Resource
    private TreeService treeService;

    /**
     * 树列表查询
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("selectTree")
    public List<Laytree> selectTree(){
        List<Laytree> ois = treeService.findRoot();
        for (Laytree node : ois){
            node.setChildren(treeService.findChild(node.getId()));
        }
        return ois;
    }
}
