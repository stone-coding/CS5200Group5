package Pojo;

import java.sql.Date;

public class QueryVo {
    private String rentname;
    private String fromdate;
    private String todate;
    private Integer userlist_id;

    public Integer getUserlist_id() {
        return userlist_id;
    }

    public void setUserlist_id(Integer userlist_id) {
        this.userlist_id = userlist_id;
    }

    public String getRentname() {
        return rentname;
    }

    public void setRentname(String rentname) {
        this.rentname = rentname;
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


}
