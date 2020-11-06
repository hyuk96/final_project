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
	public ModelAndView mapSeoulArea(HttpSession session) {
		String user = "G";
		if(session.getAttribute("idx")!=null) {
			user = (String) session.getAttribute("idx"); 
		}
		Preference array = ms.memberPreference(user);
		String most0 = array.getMP1();
		String most1 = array.getMP2();
		String most2 = array.getMP3();
		System.out.println(most0+" / "+most1+" / "+most2);
		String[] most = {most0,most1,most2};
		if(!user.equals("G")) {
			for(int i = 0; i <most.length; i++) {
				String z = "";
				String[] so = {"1.5","1","0.5"};
				if(most[i].equals("우선1")) {
					z = "SPark";
				}else if(most[i].equals("우선2")){
					z = "SSubway";
				}else if(most[i].equals("우선3")){
					z = "SHospital";
				}else {
					System.out.println(i+"번째 저장못함");
				}
				most[i] = z+"*"+so[i];
				System.out.println(most[i]);
			}
		}else {
			most[0] = "SPark";
			most[1] = "SSubway";
			most[2] = "SHospital";
		}
		System.out.println(most[0]+" / "+most[1]+" / "+most[2]);
		return ms.mapSeoulArea(most);
	}

	
	
}




