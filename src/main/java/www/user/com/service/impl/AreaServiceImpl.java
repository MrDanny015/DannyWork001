package www.user.com.service.impl;

import org.springframework.stereotype.Service;
import www.user.com.bean.T_area;
import www.user.com.bean.T_areaExample;
import www.user.com.dao.T_areaMapper;
import www.user.com.service.AreaService;

import javax.annotation.Resource;
import java.util.List;
@Service
public class AreaServiceImpl implements AreaService {

    @Resource
    private T_areaMapper t_areaMapper;

    /**
     * 级联查询
     * @param parentId
     * @return
     */
    @Override
    public List<T_area> selectObjectByParentId(Integer parentId) {
        T_areaExample t_areaExample = new T_areaExample();
        t_areaExample.createCriteria().andParentidEqualTo(parentId);
        return t_areaMapper.selectByExample(t_areaExample);
    }
}
