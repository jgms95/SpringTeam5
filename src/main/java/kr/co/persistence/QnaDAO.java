package kr.co.persistence;


import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.QnaDTO;
import kr.co.domain.QnaFileDTO;

public interface QnaDAO {

	PageTO<QnaDTO> allqnalist(PageTO<QnaDTO> to, String ino, String category);

	int findBook(String ititle);

	void fileUpload(String originalfileName, String saveFileName, int qno, String filepath);

	int insert(QnaDTO dto);

	QnaDTO read(int qno);

	List<QnaFileDTO> getFiles(int qno);

	QnaFileDTO fileInfo(String file_num);

	int reply(QnaDTO dto, QnaDTO orgdto);

	void deleteFile(String file_name);

	void updateQna(QnaDTO dto);

	void deleteQna(int qno);

	PageTO<QnaDTO> searchlist(PageTO<QnaDTO> to, String ino, String category, String search, String find);

	


}