package service;

import java.util.List;

import Pojo.Paid;
import Pojo.QueryVo;
import Pojo.Rentlist;

public interface PaidService {
	public List<Paid> selectall(QueryVo vo);
	public Double selectsum(QueryVo vo);
	public void deletepaid(Integer id);
	public List<Rentlist> findrentuserlist() throws Exception;
	public Rentlist findtenantrentlist(Integer id);

}
