package kr.co.service;


import java.util.List;

import kr.co.domain.PickupDTO;

public interface PickupService {

	List<PickupDTO> pickupList(String id);

	void pickupDelete(int pno);

	void pickupDelete2(PickupDTO dto);

	void pickupUpdate(PickupDTO dto);

	void pickupInsert(PickupDTO dto);
	
	int stockIno(int ino);

	

}
