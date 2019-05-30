package www.user.com.service;

import www.user.com.bean.T_area;

import java.util.List;

public interface AreaService {

    List<T_area> selectObjectByParentId(Integer parentId);
}
