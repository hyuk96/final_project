package kr.co.goodee.controller;

import java.util.HashMap;
import java.util.Locale;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.goodee.service.ReplyService;

@Controller
public class ReplyController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ReplyService service;

	// 시작페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
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

	// 로그인페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		System.out.println("로그인 성공");
		return "login";
	}

	// 회원가입페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) {
		return "join";
	}

	// 댓글 리스트 불러오기
	@RequestMapping(value = "/replylist", method = RequestMethod.GET)
	public ModelAndView replylist() {
		System.out.println("댓글 리스트 불러오기 성공");
		return service.replylist();
	}

	// 댓글 삭제
	@RequestMapping(value = "/replydelete")
	public String replydelete(@RequestParam("idx") String idx) {
		service.replydelete(idx);
		return "redirect:/";
	}

	// 댓글 작성
	@RequestMapping(value = "/replywrite")
	public String replywrite(@RequestParam HashMap<String, String> params) {
		System.out.println(params);
		String writer = params.get("writer");
		String content = params.get("content");
		String date = params.get("date");
		service.write(writer, date, content);
		return "redirect:/";
	}

}
