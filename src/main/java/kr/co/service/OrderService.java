package kr.co.service;

import java.util.List;

import kr.co.domain.MemberDTO;
import kr.co.domain.OrderedListDTO;
import kr.co.domain.PickupDTO;

public interface OrderService {


	List<PickupDTO> pList(String[] checkArr);

	MemberDTO mRead(String id);

	void insertOlist(OrderedListDTO dto);

	List<OrderedListDTO> orderedList(String id);

	
}
