package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.EventCommentDTO;
import kr.co.domain.EventDTO;
import kr.co.domain.PageTO;
import kr.co.persistence.EventDAO;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDAO eDao;

	@Override
	public void insert(EventDTO dto) {
		eDao.insert(dto);
	}

	@Override
	public PageTO<EventDTO> eventlist(PageTO<EventDTO> to) {
		return eDao.eventlist(to);
	}

	@Override
	public EventDTO read(int eno) {
		return eDao.read(eno);
	}

	@Override
	public void delete(int eno) {
		eDao.delete(eno);
	}

	@Override
	public void finishevent(int eno, String title) {
		eDao.finishevent(eno, title);
	}

	@Override
	public void update(EventDTO dto) {
		eDao.update(dto);
	}

	@Override
	public PageTO<EventDTO> searchlist(PageTO<EventDTO> to, String search) {
		return eDao.searchlist(to,search);
	}

	@Override
	public void insertComment(EventCommentDTO dto) {
		eDao.insertComment(dto);
	}

	@Override
	public List<EventCommentDTO> readComment(int eno) {
		return eDao.readComment(eno);
	}

	@Override
	public EventCommentDTO orgComment(int orgNum) {
		return eDao.orgComment(orgNum);
	}

	@Override
	public void insertReply(EventCommentDTO dto) {
		eDao.insertReply(dto);
	}

	@Override
	public void updateComment(EventCommentDTO dto) {
		eDao.updateComment(dto);
	}

	@Override
	public void deleteComment(EventCommentDTO dto) {
		eDao.deleteComment(dto);
	}

	@Override
	public int countComments(int eno) {
		return eDao.countComments(eno);
	}

}
