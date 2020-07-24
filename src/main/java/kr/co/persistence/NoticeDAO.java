package kr.co.persistence;

import kr.co.domain.NoticeDTO;
import kr.co.domain.PageTO;

public interface NoticeDAO {

	PageTO<NoticeDTO> noticelist(PageTO<NoticeDTO> to);

	int insert(NoticeDTO dto);

	void fileUpload(String originalfileName, String saveFileName, long fileSize, int nno);

}
