package kr.co.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;
import kr.co.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO memberDao;

	@Override
	public void insert(MemberDTO dto) {
		memberDao.insert(dto);
	}


	@Override
	public MemberDTO loginpost(LoginDTO login) {
		return memberDao.loginpost(login);
	}

	@Override
	public int checkId(MemberDTO dto) {
		return memberDao.checkId(dto);
	}

	@Override
	public MemberDTO findId(MemberDTO dto) {
		return memberDao.findId(dto);
	}

	@Override
	public MemberDTO findPw(MemberDTO dto) {
		return memberDao.findPw(dto);
	}


	@Override
	public String findAuthority(String id) {
		return memberDao.findAuthority(id);
	}


	@Override
	public MemberDTO readId(String id) {
		return memberDao.readId(id);
	}
	@Override
	public MemberDTO updateui(String id) {
		// TODO Auto-generated method stub
		return memberDao.updateui(id);
	}
	@Override
	public String checkPw(String id) {
		// TODO Auto-generated method stub
		return memberDao.checkPw(id);
	}
	
	@Override
	public void update(MemberDTO dto) {
		// TODO Auto-generated method stub
		memberDao.update(dto);
	}
	
	@Override
	public List<MemberDTO> memberlist1() {
		// TODO Auto-generated method stub
		return memberDao.memberlist1();
	}
	@Override
	public List<MemberDTO> memberlist2() {
		// TODO Auto-generated method stub
		return memberDao.memberlist2();
	}
	
	@Override
	public void grantup(String id) {
		// TODO Auto-generated method stub
		memberDao.grantup(id);
	}
   	@Override
    	public void grantdown(String id) {
    	// TODO Auto-generated method stub
    	memberDao.grantdown(id);
    }
     @Override
     public void deletemember(String id) {
     // TODO Auto-generated method stub
     memberDao.deletemember(id);
    }


 	@Override
 	public void insertAmount(String id, int totalprice) {
 		memberDao.insertAmount(id,totalprice);
 	}


 	@Override
 	public int findAmount(String id) {
 		return memberDao.findAmount(id);
 	}
 	

     
}
