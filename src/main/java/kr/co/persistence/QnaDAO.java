package kr.co.persistence;

import kr.co.domain.PageTO;
import kr.co.domain.QnaDTO;

public interface QnaDAO {

	PageTO<QnaDTO> allqnalist(PageTO<QnaDTO> to, String ino, String category);


}
