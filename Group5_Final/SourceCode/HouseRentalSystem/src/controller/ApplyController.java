package controller;

import Pojo.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.ApplyService;
import service.HouselistService;
import service.UserlistService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ApplyController {
	/**
	 * userlistService manipulates
	 *
	 */
	@Autowired
	private UserlistService userlistService;
	@Autowired
	private HouselistService houselistService;
	@Autowired
	private ApplyService applyService;
	//Apply for house
	@RequestMapping("/applycheckuserlist")
	public String applycheckuserlist(HttpSession httpSession,Model model,Integer id){
		//1.get user_id from httpSession
		User user1= (User) httpSession.getAttribute("user");
		Integer user_id=user1.getId();
		//2.check if user_id in userList
		Userlist list=userlistService.findhasuserlist(user_id);
		if(list==null){
			model.addAttribute("error", "applycheck");
			return "redirect:houselist.action";
		}else{
			Houselist houselist=houselistService.findid(id);
			houselist.setStatus("AlreadyApplied");
			houselistService.updatehousestatus(houselist);
			Integer userlist_id=list.getId();
			Apply apply=new Apply();
			apply.setHouse_id(houselist.getHouseid());
			apply.setAddress(houselist.getAddress());
			apply.setPrice(houselist.getPrice());
			apply.setArea(houselist.getArea());
			apply.setStatus("Applying");
			apply.setUserlist_id(userlist_id);
			applyService.insertapply(apply);
			model.addAttribute("error", "applysuccess");
			return "redirect:houselist.action";


		}

	}
	//Administrators view the list of applications for house viewing
	@RequestMapping("/findapplylist")
	public String findapplylist(Model model,@RequestParam(required=false,defaultValue="1") Integer page,
								@RequestParam(required=false,defaultValue="10") Integer pageSize) throws Exception{
		PageHelper.startPage(page, pageSize);
		List<Apply> applylist=applyService.findapplylist();
		PageInfo<Apply> p=new PageInfo<Apply>(applylist);
		model.addAttribute("applylist",applylist);
		model.addAttribute("p", p);
		model.addAttribute("mainPage","applylist.jsp");
		return "admin/main1";
	}


	@RequestMapping("/applychangehousestatus")
	public String applychangehousestatus(HttpSession httpSession,Model model,String house_id)throws Exception{
		User user1= (User) httpSession.getAttribute("user");
		Integer user_id=user1.getId();
		Userlist userlist=userlistService.findhasuserlist(user_id);
		Houselist houselist=houselistService.findhouseid(house_id);
		houselist.setStatus("Rented");
		houselistService.updatehousestatus(houselist);
		Rentlist rentlist=new Rentlist();
		rentlist.setHouse_id(house_id);
		rentlist.setPrice(houselist.getPrice());
		rentlist.setAddress(houselist.getAddress());

		return "";
	}
	//The administrator rejected the house viewing application
	@RequestMapping("/refuseapply")
	public String refuseapply(String house_id,Model model){
		Houselist houselist=new Houselist();
		houselist.setHouseid(house_id);
		houselist.setStatus("Not Rented");
		applyService.refuseapply(houselist);

		return "redirect:findapplylist.action";
	}

	//Tenants check their viewing applications
	@RequestMapping("/getmyapply")
	public String getmyapply(Model model,HttpSession httpSession,@RequestParam(required=false,defaultValue="1") Integer page,
							 @RequestParam(required=false,defaultValue="10") Integer pageSize){
		User user1= (User) httpSession.getAttribute("user");
		Userlist userlist=userlistService.findhasuserlist(user1.getId());
		PageHelper.startPage(page, pageSize);
		List<Userlist> list=userlistService.getmyapply(userlist.getId());
		PageInfo<Userlist> p=new PageInfo<Userlist>(list);
		model.addAttribute("userlist", list);
		model.addAttribute("p", p);
		model.addAttribute("mainPage", "myapply.jsp");
		return "tenant/main";
	}


}
