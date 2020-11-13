package kr.co.goodee.dao;

import java.util.ArrayList;

import kr.co.goodee.dto.BoardDTO;

public interface ReplyDAO {


   ArrayList<BoardDTO> replylist(int start, int end);
   
   ArrayList<BoardDTO> replypage(int start, int end);

   int replydel(int parseInt);

   int write(String idx, String z, String hidx, String nick);


}

