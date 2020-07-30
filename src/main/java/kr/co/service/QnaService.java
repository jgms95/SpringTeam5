package kr.co.service;


import kr.co.domain.PageTO;
import kr.co.domain.QnaDTO;

public interface QnaService {

	PageTO<QnaDTO> allqnalist(PageTO<QnaDTO> to, String ino, String category);


}
