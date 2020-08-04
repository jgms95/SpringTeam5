package kr.co.persistence;

import java.util.List;

import kr.co.domain.MemberDTO;
import kr.co.domain.PickupDTO;

public interface OrderDAO {


	List<PickupDTO> pList(String id);

	MemberDTO mRead(String id);

	
}
