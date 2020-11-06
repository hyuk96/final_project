package kr.co.goodee.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dto.MemberDto;
import kr.co.goodee.dto.Preference;
import kr.co.goodee.servies.MemberServies;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HKController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberServies ms;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("msg 확인");
		logger.info("로그인 페이지 요청");
		
		return "loginForm";
	}
	
	@RequestMapping(value = "/adminP", method = RequestMethod.GET)
	public String adminP() {
		logger.info("관리자 페이지 요청");
		return "adminP";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam String id, @RequestParam String pw, HttpSession session) {
		logger.info("로그인 요청"+id+" / "+ pw);
		String name = ms.login(id,pw);
		logger.info("성공여부" + name);
		String[] sessi = name.split(",");
		String page = "loginForm";
		if(name != "") {
			page = "home";
			session.setAttribute("idx", sessi[1]);
			session.setAttribute("id", id);
			session.setAttribute("name", sessi[0]);
		}
		return page;
	}
	
	
	
	@RequestMapping(value = "/memberdelect", method = RequestMethod.GET)
	public String memberdelect(HttpSession session) {
		String idx = (String) session.getAttribute("idx");
		String page = "redirect:/home";
		logger.info("idx : "+idx);
		if(ms.memberdelect(idx)>0) {
			page ="redirect:/logout";
		}
		return page;
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		String id = (String) session.getAttribute("idx");
		logger.info("id : "+id);
		session.removeAttribute("idx");
		session.removeAttribute("id");
		session.removeAttribute("name");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find() {
		logger.info("찾기 페이지");
		return "find";
	}
	
	@RequestMapping(value = "/id", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> id(@RequestParam String key) {
		logger.info("아이디 찾기 페이지 : " + key);
		String id = "ID";
		return ms.find(key,id);
	}
	
	@RequestMapping(value = "/pw", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> pw(@RequestParam String key) {
		logger.info("비번 찾기 페이지 : " + key);
		String pw ="password";
		return ms.find(key,pw);
	}
	
	@RequestMapping(value = "/pwc", method = RequestMethod.POST)
	public String pwchange(Model mode, @RequestParam String id, @RequestParam String pw, @RequestParam String rpw) {
		logger.info("아이디 : "+id);
		logger.info("비번 : "+pw);
		logger.info("비번확인 : "+rpw);
		String page ="find";
		String msg = "비밀번호 변경에 실패했습니다.";
		if(pw.equals(rpw)) {
			if(ms.pwchange(id,pw)>0) {
				page ="home";
				msg = "비밀번호 변경에 성공했습니다.";
			}
		}
		// return "redirect:/list";
		mode.addAttribute("msg", msg);
		return page;
	}
	
	@RequestMapping(value = "member", method = RequestMethod.GET)
	public @ResponseBody ArrayList<MemberDto> member() {
		logger.info("회원정보리스트");
		return ms.memberlist();
	}
	
	
	
	@RequestMapping(value = "blaklist", method = RequestMethod.GET)
	public @ResponseBody ArrayList<MemberDto> blaklist() {
		logger.info("블랙");
		return ms.blaklist();
	}
	
	
	@RequestMapping(value = "/blakb", method = RequestMethod.GET)
	public @ResponseBody ArrayList<MemberDto> blakb(@RequestParam String list) {
		logger.info("블랙리스트 삭제할 멤버 : " + list);
		return ms.blakb(list);
	}
	
	@RequestMapping(value = "/bladd", method = RequestMethod.GET)
	public ModelAndView bladd(@RequestParam String midx) {
		logger.info("블랙리스트 삭제할 멤버 : " + midx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", ms.bladd(midx));
		mav.setViewName("adminP");
		return mav;
	}
	
	@RequestMapping(value = "/bld", method = RequestMethod.GET)
	public ModelAndView bldelete(@RequestParam String midx) {
		logger.info("블랙리스트 삭제할 멤버 : " + midx);
		ModelAndView mav = new ModelAndView();
		ms.bld(midx);
		mav.setViewName("adminP");
		return mav;
	}

	@RequestMapping(value = "/memberPreference", method = RequestMethod.GET)
	public String memberPreference(HttpSession session) {
		String idx = (String) session.getAttribute("idx");
		Preference pf = ms.OrPreference(idx);
		System.out.println(pf.getMP1());
		System.out.println(pf.getMP2());
		System.out.println(pf.getMP3());
		String m1 ="우선1";
		String m2 ="우선2";
		String m3 ="우선3";
		ms.NewPreference(idx,m1,m2,m3);
		String nicname = "닉 변경값";
		String cPw ="pass";
		ms.memberchange(idx,nicname,cPw);
		return "home";
	}
	
	
}




