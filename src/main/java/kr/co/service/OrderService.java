package kr.co.service;

import java.util.List;

import kr.co.domain.MemberDTO;
import kr.co.domain.PickupDTO;

public interface OrderService {


	List<PickupDTO> pList(String id);

	MemberDTO mRead(String id);

	
}
