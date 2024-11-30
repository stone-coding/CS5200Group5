package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Pojo.Applyout;
import Pojo.Checkout;
import Pojo.Houselist;
import Pojo.Rentlist;
import dao.ApplyoutMapper;
import dao.CheckoutMapper;
import dao.AgreementMapper;
import dao.HouselistMapper;
import dao.RentlistMapper;

@Service
@Transactional
public class ApplyoutServiceImpl implements ApplyoutService {

	@Autowired
	private ApplyoutMapper applyoutMapper;
	@Autowired
	private HouselistMapper houselistMapper;
	@Autowired
	private AgreementMapper agreementMapper;
	@Autowired
	private CheckoutMapper checkoutMapper;
	@Autowired
	private RentlistMapper rentlistMapper;
	@Override
	public void insertapplyout(Rentlist rentlist) {
		Applyout applyout=new Applyout();
		applyout.setHouse_id(rentlist.getHouse_id());
		applyout.setAddress(rentlist.getAddress());
		applyout.setStatus("Applying");
		applyout.setUserlist_id(rentlist.getUserlist_id());
		Applyout indb=applyoutMapper.getByHouseIdAndUserIdAndStatus(rentlist.getHouse_id(),rentlist.getUserlist_id(),"Rejected");
		if (indb!=null){
			return;
		}
		applyoutMapper.insertapplyout(applyout);

	}
	@Override
	public List<Applyout> findallapplyout() {
		List<Applyout> list=applyoutMapper.findallapplyout();
		return list;
	}
	@Override
	public void updateapplyout(Applyout applyout) {

		applyoutMapper.updateapplyout(applyout);
	}
	@Override
	public void agreeapplyout(Integer id) {
		Applyout applyout=applyoutMapper.findbyid(id);
		Houselist houselist = new Houselist();
		System.out.println("Updating status for house_id: " + applyout.getHouse_id());
		houselist.setId(Integer.valueOf(applyout.getHouse_id()));
		houselist.setStatus("Not Rented");
		houselistMapper.updatestatus(houselist);

		agreementMapper.deleteagreement(applyout.getHouse_id());
		Checkout checkout=new Checkout();
		checkout.setHouse_id(applyout.getHouse_id());
		checkout.setAddress(applyout.getAddress());
		checkout.setStatus("Terminated");
		checkout.setUserlist_id(applyout.getUserlist_id());

		checkoutMapper.insertcheckout(checkout);
		applyout.setStatus("Approved");
		applyoutMapper.updateapplyoutbyhouse(applyout);
		rentlistMapper.deleterentlist(applyout.getHouse_id());
	}
	@Override
	public void deleteapplyout(Integer id) {

		applyoutMapper.deleteapplyout(id);
	}


}
