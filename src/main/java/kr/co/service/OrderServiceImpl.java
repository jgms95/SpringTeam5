package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberDTO;
import kr.co.domain.PickupDTO;
import kr.co.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{

	@Inject
	private OrderDAO orderDAO;


	@Override
	public List<PickupDTO> pList(String id) {

		return orderDAO.pList(id);
	}


	@Override
	public MemberDTO mRead(String id) {
		// TODO Auto-generated method stub
		return orderDAO.mRead(id);
	}
	
	

}
