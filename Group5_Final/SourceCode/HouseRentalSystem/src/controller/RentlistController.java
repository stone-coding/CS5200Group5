package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Pojo.Agreement;
import Pojo.User;
import Pojo.Userlist;
import Pojo.Rentlist;
import service.UserlistService;
import service.RentlistService;

@Controller
@RequestMapping("/rentlist")
public class RentlistController {
	@Autowired
	private RentlistService rentlistService;
	@Autowired
	private UserlistService userlistService;

	@RequestMapping("/toaddagreement")
	public String toaddagreement(Model model,String house_id){
		Agreement agreement=new Agreement();
		agreement.setHouse_id(house_id);
		model.addAttribute("agreement", agreement);
		model.addAttribute("mainPage", "addagreement.jsp");

		return "admin/main1";
	}

	@RequestMapping("/findrentlist")
	public String findrentlist(Model model,@RequestParam(required=false,defaultValue="1") Integer page,
							   @RequestParam(required=false,defaultValue="10") Integer pageSize) throws Exception{
		PageHelper.startPage(page, pageSize);
		List<Rentlist> rentlist=rentlistService.findrentuserlist();
		PageInfo<Rentlist> p=new PageInfo<Rentlist>(rentlist);
		model.addAttribute("p", p);
		model.addAttribute("rentlist", rentlist);
		model.addAttribute("mainPage", "rentlist.jsp");
		return "admin/main1";
	}


	@RequestMapping("/myrentlist")
	public String myrentlist(Model model,HttpSession httpSession,@RequestParam(required=false,defaultValue="1") Integer page,
							 @RequestParam(required=false,defaultValue="10") Integer pageSize) throws Exception{

		User user1= (User) httpSession.getAttribute("user");
		Userlist userlist=userlistService.findhasuserlist(user1.getId());
		PageHelper.startPage(page, pageSize);
		List<Userlist> list=userlistService.getUserrentList(userlist.getId());
		PageInfo<Userlist> p=new PageInfo<Userlist>(list);
		model.addAttribute("userlistrent", list);
		model.addAttribute("p", p);
		model.addAttribute("mainPage", "myrentlist.jsp");

		return "tenant/main";
	}

}
