package kr.co.persistence;


import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberDTO;
import kr.co.domain.OrderedListDTO;
import kr.co.domain.PickupDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession session;
	
	private final String NS = "o.r.d";

	

	@Override
	public List<PickupDTO> pList(String[] checkArr) {

		//HashMap<String, Object> map = new HashMap<String, Object>();
		//map.put("checkArr",checkArr);

		return session.selectList(NS+".pList", checkArr);
	}



	@Override
	public MemberDTO mRead(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".mRead", id);
	}



	@Override
	public void insertOlist(OrderedListDTO dto) {
		Integer ono = session.selectOne(NS+".getOno");
		if(ono!=null){
			ono+=1;
			}else{
			ono=1;
		}
		dto.setOno(ono);
		session.insert(NS+".insertOlist",dto);
	}



	@Override
	public List<OrderedListDTO> orderedList(String id) {
		return session.selectList(NS+".orderedList",id);
	}

}
