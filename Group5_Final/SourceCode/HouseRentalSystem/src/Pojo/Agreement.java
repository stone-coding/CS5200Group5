package Pojo;

public class Agreement {
    private Integer id;
    private String lease;
    private String lease_idcard;
    private String tenant;
    private String tenant_idcard;
    private String fromdate;
    private String todate;
    private double price;
    private String address;
    private String house_id;
    private Integer payday;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLease() {
        return lease;
    }

    public void setLease(String lease) {
        this.lease = lease;
    }

    public String getLease_idcard() {
        return lease_idcard;
    }

    public void setLease_idcard(String lease_idcard) {
        this.lease_idcard = lease_idcard;
    }

    public String getTenant() {
        return tenant;
    }

    public void setTenant(String tenant) {
        this.tenant = tenant;
    }

    public String getTenant_idcard() {
        return tenant_idcard;
    }

    public void setTenant_idcard(String tenant_idcard) {
        this.tenant_idcard = tenant_idcard;
    }

    public String getFromdate() {
        return fromdate;
    }

    public void setFromdate(String fromdate) {
        this.fromdate = fromdate;
    }

    public String getTodate() {
        return todate;
    }

    public void setTodate(String todate) {
        this.todate = todate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHouse_id() {
        return house_id;
    }

    public void setHouse_id(String house_id) {
        this.house_id = house_id;
    }

    public Integer getPayday() {
        return payday;
    }

    public void setPayday(Integer payday) {
        this.payday = payday;
    }

}
