package kr.co.persistence;


import java.util.List;

import kr.co.domain.PickupDTO;

public interface PickupDAO {

	List<PickupDTO> pickupList(String id);

	void pickupDelete(int pno);

	void pickupDelete2(PickupDTO dto);

	
	
}
