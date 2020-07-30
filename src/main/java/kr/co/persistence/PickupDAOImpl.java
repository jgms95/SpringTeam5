package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.PickupDTO;

@Repository
public class PickupDAOImpl implements PickupDAO{

	@Inject
	private SqlSession session;
	
	private final String NS = "p.i.c";

	@Override
	public List<PickupDTO> pickupList(String id) {
		
		return session.selectList(NS+".pickupList", id);
		
	}

	@Override
	public void pickupDelete(int pno) {
		
		session.delete(NS + ".pickupDelete", pno);
	}

	@Override
	public void pickupDelete2(PickupDTO dto) {
		
		session.delete(NS + ".pickupDelete2", dto);
	}

	@Override
	public void pickupUpdate(PickupDTO dto) {

		session.update(NS + ".pickupUpdate" , dto);
		
	}

	@Override
	public void pickupInsert(PickupDTO dto) {

		session.insert(NS + ".pickupInsert", dto);
		
	}

	
	

}
