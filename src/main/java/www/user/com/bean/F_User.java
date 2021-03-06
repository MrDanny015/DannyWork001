package www.user.com.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class F_User implements Serializable {
    private String rname;

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column f_user.uid
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    private Integer uid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column f_user.username
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    private String username;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column f_user.userpwd
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    private String userpwd;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column f_user.uname
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    private String uname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column f_user.stauts
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    private Integer stauts;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column f_user.address
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    private String address;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column f_user.rid
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    private Integer rid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column f_user.brithday
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date brithday;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table f_user
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column f_user.uid
     *
     * @return the value of f_user.uid
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column f_user.uid
     *
     * @param uid the value for f_user.uid
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column f_user.username
     *
     * @return the value of f_user.username
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column f_user.username
     *
     * @param username the value for f_user.username
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column f_user.userpwd
     *
     * @return the value of f_user.userpwd
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public String getUserpwd() {
        return userpwd;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column f_user.userpwd
     *
     * @param userpwd the value for f_user.userpwd
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd == null ? null : userpwd.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column f_user.uname
     *
     * @return the value of f_user.uname
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public String getUname() {
        return uname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column f_user.uname
     *
     * @param uname the value for f_user.uname
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column f_user.stauts
     *
     * @return the value of f_user.stauts
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public Integer getStauts() {
        return stauts;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column f_user.stauts
     *
     * @param stauts the value for f_user.stauts
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public void setStauts(Integer stauts) {
        this.stauts = stauts;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column f_user.address
     *
     * @return the value of f_user.address
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public String getAddress() {
        return address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column f_user.address
     *
     * @param address the value for f_user.address
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column f_user.rid
     *
     * @return the value of f_user.rid
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public Integer getRid() {
        return rid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column f_user.rid
     *
     * @param rid the value for f_user.rid
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    public void setRid(Integer rid) {
        this.rid = rid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column f_user.brithday
     *
     * @return the value of f_user.brithday
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getBrithday() {
        return brithday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column f_user.brithday
     *
     * @param brithday the value for f_user.brithday
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setBrithday(Date brithday) {
        this.brithday = brithday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table f_user
     *
     * @mbg.generated Wed May 22 11:49:18 CST 2019
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", uid=").append(uid);
        sb.append(", username=").append(username);
        sb.append(", userpwd=").append(userpwd);
        sb.append(", uname=").append(uname);
        sb.append(", stauts=").append(stauts);
        sb.append(", address=").append(address);
        sb.append(", rid=").append(rid);
        sb.append(", brithday=").append(brithday);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}