package com.naver.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.ItemDTO;
import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;
import kr.co.service.BookSaleService;
import kr.co.service.MemberService;

@Controller
@RequestMapping("member") // http://localhost:8089/member
@SessionAttributes({"login"})
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private BookSaleService bService;
	@Autowired
	private MailSender mailSender;
	 
	public void setMailSender(MailSender mailSender) {
	    this.mailSender = mailSender;
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}

	
	@RequestMapping(value="/loginpost", method=RequestMethod.POST)
	public String loginpost(LoginDTO login, Model model, HttpSession session) {
		
		MemberDTO dto = memberService.loginpost(login);
		if(dto!=null) {
			model.addAttribute("login",dto);
			return "redirect:/";
		}else {
			return "redirect:/member/login";
		}

	} 
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET) // http://localhost:8089/member/insert
	public String insert() {
		return "member/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberDTO dto) {
		System.out.println(dto.getId());
		int result = memberService.checkId(dto);
		try{
		if(result==0){
		memberService.insert(dto);
		}else{
		return "/member/insert";
		}
		}catch(Exception e){
			throw new RuntimeException();
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "member/findId";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/findId", produces="text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String findId(MemberDTO dto) {
		MemberDTO result = memberService.findId(dto);
		if(result==null) {
			return "해당 정보에 맞는 아이디가 없습니니다.";
		}
		return "아이디: "+ result.getId() + "입니다.";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/checkId", method = RequestMethod.POST)
	public int checkId(MemberDTO dto) {
		int result = memberService.checkId(dto);
		return result;
	}
	
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() {
		return "member/findPw";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findPw", produces="text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String findPw(MemberDTO dto) {
		MemberDTO result = memberService.findPw(dto);
		if(result==null) {
			return "해당 정보에 맞는 비밀번호가 없습니니다.";
		}
		sendPWEmail(result.getEmail(), result.getPw());
		return "회원님의 이메일로 비밀번호를 전송해드렸습니다.";
	}
	
	

	@RequestMapping(value="/emailAuth" , produces="text/plain;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth(HttpServletRequest request) {
	    
	    String email = request.getParameter("email");
	    String authNum = "";
	        
	    System.out.println(email);
	    authNum = randomNum();
	    //가입승인에 사용될 인증키 난수 발생    
	    sendEmail(email, authNum);
	    //이메일전송
	    String str = authNum;
	        
	        
	    return str;
	}
	    
	private String randomNum() {
	    StringBuffer buffer = new StringBuffer();
	        
	    for( int i = 0 ; i <= 6 ; i++) {
	        int n = (int)(Math.random()*10);
	        buffer.append(n);
	    }
	    return buffer.toString();
	}
	 
	public void sendEmail(String email , String authNum ) {
	    //이메일 발송 메소드
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("Spring Book 회원가입 안내 .[이메일 제목]");
	    mailMessage.setFrom("jgms95@naver.com");
	    mailMessage.setText("[이메일 내용]회원가입을 환영합니다. 인증번호를 확인해주세요. [ "+authNum+" ]");
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
	
	public void sendPWEmail(String email , String pw ) {
	    //이메일 발송 메소드
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("Spring Book 비밀번호 안내 .[이메일 제목]");
	    mailMessage.setFrom("jgms95@naver.com");
	    mailMessage.setText("[이메일 내용]회원님의 비밀번호는 [ "+pw+" ]입니다.");
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
	

	@RequestMapping(value = "/memberInfo")
	public void memberInfo(String id, Model model, String page) {
		//장바구니 개수
		System.out.println(page);
		
		int cart = bService.cart(id);
		
		
		model.addAttribute("cart", cart);
	
		//장바구니개수
	
		MemberDTO dto = memberService.readId(id);
		//생년월일
		String year = Integer.toString(dto.getRrNum1()).substring(0, 2)+"년";
		String month = Integer.toString(dto.getRrNum1()).substring(2, 4)+"월";
		String day = Integer.toString(dto.getRrNum1()).substring(4, 6)+"일";
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		//생년월일
		
		//권한
		String authority = "";
		if(dto.getAuthority().equals("02")) {
		authority="사장";
		}
		if(dto.getAuthority().equals("01")) {
			authority="운영자";
		}
		if(dto.getAuthority().equals("00")) {
			authority="일반회원";
		}
		model.addAttribute("authority", authority);
		//권한
		
		//등급
		String grade = "";
		if(dto.getPurchased_amount()<50000) {
			grade="실버회원";
		}
		if(dto.getPurchased_amount()>=50000 && dto.getPurchased_amount()<100000) {
			grade="골드회원";
		}
		if(dto.getPurchased_amount()>=100000 && dto.getPurchased_amount()<300000) {
			grade="플레티넘회원";
		}
		if(dto.getPurchased_amount()>=300000) {
			grade="VIP";
		}
		
		model.addAttribute("grade", grade);
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		
	}
	
	


	
	@ResponseBody
	@RequestMapping(value="/checkPw", method = RequestMethod.POST)
	public int checkPw(String pw, String id) {
		int result = 0 ;
		
		String tPw = memberService.checkPw(id);
		System.out.println(tPw);
		
		if(pw.equals(tPw)) {
			result = 0;
			
		}
		else {
			result = 1;
		}
		
		return result;
	}
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") String id, Model model) {
		System.out.println(id);
		MemberDTO dto = memberService.updateui(id);
		model.addAttribute("dto", dto);
		
		return "member/update";
	}	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update( MultipartHttpServletRequest multi) {
		String root = multi.getSession().getServletContext().getRealPath("/");

		String path = root+"resources/img/";
	
		String newFileName = ""; // 업로드 되는 파일명
		
		
		String id = multi.getParameter("id");
		String name = multi.getParameter("name");
		String pw = multi.getParameter("pw");
	    String USERADDR1 = multi.getParameter("userAddr1");
	    String USERADDR2 = multi.getParameter("userAddr2");
	    String USERADDR3 = multi.getParameter("userAddr3");
	    String phoneNum = multi.getParameter("phoneNum");
	    String email = multi.getParameter("email");
	    File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		System.out.println(phoneNum);
		MemberDTO dto = null;
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()){
			String uploadFile = files.next();
						
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
		
			newFileName = System.currentTimeMillis()+"."
					+fileName.substring(fileName.lastIndexOf(".")+1);
			dto = new MemberDTO(id, pw, name, 0, 0, 0, phoneNum, USERADDR1, USERADDR2, USERADDR3, null, null, 0, email, newFileName);		
			try {
				mFile.transferTo(new File(path+newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	  
		memberService.update(dto);
		
		return "redirect:/";
	}	
	
	@RequestMapping(value="/memberlist", method = RequestMethod.GET)
	public String memberlist(Model model, String authority) {
		
		if(authority.equals("02")) {
		List<MemberDTO> list01 = new ArrayList<MemberDTO>();
		list01 = memberService.memberlist1();
		model.addAttribute("list01", list01);
		
		List<MemberDTO> list02 = new ArrayList<MemberDTO>();
		list02 = memberService.memberlist2();
		model.addAttribute("list02", list02);
		model.addAttribute("authority", authority);
		}
		
		else {
			List<MemberDTO> list02 = new ArrayList<MemberDTO>();
			list02 = memberService.memberlist2();
			model.addAttribute("list02", list02);
			model.addAttribute("authority", authority);
		}
		return "/member/memberlist";
	}
	
	@RequestMapping(value = "/membergrant")
	public String membergrant(String id, String authority) {
		System.out.println(id+authority);
		
		if(authority.equals("01")) {
			memberService.grantup(id);
			
		}
		else {
			memberService.grantdown(id);
		}
		
		return "redirect:/member/memberlist?authority=02";
	}
	
	@RequestMapping(value = "/memberInfo2")
	public String memberInfo2(String id) {

		
		return "/memberInfo2?id="+id;
	}
	
	@RequestMapping(value = "/memberdelete")
	public String memberdelete(String id, String authority) {
		memberService.deletemember(id);
		
		return "redirect:/member/memberlist?authority=0"+ authority;
	}
	

	

	



}
