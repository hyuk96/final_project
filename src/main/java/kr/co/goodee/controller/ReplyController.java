package kr.co.goodee.controller;

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

import kr.co.goodee.service.ReplyService;

@Controller
public class ReplyController {

   private Logger logger = LoggerFactory.getLogger(this.getClass());
   @Autowired
   ReplyService service;

   // 시작페이지
   @RequestMapping(value = "/start", method = RequestMethod.GET)
   public String home(Model model) {
      System.out.println("시작 성공");
      return "start";
   }

   // 메인페이지
   @RequestMapping(value = "/main", method = RequestMethod.GET)
   public String main(Model model) {
      System.out.println("메인");
      return "main";
   }

   // 회원가입페이지
   @RequestMapping(value = "/join", method = RequestMethod.GET)
   public String join(Model model) {
      return "join";
   }

   // 댓글 리스트 불러오기
   @RequestMapping(value = "/replylist", method = RequestMethod.GET)
   public ModelAndView replylist(@RequestParam String page) {
      System.out.println("댓글 리스트 불러오기 성공");
      System.out.println(page);
      return service.replylist(page);
   }
   
   // 댓글 작성
   @RequestMapping(value = "/replyadd", method = RequestMethod.GET)
   public String replyadd(@RequestParam String text, HttpSession session) {
      System.out.println("댓글 : "+ text);
      String idx = (String) session.getAttribute("idx");
      String hidx = "1"; // 건물번호 받아와야함
      String nick = (String) session.getAttribute("name");
      if(service.replyadd(idx,text,hidx,nick)>0) {
    	  System.out.println("확인");
      }
      return "redirect:/replylist?page=1";
   }
   
   // page
   @RequestMapping(value = "/replypage", method = RequestMethod.GET)
   public @ResponseBody HashMap<String, Object> replypage(@RequestParam HashMap<String, String> page) {
	  String page1 = page.get("page");
      System.out.println("댓글 현재 페이지 : "+ page1);
      return service.replypage(page1);
   }
   

   // 댓글 삭제
   @RequestMapping(value = "/replydelete")
   public String replydelete(@RequestParam("idx") String idx) {
      service.replydelete(idx);
      return "redirect:/";
   }


}