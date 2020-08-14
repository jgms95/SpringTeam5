package kr.co.persistence;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;


@Repository
public class MemberDAOimpl implements MemberDAO{
	
	
	@Autowired
	private SqlSession session;

	private final String NS = "m.e.m";
	
	@Override
	public void insert(MemberDTO dto) {
		session.insert(NS + ".insert",dto); //"m.e.m" mapper에 id가 insert인 것을 실행
	}

	@Override
	public MemberDTO loginpost(LoginDTO login) {
		return session.selectOne(NS+".loginpost",login);
	}

	@Override
	public int checkId(MemberDTO dto) {
		return session.selectOne(NS+".checkId",dto);
	}

	@Override
	public MemberDTO findId(MemberDTO dto) {
		return session.selectOne(NS+".findId",dto);
	}

	@Override
	public MemberDTO findPw(MemberDTO dto) {
		return session.selectOne(NS+".findPw",dto);
	}

	@Override
	public String findAuthority(String id) {
		return session.selectOne(NS+".findAuthority",id);
	}

	@Override
	public MemberDTO readId(String id) {
		return session.selectOne(NS+".readId",id);
	}
	
	@Override
	public MemberDTO updateui(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".updateui", id);
	}

	@Override
	public String checkPw(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".checkPw", id);
	}
	
	@Override
	public void update(MemberDTO dto) {
		// TODO Auto-generated method stub
		session.update(NS+".update", dto);
	}
	@Override
	public List<MemberDTO> memberlist1() {
		// TODO Auto-generated method stub
		return session.selectList(NS+".memberlist1");
	}
	
	@Override
	public List<MemberDTO> memberlist2() {
		// TODO Auto-generated method stub
		return session.selectList(NS+".memberlist2");
	}
	
	@Override
	public void grantup(String id) {
		// TODO Auto-generated method stub
		session.update(NS+".grantup", id);
	}
	
	@Override
	public void grantdown(String id) {
		// TODO Auto-generated method stub
		session.update(NS+".grantdown", id);
	}
	
	@Override
	public void deletemember(String id) {
		// TODO Auto-generated method stub
		session.delete(NS+".deletemember", id);
	}
	
 	@Override
 	public void insertAmount(String id, int totalprice) {
 		HashMap<String, Object> map = new HashMap<String, Object>();
 		map.put("id", id);
 		map.put("totalprice", totalprice);
 		session.update(NS+".insertAmount",map);
 	}

 	@Override
 	public int findAmount(String id) {
 		return session.selectOne(NS+".findAmount",id);
 	}


}
