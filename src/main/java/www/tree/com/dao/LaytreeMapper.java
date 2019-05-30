package www.tree.com.dao;

import org.apache.ibatis.annotations.Mapper;
import www.tree.com.bean.Laytree;

import java.util.List;

@Mapper
public interface LaytreeMapper {

    List<Laytree> findRoot();

    List<Laytree> findChild(Integer id);

}
