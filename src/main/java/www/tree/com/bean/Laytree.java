package www.tree.com.bean;

import java.io.Serializable;
import java.util.List;

public class Laytree implements Serializable {

    Integer id;
    String name;
    Integer pid;
    private List<Laytree> children;
    Boolean spread;
    String href;
    String hrefMD;

    public Laytree(List<Laytree> children) {
        this.children = children;
    }

    public String getHrefMD() {
        return hrefMD;
    }

    public void setHrefMD(String hrefMD) {
        this.hrefMD = hrefMD;
    }

    public Laytree() {
    }

    public Laytree(Integer id, String name, Integer pid, List<Laytree> children, Boolean spread, String href, String hrefMD) {
        this.id = id;
        this.name = name;
        this.pid = pid;
        this.children = children;
        this.spread = spread;
        this.href = href;
        this.hrefMD = hrefMD;
    }

    @Override
    public String toString() {
        return "Laytree{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pid=" + pid +
                ", children=" + children +
                ", spread=" + spread +
                ", href='" + href + '\'' +
                ", hrefMD='" + hrefMD + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public List<Laytree> getChildren() {
        return children;
    }

    public void setChildren(List<Laytree> children) {
        this.children = children;
    }

    public Boolean getSpread() {
        return spread;
    }

    public void setSpread(Boolean spread) {
        this.spread = spread;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }
}
