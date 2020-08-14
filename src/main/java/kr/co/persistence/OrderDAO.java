package kr.co.persistence;

import java.util.List;

import kr.co.domain.MemberDTO;
import kr.co.domain.OrderedListDTO;
import kr.co.domain.PickupDTO;

public interface OrderDAO {


	List<PickupDTO> pList(String[] checkArr);

	MemberDTO mRead(String id);

	void insertOlist(OrderedListDTO dto);

	List<OrderedListDTO> orderedList(String id);

	
}
