package kr.co.goodee.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dao.ReplyDAO;

@Service
public class ReplyService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private SqlSession sqlSession;

	ReplyDAO inter = null;

	// 댓글 불러오기
	public ModelAndView replylist() {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(ReplyDAO.class);
		mav.addObject("replylist", inter.replylist());
		mav.setViewName("main");
		return mav;
	}

	// 댓글 삭제
	public void replydelete(String idx) {
		inter = sqlSession.getMapper(ReplyDAO.class);	
		inter.replydel(Integer.parseInt(idx));		
	}
	
	// 댓글 작성
	public void write(String writer, String date, String content) {
		inter = sqlSession.getMapper(ReplyDAO.class);			
		inter.write(writer, date, content);		
	}

}
