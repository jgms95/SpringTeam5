package kr.co.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.NoticeDTO;
import kr.co.domain.NoticeFilesDTO;
import kr.co.domain.PageTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	@Autowired
	private SqlSession session;
	private final String NS = "n.t.o";
	
	@Override
	public PageTO<NoticeDTO> noticelist(PageTO<NoticeDTO> to) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage()); 
		List<NoticeDTO> list = session.selectList(NS+".list",null,rowBounds);
		to.setList(list);
		Integer amount = session.selectOne(NS+".getAmount");
		if(amount!=null) {
			to.setAmount(amount);
		}else {
			to.setAmount(0);
		}
		return to;
	}

	@Override
	public int insert(NoticeDTO dto) {
		Integer nno = session.selectOne(NS+".getNno");
		if(nno!=null) {
			nno += 1;
		}else {
			nno = 1 ;
		}
		dto.setNno(nno);
		session.insert(NS+".insert",dto);
		return nno;
	}

	@Override
	public void fileUpload(String originalfileName, String saveFileName, long fileSize, int nno) {
		Integer file_num = session.selectOne(NS+".getFile_num");
		if(file_num!=null) {
			file_num += 1;
		}else {
			file_num = 1 ;
		}
		HashMap<String, Object> fileUpload = new HashMap<String, Object>();
		fileUpload.put("originalfileName", originalfileName);
		fileUpload.put("saveFileName", saveFileName);
		fileUpload.put("fileSize", fileSize);
		fileUpload.put("file_num", file_num);
		fileUpload.put("nno",nno);
	    session.insert(NS+".uploadfiles",fileUpload);		
	}

	@Override
	public NoticeDTO read(int nno) {
		session.update(NS+".incresereadcnt",nno);
		return session.selectOne(NS+".read",nno);
	}

	@Override
	public List<NoticeFilesDTO> getFiles(int nno) {
		return session.selectList(NS+".getFiles",nno);
	}

	@Override
	public String getFileName(String file_num) {
		return session.selectOne(NS+".getFileName",file_num);
	}

	@Override
	public String getOrgFileName(String file_num) {
		return session.selectOne(NS+".getOrgFileName", file_num);
	}

	@Override
	public void deleteNotice(int nno) {
		session.delete(NS+".delete",nno);
		session.delete(NS+".deleteAllFiles",nno);
	}

	@Override
	public void deleteFile(String file_name) {
		session.delete(NS+".deleteFile", file_name);
	}

	@Override
	public void updateNotice(NoticeDTO dto) {
		session.update(NS+".updateNotice", dto);
	}

	@Override
	public PageTO<NoticeDTO> searchlist(PageTO<NoticeDTO> to, String search) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage()); 
		List<NoticeDTO> list = session.selectList(NS+".searchlist",search,rowBounds);
		to.setList(list);
		Integer amount = session.selectOne(NS+".getsearchAmount",search);
		if(amount!=null) {
			to.setAmount(amount);
		}else {
			to.setAmount(0);
		}
		return to;
	}

	
	
	
}
