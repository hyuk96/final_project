package kr.co.goodee.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.goodee.dto.compareDTO;
import kr.co.goodee.dto.likeDTO;

public interface searchDAO {

	//ArrayList<searchDAO> areaCall(String keyword);
	
	ArrayList<searchDAO> aptCall(String keyword);
	
	ArrayList<searchDAO> compareAjax(String compare, String s_idx);

	int bookmark(String midx, String hidx);

	ArrayList<compareDTO> compare();

	ArrayList<searchDAO> subwayCall(String keyword);

}
