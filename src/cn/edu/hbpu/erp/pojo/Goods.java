package cn.edu.hbpu.erp.pojo;

public class Goods {
    private Integer gid;

    private String gname;

    private Long gprice;

    private Integer total;

    private String supplier;

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public Long getGprice() {
        return gprice;
    }

    public void setGprice(Long gprice) {
        this.gprice = gprice;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", gname=" + gname + ", gprice=" + gprice + ", total=" + total + ", supplier="
				+ supplier + "]";
	}
    
    
}