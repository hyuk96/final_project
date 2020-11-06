package kr.co.goodee.dao;

import java.util.ArrayList;


import kr.co.goodee.dto.CrudDto;
import kr.co.goodee.dto.MemberDto;
import kr.co.goodee.dto.Preference;
import kr.co.goodee.dto.SeoulAreaDTO;

public interface MemberDAO {

	ArrayList<MemberDto> login(String id, String pw);

	String nic(String id);

	MemberDto find(String key);

	int pwchange(String id, String pw);

	ArrayList<MemberDto> memberlist();
	
	ArrayList<MemberDto> blaklist();

	int blakb(String string);
	
	ArrayList<CrudDto> blselect(String id);

	int bldelete(String idx);

	int bladdre(String string);

	void bladd(String string, String string2);

	int bld(String string);

	int memberdelect(String idx);

	Preference OrPreference(String idx);

	void NewPreference(String idx, String m1, String m2, String m3);

	void memberchange(String idx, String nicname, String cPw);

	ArrayList<SeoulAreaDTO> mapSeoulArea(String m1, String m2, String m3);

	Preference memberPreference(String user);


}
