package kr.co.goodee.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LonginInterceptor extends HandlerInterceptorAdapter {

	// Controller 가기전에 잡는 놈
	// true 가 반환되지 않으면 못지나간다.(원하는 컨트롤러 요청으로 갈 수 없다.)
	// 못가개 막는 역활
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("컨트롤러 접근 전");
		// 세션검사
		HttpSession session = request.getSession();
		// 세션의 로그인 아이디가 없으면 '/' 로 이동
		if(session.getAttribute("id")==null) {
			System.out.println("로그인 안한놈");
			response.sendRedirect("/goodee/");
		}
		// 존재하면 통과
		System.out.println("로그인 한놈");
		
		return true;
	}

	// 컨트롤러를 지나서 View 가기전에 잡는 놈
	// 뭔가를 더 주는 역활
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("컨트롤러 ~ 뷰 전송 직전");
		String id = (String) request.getSession().getAttribute("id");
		String name = (String) request.getSession().getAttribute("name");
		String content ="<div>안녕하세요 "+id+" 님 / "+ name +" <a href='./logout'>logout</a> </div>";
		modelAndView.addObject("loginBox", content);
	}	
	
}
