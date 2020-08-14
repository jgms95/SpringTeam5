package com.naver.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.EventCommentDTO;
import kr.co.domain.EventDTO;
import kr.co.domain.PageTO;
import kr.co.service.BookSaleService;
import kr.co.service.EventService;
import kr.co.service.MemberService;

@Controller
@RequestMapping("event")
public class EventController {
	
	@Inject
	private EventService eService;
	@Inject
	private BookSaleService bService;
	
	@Autowired
	   private MemberService mService;
	
	@RequestMapping(value = "/eventlist/{curPage}", method = RequestMethod.GET)
	public String eventlist(Model model, @PathVariable("curPage") String curPage, String id) {
		 int page = -1;
	      if (curPage != null) {
	         page = Integer.parseInt(curPage);
	      } else {
	         page = 1;
	      }
	  	//장바구니 개수
			
	  	
			int cart = bService.cart(id);
			
			
			model.addAttribute("cart", cart);
			//장바구니개수
	      
	     String authority = mService.findAuthority(id);
	     PageTO<EventDTO> to = new PageTO<EventDTO>(page);
	     to = eService.eventlist(to);
	    
	     model.addAttribute("to", to);
	     model.addAttribute("list", to.getList());
		 model.addAttribute("authority", authority);
		 return "/event/eventlist";
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
		return "/event/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Model model, MultipartHttpServletRequest multi, EventDTO dto)
			throws IllegalStateException, IOException {
		
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/event/";
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		MultipartFile mf = multi.getFile("firstImg");
		String firstImg = UUID.randomUUID().toString() + "_" + mf.getOriginalFilename();
		mf.transferTo(new File(path+firstImg));
		mf = multi.getFile("SecondImg");
		String SecondImg = UUID.randomUUID().toString() + "_" + mf.getOriginalFilename();
		mf.transferTo(new File(path+SecondImg));
		
		dto.setTitleImg(firstImg);
		dto.setFilename(SecondImg);
		
		eService.insert(dto);
		
		
		

		model.addAttribute("id",dto.getId());
		return "redirect:/event/eventlist/1";
	}
	
	@RequestMapping(value = "/read/{eno}", method = RequestMethod.GET)
	public String read(Model model, @PathVariable("eno") int eno, String id) {
		EventDTO dto = eService.read(eno);
		String authority = mService.findAuthority(id);
		List<EventCommentDTO> eventCommentlist = eService.readComment(eno);
		int count = eService.countComments(eno);
		model.addAttribute("dto", dto);
		model.addAttribute("authority", authority);
		model.addAttribute("eventCommentlist",eventCommentlist);
		model.addAttribute("count",count);
		return "/event/read";
	}
	
	
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest hsq, HttpSession session,EventDTO dto, String id) {
		if (session == null) {
			return "/member/login";
		} else {
			if (id.length() < 1) {
				return "/member/login";
			}
		}
		
		
		String root = hsq.getSession().getServletContext().getRealPath("/");
		String FilenamePath = root+"resources/event/"+dto.getFilename();
		File deleteFilename = new File(FilenamePath);
		deleteFilename.delete();
		String titleImgPath = root+"resources/event/"+dto.getTitleImg();
		File deleteTitleImg = new File(titleImgPath);
		deleteTitleImg.delete();
		
		eService.delete(dto.getEno());
	

		model.addAttribute("id", id);
		return "redirect:/event/eventlist/1";
	}
	
	@RequestMapping(value = "/finishevent", method = RequestMethod.GET)
	public String finishevent(Model model, HttpSession session,int eno, String id, String title) {
		if (session == null) {
			return "/member/login";
		} else {
			if (id.length() < 1) {
				return "/member/login";
			}
		}
		
		title += " (진행종료)";
		
		eService.finishevent(eno,title);
		

		model.addAttribute("id", id);
		return "redirect:/event/eventlist/1";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model, HttpSession session, int eno, String id) {
		if (session == null) {
			return "/member/login";
		} else {
			if (id.length() < 1) {
				return "/member/login";
			}
		}
		EventDTO dto = eService.read(eno);
		model.addAttribute("eno",eno);
		model.addAttribute("eventtitle",dto.getTitle());
		return "/event/update";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, MultipartHttpServletRequest multi, EventDTO dto)
			throws IllegalStateException, IOException {
		
		EventDTO beforeUpdateDto = eService.read(dto.getEno());
		
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/event/"; //새로운 이미지 업로드 폴더
		
		MultipartFile mf = multi.getFile("firstImg");
		if(mf.getSize()!=0) {
			String titleImgPath = root+"resources/event/"+beforeUpdateDto.getTitleImg(); //기존 이미지 경로
			File deleteTitleImg = new File(titleImgPath);
			deleteTitleImg.delete();
			String firstImg = UUID.randomUUID().toString() + "_" + mf.getOriginalFilename();
			mf.transferTo(new File(path+firstImg));
			dto.setTitleImg(firstImg);
		}else {
			dto.setTitleImg(beforeUpdateDto.getTitleImg());
		}
		
		mf = multi.getFile("SecondImg");
		if(mf.getSize()!=0) {
			String FilenamePath = root+"resources/event/"+beforeUpdateDto.getFilename();
			File deleteFilename = new File(FilenamePath);
			deleteFilename.delete();
			String SecondImg = UUID.randomUUID().toString() + "_" + mf.getOriginalFilename();
			mf.transferTo(new File(path+SecondImg));
			dto.setFilename(SecondImg);
		}else {
			dto.setFilename(beforeUpdateDto.getFilename());
		}
		
		
		
		eService.update(dto);
		
		
		

		
		model.addAttribute("id",dto.getId());
		return "redirect:/event/eventlist/1";
	}
	
	@RequestMapping(value = "/searchlist/{curPage}", method = RequestMethod.GET)
	public String searchlist(Model model, @PathVariable("curPage") String curPage, String id, String search) {
		int page = -1;
		if (curPage != null) {
			page = Integer.parseInt(curPage);
		} else {
			page = 1;
		}
		
		PageTO<EventDTO> to = new PageTO<EventDTO>(page);
		String authority = mService.findAuthority(id);

		to = eService.searchlist(to,search);
		model.addAttribute("authority", authority);
		model.addAttribute("to", to);
		model.addAttribute("list", to.getList());
		model.addAttribute("search",search);
		return "/event/searchlist";
	}
	
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public String insertComment(EventCommentDTO dto,HttpSession session,Model model) {
		if (session == null) {
			return "/member/login";
		} else {
			if (dto.getId().length() < 1) {
				return "/member/login";
			}
		}
		
		eService.insertComment(dto);

		model.addAttribute("id",dto.getId());
		return "redirect:/event/read/"+dto.getEno();
	}
	
	@RequestMapping(value = "/replycomment", method = RequestMethod.POST)
	public String replycomment(EventCommentDTO dto,HttpSession session,Model model, int orgNum) {
		if (session == null) {
			return "/member/login";
		} else {
			if (dto.getId().length() < 1) {
				return "/member/login";
			}
		}
		
		
		EventCommentDTO orgdto = eService.orgComment(orgNum);
		dto.setRepStep(orgdto.getRepStep()+1);
		dto.setRepIndent(orgdto.getRepIndent()+1);
		dto.setRepRoot(orgdto.getRepRoot());
		
		eService.insertReply(dto);

		model.addAttribute("id",dto.getId());
		return "redirect:/event/read/"+dto.getEno();
	}
	
	@RequestMapping(value = "/updateComment", method = RequestMethod.POST)
	public String updateComment(EventCommentDTO dto,HttpSession session,Model model) {
		if (session == null) {
			return "/member/login";
		} else {
			if (dto.getId().length() < 1) {
				return "/member/login";
			}
		}
		
		
		eService.updateComment(dto);

		model.addAttribute("id",dto.getId());
		return "redirect:/event/read/"+dto.getEno();
	}
	
	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	public String deleteComment(EventCommentDTO dto,HttpSession session,Model model) {
		if (session == null) {
			return "/member/login";
		} else {
			if (dto.getId().length() < 1) {
				return "/member/login";
			}
		}
		
		eService.deleteComment(dto);

		model.addAttribute("id",dto.getId());
		return "redirect:/event/read/"+dto.getEno();
	}


	
	
}
