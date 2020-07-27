package kr.co.service;

import java.util.List;

import kr.co.domain.NoticeDTO;
import kr.co.domain.NoticeFilesDTO;
import kr.co.domain.PageTO;

public interface NoticeService {

	PageTO<NoticeDTO> noticelist(PageTO<NoticeDTO> to);

	int insert(NoticeDTO dto);

	void fileUpload(String originalfileName, String saveFileName, long fileSize, int nno);

	NoticeDTO read(int nno);

	List<NoticeFilesDTO> getFiles(int nno);

	String getFileName(String file_num);

	String getOrgFileName(String file_num);

	void deleteNotice(int nno);


}
