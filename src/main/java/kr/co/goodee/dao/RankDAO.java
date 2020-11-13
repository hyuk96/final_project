package kr.co.goodee.dao;

import java.util.ArrayList;

import kr.co.goodee.dto.BoardDTO;
import kr.co.goodee.dto.RankDTO;

public interface RankDAO {

	ArrayList<RankDTO> rank();

	ArrayList<RankDTO> ranker();

}
