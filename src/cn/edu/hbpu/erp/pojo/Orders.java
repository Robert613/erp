package cn.edu.hbpu.erp.pojo;

import java.util.Date;

public class Orders {
    private Integer oid;

    private String name;

    private String phone;

    private String addr;

    private String projectname;

    private Long orderaccount;

    private String ordertype;

    private String orderstatus;

    private Date createtime;

    private String recorder;

    private Integer isdel;
    
    private Delivery delivery;
    
    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    public Long getOrderaccount() {
        return orderaccount;
    }

    public void setOrderaccount(Long orderaccount) {
        this.orderaccount = orderaccount;
    }

    public String getOrdertype() {
        return ordertype;
    }

    public void setOrdertype(String ordertype) {
        this.ordertype = ordertype;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getRecorder() {
        return recorder;
    }

    public void setRecorder(String recorder) {
        this.recorder = recorder;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
     
	public Delivery getDelivery() {
		return delivery;
	}

	public void setDelivery(Delivery delivery) {
		this.delivery = delivery;
	}

	@Override
	public String toString() {
		return "Orders [oid=" + oid + ", name=" + name + ", phone=" + phone + ", addr=" + addr + ", projectname="
				+ projectname + ", orderaccount=" + orderaccount + ", ordertype=" + ordertype + ", orderstatus="
				+ orderstatus + ", createtime=" + createtime + ", recorder=" + recorder + ", isdel=" + isdel + "]";
	}
    
    
}