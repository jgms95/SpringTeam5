package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.PageTO;
import kr.co.domain.QnaDTO;
import kr.co.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService{

	@Inject
	private QnaDAO qnadao;

	@Override
	public PageTO<QnaDTO> allqnalist(PageTO<QnaDTO> to, String ino, String category) {
		return qnadao.allqnalist(to, ino, category);
	}

	
}
