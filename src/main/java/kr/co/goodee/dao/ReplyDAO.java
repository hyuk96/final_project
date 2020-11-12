package kr.co.goodee.dao;

import java.util.ArrayList;

import kr.co.goodee.dto.BoardDTO;

public interface ReplyDAO {

	ArrayList<BoardDTO> replylist();

	int replydel(int parseInt);

	void write(String writer, String date, String content);

}
