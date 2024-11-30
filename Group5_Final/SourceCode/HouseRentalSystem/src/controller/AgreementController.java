package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Pojo.Apply;
import Pojo.Checkout;
import Pojo.Agreement;
import Pojo.Houselist;
import Pojo.Rentlist;
import service.ApplyService;
import service.CheckoutService;
import service.AgreementService;
import service.HouselistService;
import service.RentlistService;
@Controller
@RequestMapping("/agreement")
public class AgreementController {
	@Autowired
	private AgreementService agreementService;
	@Autowired
	private HouselistService houselistService;
	@Autowired
	private ApplyService applyService;
	@Autowired
	private RentlistService rentlistService;
	@Autowired
	private CheckoutService checkoutService;


	@RequestMapping("/insertagreement")
	public String insertagreement(Model model,Agreement agreement){

		agreementService.insertagreement(agreement);
		Agreement agreement1=agreementService.findagreement(agreement.getHouse_id());

		Houselist houselist=houselistService.findhouseid(agreement1.getHouse_id());
		houselist.setStatus("Rented");
		houselistService.updatehousestatus(houselist);

		Rentlist rentlist=new Rentlist();
		Apply apply=applyService.findbyhouse_id(agreement.getHouse_id());
		rentlist.setHouse_id(agreement.getHouse_id());
		rentlist.setUserlist_id(apply.getUserlist_id());
		rentlist.setContract_id(agreement1.getId());
		rentlist.setPrice(apply.getPrice());
		rentlist.setAddress(apply.getAddress());
		rentlistService.insertrentlist(rentlist);

		applyService.deletebyhouse_id(agreement1.getHouse_id());
		model.addAttribute("error", "rentsuccess");
		return "redirect:/rentlist/findrentlist.action";

	}
	@RequestMapping("/seeagreement")
	public String seeagreement(String house_id,Model model){
		Agreement agreement=agreementService.findagreement(house_id);
		model.addAttribute("agreement", agreement);
		model.addAttribute("mainPage", "agreement.jsp");
		return "admin/main1";
	}
	@RequestMapping("/updateagreement")
	public String updateagreement(String house_id,Model model){
		Agreement agreement=agreementService.findagreement(house_id);
		model.addAttribute("agreement", agreement);
		model.addAttribute("mainPage", "updateagreement.jsp");
		return "admin/main1";
	}
	@RequestMapping("/changeagreement")
	public String changeagreement(Agreement agreement){
		agreementService.updateagreement(agreement);

		return "redirect:/rentlist/findrentlist.action";
	}


	@RequestMapping("/deleteagreement")
	public String deleteagreement(String house_id,Model model){
		agreementService.deleteagreement(house_id);
		Rentlist rentlist=rentlistService.findrentlist(house_id);
		Checkout checkout=new Checkout();
		checkout.setHouse_id(house_id);
		checkout.setAddress(rentlist.getAddress());
		checkout.setStatus("Terminated");
		checkout.setUserlist_id(rentlist.getUserlist_id());
		checkoutService.insertcheckout(checkout);
		Houselist houselist = new Houselist();
		houselist.setId(Integer.valueOf(house_id));
		houselist.setStatus("Not Rented");
		houselistService.updatehousestatus(houselist);

		rentlistService.deleterentlist(house_id);

		model.addAttribute("error", "checkoutsuccess");
		return "redirect:/rentlist/findrentlist.action";
	}

	@RequestMapping("/tenantseeagreement")
	public String tenantseeagreement(String house_id,Model model){
		Agreement agreement=agreementService.findagreement(house_id);
		model.addAttribute("agreement", agreement);
		model.addAttribute("mainPage", "showagreement.jsp");
		return "tenant/main";
	}
}
