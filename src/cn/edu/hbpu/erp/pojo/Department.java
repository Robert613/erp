package cn.edu.hbpu.erp.pojo;

public class Department {
    private Integer depid;

    private String depname;

    private String depmanager;

    private Integer depcount;

    private Integer isuse;

    private Integer isdel;

    public Integer getDepid() {
        return depid;
    }

    public void setDepid(Integer depid) {
        this.depid = depid;
    }

    public String getDepname() {
        return depname;
    }

    public void setDepname(String depname) {
        this.depname = depname;
    }

    public String getDepmanager() {
        return depmanager;
    }

    public void setDepmanager(String depmanager) {
        this.depmanager = depmanager;
    }

    public Integer getDepcount() {
        return depcount;
    }

    public void setDepcount(Integer depcount) {
        this.depcount = depcount;
    }

    public Integer getIsuse() {
        return isuse;
    }

    public void setIsuse(Integer isuse) {
        this.isuse = isuse;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}