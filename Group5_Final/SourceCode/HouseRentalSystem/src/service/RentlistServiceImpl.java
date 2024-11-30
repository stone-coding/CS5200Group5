package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Pojo.Rentlist;
import dao.RentlistMapper;

@Service
public class RentlistServiceImpl implements RentlistService {

	@Autowired
	private RentlistMapper rentlistMapper;

	@Override
	public void insertrentlist(Rentlist rentlist) {
		rentlistMapper.insertrentlist(rentlist);

	}

	@Override
	public List<Rentlist> findrentuserlist() throws Exception {
		List<Rentlist> rentlist=rentlistMapper.findrentuserlist();

		return rentlist;
	}

	@Override
	public Rentlist findrentlist(String house_id) {
		Rentlist rentlist=rentlistMapper.findrentlist(house_id);
		return rentlist;
	}

	@Override
	public void deleterentlist(String house_id) {
		rentlistMapper.deleterentlist(house_id);

	}

	@Override
	public List<Rentlist> findrentlistbyuid(Integer userlist_id) {
		List<Rentlist> rentlist=rentlistMapper.findrentlistbyuid(userlist_id);
		return rentlist;
	}

}
