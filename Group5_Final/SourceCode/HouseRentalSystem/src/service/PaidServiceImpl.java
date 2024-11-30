package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Pojo.Paid;
import Pojo.QueryVo;
import Pojo.Rentlist;
import dao.PaidMapper;
import dao.RentlistMapper;
@Service
@Transactional
public class PaidServiceImpl implements PaidService {
	@Autowired
	private PaidMapper paidMapper;
	@Autowired
	private RentlistMapper rentlistMapper;

	@Override
	public List<Paid> selectall(QueryVo vo) {
		List<Paid> list=paidMapper.selectall(vo);
		return list;
	}

	@Override
	public Double selectsum(QueryVo vo) {
		Double sum=paidMapper.selectsum(vo);
		return sum;
	}

	@Override
	public void deletepaid(Integer id) {
		paidMapper.deletepaid(id);

	}

	@Override
	public List<Rentlist> findrentuserlist() throws Exception{
		List<Rentlist> list=rentlistMapper.findrentuserlist();
		return list;
	}

	@Override
	public Rentlist findtenantrentlist(Integer id) {
		Rentlist rentlist=rentlistMapper.findtenantrentlist(id);
		return rentlist;
	}


}
