package kr.co.service;

import java.util.List;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

public interface MemberService {

	void insert(MemberDTO dto);

	MemberDTO loginpost(LoginDTO login);

	int checkId(MemberDTO dto);

	MemberDTO findId(MemberDTO dto);

	MemberDTO findPw(MemberDTO dto);

	String findAuthority(String id);

	MemberDTO readId(String id);
	
	MemberDTO updateui(String id);

	String checkPw(String id);

	void update(MemberDTO dto);

	

	List<MemberDTO> memberlist1();

	List<MemberDTO> memberlist2();

	void grantup(String id);

	void grantdown(String id);

	void deletemember(String id);


	void insertAmount(String id, int totalprice);

	int findAmount(String id);

}
