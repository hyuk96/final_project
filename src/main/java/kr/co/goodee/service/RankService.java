package kr.co.goodee.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dao.RankDAO;

public class RankService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	RankDAO dao;

	public ModelAndView rank() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("rank", dao.rank());
		return mav;
	}

	public ModelAndView ranker() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("ranker", dao.ranker());
		mav.setViewName("ranker");
		return mav;
	}
}
