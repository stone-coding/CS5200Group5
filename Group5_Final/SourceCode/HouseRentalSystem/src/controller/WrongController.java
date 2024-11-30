package controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Pojo.Paid;
import Pojo.QueryVo;
import Pojo.Solve;
import Pojo.Topaid;
import Pojo.User;
import Pojo.Userlist;
import Pojo.Wrong;
import Pojo.Rentlist;
import service.PaidService;
import service.SolveService;
import service.UserlistService;
import service.RentlistService;

@Controller
@RequestMapping("/wrong")
public class WrongController {
	@Autowired
	private SolveService solveService;
	@Autowired
	private UserlistService userlistService;
	@Autowired
	private PaidService paidService;
	@Autowired
	private RentlistService rentlistService;

	@RequestMapping("/selectall")
	public String selectall(Model model,QueryVo vo,@RequestParam(required=false,defaultValue="1") Integer page,
							@RequestParam(required=false,defaultValue="10") Integer pageSize){
		PageHelper.startPage(page, pageSize);
		List<Solve> list=solveService.selectall(vo);
		PageInfo<Solve> p=new PageInfo<Solve>(list);
		Integer count=solveService.selectcount(vo);
		model.addAttribute("solve", list);
		model.addAttribute("count", count);
		model.addAttribute("p", p);
		model.addAttribute("mainPage", "solve.jsp");
		model.addAttribute("vo", vo);
		return "admin/main1";
	}

	@RequestMapping("/findmysolve")
	public String findmysolve(HttpSession httpSession,Model model,QueryVo vo,@RequestParam(required=false,defaultValue="1") Integer page,
							  @RequestParam(required=false,defaultValue="10") Integer pageSize){
		User user1= (User) httpSession.getAttribute("user");
		Userlist userlist=userlistService.findhasuserlist(user1.getId());

		vo.setUserlist_id(userlist.getId());
		PageHelper.startPage(page, pageSize);
		List<Solve> list=solveService.selectall(vo);
		PageInfo<Solve> p=new PageInfo<Solve>(list);
		Integer count=solveService.selectcount(vo);
		model.addAttribute("solve", list);
		model.addAttribute("count", count);
		model.addAttribute("p", p);
		model.addAttribute("mainPage", "mysolve.jsp");
		model.addAttribute("vo", vo);
		return "tenant/main";
	}

	@RequestMapping("/deletesolve")
	public String deletesolve(Integer id){
		solveService.deletesolve(id);
		return "redirect:selectall.action";
	}

	@RequestMapping("/tenantdeletesolve")
	public String tenantdeletesolve(Integer id){
		solveService.deletesolve(id);
		return "redirect:findmypaid.action";
	}

	@RequestMapping("/showaddwrong")
	public String showaddwrong(HttpSession httpSession,Model model,@RequestParam(required=false,defaultValue="1") Integer page,
							   @RequestParam(required=false,defaultValue="10") Integer pageSize)throws Exception{
		User user1= (User) httpSession.getAttribute("user");
		Userlist userlist=userlistService.findhasuserlist(user1.getId());
		PageHelper.startPage(page, pageSize);
		List<Rentlist> list=rentlistService.findrentlistbyuid(userlist.getId());
		PageInfo<Rentlist> p=new PageInfo<Rentlist>(list);
		model.addAttribute("rentlist", list);
		model.addAttribute("p", p);
		model.addAttribute("mainPage", "showaddwrong.jsp");
		return "tenant/main";
	}

	@RequestMapping("/addwrong")
	public String addwrong(Integer id,Model model){
		Rentlist rentlist=paidService.findtenantrentlist(id);
		model.addAttribute("rentlist", rentlist);
		model.addAttribute("mainPage", "addwrong.jsp");
		return "tenant/main";
	}

	@RequestMapping("/insertwrong")
	public String insertwrong(Wrong wrong,Model model){
		solveService.insertwrong(wrong);
		model.addAttribute("error","insertwrong");

		return "redirect:showaddwrong.action";
	}

	@RequestMapping("/wronglist")
	public String wronglist(Model model,@RequestParam(required=false,defaultValue="1") Integer page,
							@RequestParam(required=false,defaultValue="10") Integer pageSize){
		QueryVo vo=new QueryVo();
		PageHelper.startPage(page, pageSize);
		List<Wrong> list=solveService.findwrong(vo);
		PageInfo<Wrong> p=new PageInfo<Wrong>(list);
		model.addAttribute("wrong", list);
		model.addAttribute("p", p);
		model.addAttribute("mainPage", "wrong.jsp");
		return "admin/main1";
	}

	@RequestMapping("/mywronglist")
	public String mywronglist(Model model,HttpSession httpSession,@RequestParam(required=false,defaultValue="1") Integer page,
							  @RequestParam(required=false,defaultValue="10") Integer pageSize){
		User user1= (User) httpSession.getAttribute("user");
		Userlist userlist=userlistService.findhasuserlist(user1.getId());
		QueryVo vo=new QueryVo();
		vo.setUserlist_id(userlist.getId());
		PageHelper.startPage(page, pageSize);
		List<Wrong> list=solveService.findwrong(vo);
		PageInfo<Wrong> p=new PageInfo<Wrong>(list);
		model.addAttribute("p", p);
		model.addAttribute("wrong",list);
		model.addAttribute("mainPage", "mywrong.jsp");
		return "tenant/main";
	}

	@RequestMapping("/gotosolve")
	public String gotosolve(Integer id,Model model){

		Wrong wrong=solveService.findbyid(id);
		Solve solve=new Solve();
		solve.setHouse_id(wrong.getHouse_id());
		solve.setAddress(wrong.getAddress());
		solve.setDate(wrong.getDate());
		solve.setDetail(wrong.getDetail());
		solve.setName(wrong.getName());
		solve.setUserlist_id(wrong.getUserlist_id());
		solve.setStatus("Processed");
		solveService.gotosolve(id, solve);
		model.addAttribute("error", "duesucess");
		return "redirect:selectall.action";
	}
}
