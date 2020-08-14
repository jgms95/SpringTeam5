package kr.co.service;

import java.util.List;

import kr.co.domain.EventCommentDTO;
import kr.co.domain.EventDTO;
import kr.co.domain.PageTO;

public interface EventService {

	void insert(EventDTO dto);

	PageTO<EventDTO> eventlist(PageTO<EventDTO> to);

	EventDTO read(int eno);

	void delete(int eno);

	void finishevent(int eno, String title);

	void update(EventDTO dto);

	PageTO<EventDTO> searchlist(PageTO<EventDTO> to, String search);

	void insertComment(EventCommentDTO dto);

	List<EventCommentDTO> readComment(int eno);

	EventCommentDTO orgComment(int orgNum);

	void insertReply(EventCommentDTO dto);

	void updateComment(EventCommentDTO dto);

	void deleteComment(EventCommentDTO dto);

	int countComments(int eno);

	List<EventDTO> getEvent();

}
