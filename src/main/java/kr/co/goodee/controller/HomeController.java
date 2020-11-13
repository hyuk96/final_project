package kr.co.goodee.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dto.likeDTO;
import kr.co.goodee.service.HomeService;

@Controller
public class HomeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired HomeService service;
	
	
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public String home(Model model) {
	
		return "result";
	}

	
	
	@RequestMapping(value = "/listCall", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> listCall(@RequestParam HashMap<String, String> params){
		System.out.println("리스트보기요청");
		logger.info("리스트보기 : "+params);
		return service.listCall(params);
	}
	
	@RequestMapping(value = "/bookmarkForm", method = RequestMethod.GET)
	public String bookmarkForm(){
		return "bookmarkForm";
	}
	
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public ModelAndView bookmark(/*@RequestParam String params*/){
		String midx="1";
		String hidx="4";
		logger.info("즐겨찾기요청");
		logger.info("params : "+midx+"/"+hidx);
		
		return service.bookmark(midx,hidx);
	}
	
	@RequestMapping(value = "/compare", method = RequestMethod.GET)
	public ModelAndView compareForm(){
		
		return service.compare();
	}
	
	@RequestMapping(value = "/compareAjax", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> compareAjax(@RequestParam HashMap<String, String> params){
		
		logger.info("비교하기 아작스요청");
		logger.info("params " +params);
		return service.compareAjax(params);
	}
	
}
