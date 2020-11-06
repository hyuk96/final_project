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
public class mapController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberServies ms;
	
	
	@RequestMapping(value = "/mapSeoulArea", method = RequestMethod.GET)
	public String mapSeoulArea() {
		logger.info("msg 확인");
		logger.info("로그인 페이지 요청");
		
		return "loginForm";
	}

	
	
}




