package kr.co.goodee.servies;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.goodee.dao.MemberDAO;
import kr.co.goodee.dto.MemberDto;
import kr.co.goodee.dto.Preference;

@Service
public class MemberServies {

	@Autowired MemberDAO dao;
	public String login(String id, String pw) {
		ArrayList<MemberDto> sc = dao.login(id,pw);
		int midx = sc.get(0).getMIdx();
		String name = sc.get(0).getMNickname();
		String sum = name+","+midx;
		System.out.println(midx);
		return sum;
	}
	public HashMap<String, Object> find(String key, String find) {
		System.out.println(key);
		System.out.println(find);
		MemberDto dto = dao.find(key);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("re",dto.getMId());
		if(find=="ID") {
			map.put("type","id");
		}else {
			map.put("type","pw");
		}
		System.out.println(dto);
		return map;
	}
	public int pwchange(String id, String pw) {
		int success = dao.pwchange(id,pw);
		System.out.println(success);
		return success;
	}
	public ArrayList<MemberDto> memberlist() {
		return dao.memberlist();
	}
	public ArrayList<MemberDto> blaklist() {
		// TODO Auto-generated method stub
		return  dao.blaklist();
	}
	public ArrayList<MemberDto> blakb(String list) {
		String a[] =list.split("/");
		System.out.println(a.length);
		int seccess = 0;
		for (int i = 1; i <= a.length-1; i++) {
			int z = dao.blakb(a[i]);
			seccess += z;
		}
		System.out.println(seccess);
		return dao.blaklist();
	}
	public ModelAndView blselect(String id) {
		ModelAndView mav = new ModelAndView();
		System.out.println("1차 확인용");
		mav.addObject("list", dao.blselect(id));
		mav.setViewName("list");
		return mav;
		
	}
	public int bldelete(String idx) {
		return dao.bldelete(idx);
	}
	public String bladd(String midx) {
		
		String msg ="블랙리스트 추가에 실패했습니다.";
		String[] array = midx.split(",");
		if(dao.bladdre(array[0])<1) {
			dao.bladd(array[0],array[1]);
			msg = "추가에 성공했습니다.";
		}
		return msg;
	}
	public void bld(String midx) {
		String[] delete = midx.split(",");
		int z = 0;
		for (int i = 0; i < delete.length; i++) {
			int y = dao.bld(delete[i]);
			if(y!=0) {
				z++;
			}
		}
		if(z==delete.length) {
			System.out.println("삭제 성공");
		}
		
	}
	public int memberdelect(String idx) {
		// TODO Auto-generated method stub
		return dao.memberdelect(idx);
	}
	public Preference OrPreference(String idx) {
		Preference pf = dao.OrPreference(idx);
		return pf;
	}
	public void NewPreference(String idx, String m1, String m2, String m3) {
		dao.NewPreference(idx,m1,m2,m3);
		
	}
	public void memberchange(String idx, String nicname, String cPw) {
		dao.memberchange(idx,nicname,cPw);
		
	}
	

}
