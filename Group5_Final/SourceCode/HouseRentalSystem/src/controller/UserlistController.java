package controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Pojo.Houselist;
import Pojo.User;
import Pojo.Userlist;
import service.UserlistService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller
public class UserlistController {

	@Autowired
	private UserlistService userlistService;


	@RequestMapping("/findhasuserlist")
	public String findhasuserlist(HttpSession httpSession,Model model) throws Exception{
		User user1= (User) httpSession.getAttribute("user");
		Integer user_id=user1.getId();
		Userlist userlist=userlistService.findhasuserlist(user_id);
		model.addAttribute("userlist", userlist);
		model.addAttribute("mainPage", "updateuserlist.jsp");
		return "tenant/main";

	}

	@RequestMapping("/checkuserlist")
	public String checkuserlist(Model model,Userlist userlist,HttpSession httpSession) throws Exception{
		if(userlist.getId()==null){
			String idcard=userlist.getIdcard();
			Userlist list=userlistService.checkuserlist(idcard);

			if(list!=null){
				model.addAttribute("error", "IDUsedByOtherAccount");
				model.addAttribute("mainPage", "updateuserlist.jsp");
				model.addAttribute("userlist", userlist);
			}else{
				User user1= (User) httpSession.getAttribute("user");
				Integer user_id=user1.getId();
				userlist.setUser_id(user_id);
				userlistService.insertuserlist(userlist);
				Userlist list1=userlistService.checkuserlist(idcard);
				model.addAttribute("error", "DataChangedSuccessfully");
				model.addAttribute("mainPage", "updateuserlist.jsp");
				model.addAttribute("userlist", list1);
			}



		}
		else{

			Userlist list=userlistService.finduserlistupdate(userlist);
			if(list!=null){
				model.addAttribute("error", "IDUsed");
				model.addAttribute("mainPage", "updateuserlist.jsp");
				model.addAttribute("userlist", userlist);
			}else{
				userlistService.updateuserlist(userlist);
				model.addAttribute("error", "UpdatedSuccessfully");
				model.addAttribute("mainPage", "updateuserlist.jsp");
				model.addAttribute("userlist", userlist);
			}

		}
		return "tenant/main";
	}

	@RequestMapping("/findalluserlist")
	public String findalluserlist(Model model ,@RequestParam(required=false,defaultValue="1") Integer page,
								  @RequestParam(required=false,defaultValue="2") Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Userlist> userlist=userlistService.findalluserlist();
		PageInfo<Userlist> p=new PageInfo<Userlist>(userlist);
		model.addAttribute("userlist", userlist);
		model.addAttribute("p", p);
		model.addAttribute("mainPage", "userlist.jsp");
		return "admin/main1";

	}

	@RequestMapping("/deleteuserlist")
	public String deleteuserlist(Model model,Integer id) {
		userlistService.deleteuserlist(id);
		model.addAttribute("error", "deletesuccess");
		return "redirect:findalluserlist.action";
	}
}
