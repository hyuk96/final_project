package kr.co.goodee.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dao.searchDAO;
import kr.co.goodee.dto.compareDTO;
import kr.co.goodee.dto.likeDTO;

@Service
public class HomeService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired searchDAO dao;

	public HashMap<String, Object> listCall(HashMap<String, String> params) {
		logger.info("리스트 요청 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		String keyword = params.get("keyword");
		logger.info("keyword : "+keyword);
		result.put("sublist", dao.subwayCall(keyword));
		//result.put("list", dao.areaCall(keyword));
		result.put("list", dao.aptCall(keyword));
		
		return result;
	}

	public ModelAndView bookmark(String midx, String hidx) {

		int success = dao.bookmark(midx,hidx);
		logger.info("success : "+success);
		String page = "bookmarkForm";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView compare() {
		ModelAndView mav = new ModelAndView();
		ArrayList<compareDTO> array = dao.compare();
		mav.addObject("compare",array);
		mav.addObject("comparelenth",array.size());
		mav.setViewName("compareForm");
		return mav;

	}

	public HashMap<String, Object> compareAjax(HashMap<String, String> params) {
		logger.info("비교하기 아작스 요청 서비스");
		HashMap<String, Object> result = new HashMap<String, Object>();
		String f_idx = params.get("first");
		String s_idx = params.get("second");
		logger.info("idx : "+f_idx+" / "+s_idx);
		result.put("compare", dao.compareAjax(f_idx,s_idx));
		
		return result;
	}


}
