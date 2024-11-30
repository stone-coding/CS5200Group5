package dao;

import java.util.List;

import Pojo.Rentlist;

public interface RentlistMapper {
	public void insertrentlist(Rentlist rentlist);
	public List<Rentlist> findrentuserlist() throws Exception;
	Rentlist findrentlist(String house_id);
	public void deleterentlist(String house_id);
	public List<Rentlist> findrentlistbyuid(Integer userlist_id);
	public Rentlist findtenantrentlist(Integer id);
}