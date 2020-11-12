package kr.co.goodee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PopController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired kr.co.goodee.service.MemberServies ms;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam String id) {
		logger.info("검색할 id : " + id);
		return ms.blselect(id);
	}
	
	@RequestMapping(value = "/bldelete", method = RequestMethod.GET)
	public String bldelete(Model model, @RequestParam String idx, @RequestParam String name) {
		logger.info("삭제할 개시글 : " + idx);
		logger.info("삭제할 개시글 : " + name);
		String z = "redirect:/list?id="+name;
		logger.info("글보기 : " + z);
		String msg ="삭제 실패";
		if(ms.bldelete(idx)>0) {
			 msg ="삭제 성공";
		}
		model.addAttribute("msg", msg);
		return z;
	}


	
	
}




