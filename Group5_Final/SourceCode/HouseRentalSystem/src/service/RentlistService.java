package service;

import java.util.List;

import Pojo.Rentlist;

public interface RentlistService {
	public void insertrentlist(Rentlist rentlist);
	public List<Rentlist> findrentuserlist() throws Exception;
	public Rentlist findrentlist(String house_id);
	public void deleterentlist(String house_id);
	public List<Rentlist> findrentlistbyuid(Integer userlist_id);
}
