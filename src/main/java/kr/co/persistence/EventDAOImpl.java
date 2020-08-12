package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.EventCommentDTO;
import kr.co.domain.EventDTO;
import kr.co.domain.PageTO;

@Repository
public class EventDAOImpl implements EventDAO{
	@Autowired
	private SqlSession session;

	private final String NS = "e.v.t";

	@Override
	public void insert(EventDTO dto) {
		Integer eno = session.selectOne(NS+".getEno");
		if(eno!=null) {
			eno += 1;
		}else {
			eno = 1 ;
		}
		dto.setEno(eno);
		session.insert(NS+".insert",dto);
	}

	@Override
	public PageTO<EventDTO> eventlist(PageTO<EventDTO> to) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage()); 
		List<EventDTO> list = session.selectList(NS+".list",null,rowBounds);
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
	public EventDTO read(int eno) {
		session.update(NS+".incresereadcnt",eno);
		return session.selectOne(NS+".read",eno);
	}

	@Override
	public void delete(int eno) {
		session.delete(NS+".delete",eno);
		session.delete(NS+".deleteEnoComments",eno);
	}

	@Override
	public void finishevent(int eno, String title) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("eno", eno);
		map.put("title", title);
		session.update(NS+".finishevent",map);
	}

	@Override
	public void update(EventDTO dto) {
		session.update(NS+".update",dto);
	}

	@Override
	public PageTO<EventDTO> searchlist(PageTO<EventDTO> to, String search) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage()); 
		List<EventDTO> list = session.selectList(NS+".searchlist",search,rowBounds);
		to.setList(list);
		Integer amount = session.selectOne(NS+".getsearchAmount",search);
		if(amount!=null) {
			to.setAmount(amount);
		}else {
			to.setAmount(0);
		}
		return to;
	}

	@Override
	public void insertComment(EventCommentDTO dto) {
		Integer eno = dto.getEno();
		session.update(NS+".updateReadcnt",eno);
		Integer num = session.selectOne(NS+".getNum");
		if(num!=null) {
			num += 1;
		}else {
			num = 1 ;
		}
		dto.setNum(num);
		dto.setRepRoot(num);
		session.insert(NS+".insertComment",dto);
	}

	@Override
	public List<EventCommentDTO> readComment(int eno) {
		return session.selectList(NS+".readComment",eno);
	}

	@Override
	public EventCommentDTO orgComment(int orgNum) {
		EventCommentDTO orgDTO = session.selectOne(NS+".orgComment",orgNum);
		session.update(NS+".updateCommentInfoes",orgDTO);
		return orgDTO;
	}

	@Override
	public void insertReply(EventCommentDTO dto) {
		Integer eno = dto.getEno();
		session.update(NS+".updateReadcnt",eno);
		Integer num = session.selectOne(NS+".getNum");
		if(num!=null) {
			num += 1;
		}else {
			num = 1 ;
		}
		dto.setNum(num);
		session.insert(NS+".insertReply",dto);
	}

	@Override
	public void updateComment(EventCommentDTO dto) {
		session.update(NS+".updateReadcnt",dto.getEno());
		session.update(NS+".updateComment",dto);
	}

	@Override
	public void deleteComment(EventCommentDTO dto) {
		session.update(NS+".updateReadcnt",dto.getEno());
		if(dto.getRepIndent()>0) {
			session.delete(NS+".deleteComment",dto);
		}else {
			session.delete(NS+".deleteAllComments",dto);
		}
	}

	@Override
	public int countComments(int eno) {
		return session.selectOne(NS+".countComments",eno);
	}
}
