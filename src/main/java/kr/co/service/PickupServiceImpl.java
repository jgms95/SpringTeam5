package kr.co.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.PickupDTO;
import kr.co.persistence.PickupDAO;


@Service
public class PickupServiceImpl implements PickupService{

	@Inject
	private PickupDAO pickupDao;

	@Override
	public List<PickupDTO> pickupList(String id) {
		
		return pickupDao.pickupList(id);
	}

	@Override
	public void pickupDelete(int pno) {

		pickupDao.pickupDelete(pno);
	}

	@Override
	public void pickupDelete2(PickupDTO dto) {
		
		pickupDao.pickupDelete2(dto);
		
	}

	@Override
	public void pickupUpdate(PickupDTO dto) {

		pickupDao.pickupUpdate(dto);
		
	}

	@Override
	public void pickupInsert(PickupDTO dto) {
		
		pickupDao.pickupInsert(dto);
		
	}

	@Override
	public int stockIno(int ino) {
		// TODO Auto-generated method stub
		return pickupDao.stockIno(ino);
	}
	


}
