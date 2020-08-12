package kr.co.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.co.domain.PageTO;
import kr.co.domain.QnaDTO;
import kr.co.domain.QnaFileDTO;
import kr.co.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService{

	@Inject
	private QnaDAO qnadao;

	@Override
	public PageTO<QnaDTO> allqnalist(PageTO<QnaDTO> to, String ino, String category) {
		return qnadao.allqnalist(to, ino, category);
	}

	@Override
	public int findBook(String ititle) {
		return qnadao.findBook(ititle);
	}

	@Override
	public void fileUpload(String originalfileName, String saveFileName, int qno, String filepath) {
		qnadao.fileUpload(originalfileName, saveFileName, qno, filepath);
	}

	@Override
	public int insert(QnaDTO dto) {
		return qnadao.insert(dto);
	}

	@Override
	public QnaDTO read(int qno) {
		return qnadao.read(qno);
	}

	@Override
	public List<QnaFileDTO> getFiles(int qno) {
		return qnadao.getFiles(qno);
	}

	@Override
	public QnaFileDTO fileInfo(String file_num) {
		return qnadao.fileInfo(file_num);
	}

	@Override
	public int reply(QnaDTO dto, QnaDTO orgdto) {
		return qnadao.reply(dto,orgdto);
	}

	@Override
	public void deleteFile(String file_name) {
		qnadao.deleteFile(file_name);
	}

	@Override
	public void updateQna(QnaDTO dto) {
		qnadao.updateQna(dto);
	}

	@Override
	public void deleteQna(int qno) {
		qnadao.deleteQna(qno);
	}

	@Override
	public PageTO<QnaDTO> searchlist(PageTO<QnaDTO> to, String ino, String category, String search,
			String find) {
		return qnadao.searchlist(to, ino, category, search, find);
	}


	
	
}
