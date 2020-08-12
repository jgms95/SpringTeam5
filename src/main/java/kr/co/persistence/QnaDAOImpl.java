package kr.co.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.domain.PageTO;
import kr.co.domain.QnaDTO;
import kr.co.domain.QnaFileDTO;

@Repository
public class QnaDAOImpl implements QnaDAO {
	@Autowired
	private SqlSession session;
	
	private final String NS = "q.n.a";

	@Override
	public PageTO<QnaDTO> allqnalist(PageTO<QnaDTO> to, String ino, String category) {
		
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage()); 
		List<QnaDTO> list;
		Integer amount;
		if(ino==null || ino.equals("all")) {
			list = session.selectList(NS+".allqnalist",category,rowBounds);
			amount = session.selectOne(NS+".getAmount",category);
		}else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ino", Integer.parseInt(ino));
			map.put("category",category);
			list = session.selectList(NS+".inoqnalist",map,rowBounds);
			amount = session.selectOne(NS+".getInoAmount",map);
		}
		to.setList(list);
		if(amount!=null) {
			to.setAmount(amount);
		}else {
			to.setAmount(0);
		}
		return to;
	}

	@Override
	public int findBook(String ititle) {
		return session.selectOne(NS+".findBook", ititle);
	}

	@Override
	public void fileUpload(String originalfileName, String saveFileName, int qno, String filepath) {
		Integer file_num = session.selectOne(NS+".getFile_num");
		if(file_num!=null) {
			file_num += 1;
		}else {
			file_num = 1 ;
		}
		HashMap<String, Object> fileUpload = new HashMap<>();
		fileUpload.put("qno", qno);
		fileUpload.put("o_name", originalfileName);
		fileUpload.put("file_name", saveFileName);
		fileUpload.put("file_num", file_num);
		fileUpload.put("filepath",filepath);
		System.out.println("saveFileName: "+ saveFileName);
	    session.insert(NS+".uploadfiles",fileUpload);
	}

	@Override
	public int insert(QnaDTO dto) {
		String ititle = dto.getItitle();
		QnaDTO sDto = session.selectOne(NS+".getInfos", ititle);
		dto.setIno(sDto.getIno());
		dto.setFilename(sDto.getFilename());
		Integer qno = session.selectOne(NS+".getQno");
		if(qno!=null) {
			qno += 1;
		}else {
			qno = 1 ;
		}
		dto.setQno(qno);
		dto.setRepRoot(qno);
		session.insert(NS+".insert",dto);
		return qno;
	}

	@Override
	public QnaDTO read(int qno) {
		session.update(NS+".incresereadcnt",qno);
		return session.selectOne(NS+".read",qno);
	}

	@Override
	public List<QnaFileDTO> getFiles(int qno) {
		return session.selectList(NS+".getFiles",qno);
	}

	@Override
	public QnaFileDTO fileInfo(String file_num) {
		return session.selectOne(NS+".fileInfo",file_num);
	}

	@Override
	public int reply(QnaDTO dto, QnaDTO orgdto) {
		Integer qno = session.selectOne(NS+".getQno");
		qno += 1;
		dto.setQno(qno);
		session.update(NS+".updateRepSteps",orgdto);
		session.insert(NS+".reply",dto);
		return qno;
	}

	@Override
	public void deleteFile(String file_name) {
		session.delete(NS+".deleteFile", file_name);
	}

	@Override
	public void updateQna(QnaDTO dto) {
		session.update(NS+".updateQna", dto);
	}

	@Override
	public void deleteQna(int qno) {
		session.delete(NS+".deleteQna",qno);
		session.delete(NS+".deleteAllFiles",qno);
	}

	@Override
	public PageTO<QnaDTO> searchlist(PageTO<QnaDTO> to, String ino, String category, String search,
			String find) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage()); 
		List<QnaDTO> list;
		Integer amount;
		HashMap<String, Object> searchlist = new HashMap<String, Object>();
		searchlist.put("category",category);
		searchlist.put("search",search);
		searchlist.put("find",find);
		if(ino==null || ino.equals("all")) {
			list = session.selectList(NS+".searchlist",searchlist,rowBounds);
			amount = session.selectOne(NS+".getSearchAmount",searchlist);
		}else {
			searchlist.put("ino", Integer.parseInt(ino));
			list = session.selectList(NS+".inosearchlist",searchlist,rowBounds);
			amount = session.selectOne(NS+".getInoSearchAmount",searchlist);
		}
		to.setList(list);
		if(amount!=null) {
			to.setAmount(amount);
		}else {
			to.setAmount(0);
		}
		return to;
	}



	

}
