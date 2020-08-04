package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberDTO;
import kr.co.domain.PickupDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession session;
	
	private final String NS = "o.r.d";

	

	@Override
	public List<PickupDTO> pList(String id) {

		return session.selectList(NS+".pList", id);
	}



	@Override
	public MemberDTO mRead(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".mRead", id);
	}

}
