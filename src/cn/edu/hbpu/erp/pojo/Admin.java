package cn.edu.hbpu.erp.pojo;

public class Admin {
    private Integer id;

    private String adminname;

    private String phone;

    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	@Override
	public String toString() {
		return "Admin [id=" + id + ", adminname=" + adminname + ", phone=" + phone + ", password=" + password + "]";
	}
    
    
}