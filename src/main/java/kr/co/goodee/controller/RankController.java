package kr.co.goodee.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.service.RankService;

public class RankController {
	
	@Autowired RankService service;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/rank", method = RequestMethod.GET)
	public ModelAndView rank() {
		return service.rank();
	}
	
	@RequestMapping(value = "/ranker", method = RequestMethod.GET)
	public ModelAndView ranker() {
		return service.ranker();
	}

}
