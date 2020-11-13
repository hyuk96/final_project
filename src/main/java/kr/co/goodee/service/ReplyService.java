package kr.co.goodee.service;


import java.util.HashMap;



import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Repository;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dao.ReplyDAO;

@Service
public class ReplyService {

   private Logger logger = LoggerFactory.getLogger(this.getClass());
   @Autowired private SqlSession sqlSession;
   ReplyDAO inter = null; 

   // 댓글 불러오기
   public ModelAndView replylist(String page) {
      logger.info("댓글 불러오기 서비스 도착");
      ModelAndView mav = new ModelAndView();
      inter = sqlSession.getMapper(ReplyDAO.class);
      int start = 1;
      int end = 10;
      mav.addObject("replylist", inter.replylist(start,end));
      mav.setViewName("main");
      return mav;
   }
   
   // 댓글 불러오기
   public HashMap<String, Object> replypage(String page) {
	   HashMap<String, Object> json = new HashMap<String, Object>();
	   System.out.println("1번");
      inter = sqlSession.getMapper(ReplyDAO.class);
      System.out.println("2번");
      int p = Integer.parseInt(page);
      int start = 1;
      int end = 10;
      if(p>1) {
    	  p-=1;
    	  start += (10*p); 
    	  end += (10*p);
      }
      json.put("com", inter.replypage(start,end));
      return json;
   }
   

   // 댓글 삭제
   public void replydelete(String idx) {
      inter = sqlSession.getMapper(ReplyDAO.class);   
      inter.replydel(Integer.parseInt(idx));      
   }
   
   // 댓글 작성
	public int replyadd(String idx, String z, String hidx, String nick) {
		System.out.println(idx + " / "+ z + " / "+hidx + " / "+nick);
		//HashMap<String, Object> json = new HashMap<String, Object>();
		return inter.write(idx, z, hidx, nick);
	}

}
