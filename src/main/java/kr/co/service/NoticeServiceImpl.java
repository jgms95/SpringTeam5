package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.NoticeDTO;
import kr.co.domain.NoticeFilesDTO;
import kr.co.domain.PageTO;
import kr.co.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Inject
	private NoticeDAO noticeDao;

	@Override
	public PageTO<NoticeDTO> noticelist(PageTO<NoticeDTO> to) {
		return noticeDao.noticelist(to);
	}

	@Override
	public int insert(NoticeDTO dto) {
		return noticeDao.insert(dto);
	}

	@Override
	public void fileUpload(String originalfileName, String saveFileName, long fileSize, int nno) {
		noticeDao.fileUpload(originalfileName, saveFileName,fileSize,nno);
	}

	@Override
	public NoticeDTO read(int nno) {
		return noticeDao.read(nno);
	}

	@Override
	public List<NoticeFilesDTO> getFiles(int nno) {
		return noticeDao.getFiles(nno);
	}

	@Override
	public String getFileName(String file_num) {
		return noticeDao.getFileName(file_num);
	}

	@Override
	public String getOrgFileName(String file_num) {
		return noticeDao.getOrgFileName(file_num);
	}

	@Override
	public void deleteNotice(int nno) {
		noticeDao.deleteNotice(nno);
	}

	
}
