package Pojo;

public class Rentlist {
	private Integer rentid;
	private String house_id;
	private Double price;
	private String address;
	private Integer userlist_id;
	private Integer contract_id;
	private Userlist userlist;
	public Userlist getUserlist() {
		return userlist;
	}
	public void setUserlist(Userlist userlist) {
		this.userlist = userlist;
	}
	public Integer getRentid() {
		return rentid;
	}
	public void setRentid(Integer rentid) {
		this.rentid = rentid;
	}
	public String getHouse_id() {
		return house_id;
	}
	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getUserlist_id() {
		return userlist_id;
	}
	public void setUserlist_id(Integer userlist_id) {
		this.userlist_id = userlist_id;
	}
	public Integer getContract_id() {
		return contract_id;
	}
	public void setContract_id(Integer contract_id) {
		this.contract_id = contract_id;
	}
	
}
