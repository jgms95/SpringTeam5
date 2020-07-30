package com.naver.controller;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.co.domain.PageTO;
import kr.co.domain.QnaDTO;
import kr.co.service.MemberService;
import kr.co.service.QnaService;

@Controller
@RequestMapping("qna")
public class QnaController {
	
	@Autowired
	private QnaService qservice;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value = "/allqnalist/{curPage}", method = RequestMethod.GET)
	public String allqnalist(Model model, @PathVariable("curPage") String curPage,String ino, String category) {
		if(category==null) {
			category = "book";
		}
		
		int page = -1;
		if (curPage != null) {
			page = Integer.parseInt(curPage);
		} else {
			page = 1;
		}

		PageTO<QnaDTO> to = new PageTO<QnaDTO>(page);
		to = qservice.allqnalist(to,ino,category);	
	
		model.addAttribute("to", to);
		model.addAttribute("list", to.getList());
		model.addAttribute("category",category);
		if(ino!=null && ino!="all") {
		model.addAttribute("ino",ino);
		}
		return "/qna/allqnalist";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(HttpSession session, String id) {
		if (session == null) {
			return "/member/login";
		} else {
			if (id.length() < 1) {
				return "/member/login";
			}
		}
		
		return "/qna/insert";
	}

}
