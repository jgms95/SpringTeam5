package com.naver.controller;









import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import kr.co.domain.NoticeDTO;
import kr.co.domain.PageTO;
import kr.co.service.MemberService;
import kr.co.service.NoticeService;



@Controller
@RequestMapping("notice")

public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@Autowired
	private MemberService mService;
	
	

	@RequestMapping(value="/noticelist/{curPage}",method=RequestMethod.GET)
	public String noticelist(Model model, @PathVariable("curPage") String curPage, String id) {
		int page = -1;
		if(curPage!=null){
		page = Integer.parseInt(curPage);
		}else{
		page = 1;
		}
	
		PageTO<NoticeDTO> to = new PageTO<NoticeDTO>(page);
		String authority = mService.findAuthority(id);
		
		to = nService.noticelist(to);
		model.addAttribute("authority",authority);
		model.addAttribute("to",to);
		model.addAttribute("list",to.getList());
		return "/notice/noticelist";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(HttpSession session, String id) {
		if (session == null) {
			return "/member/login";
			} else {
			if (id.length()<1) {
			return "/member/login";
			}
			}
		return "/notice/insert";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Model model, MultipartHttpServletRequest mhsq, NoticeDTO dto) throws IllegalStateException, IOException {
		
		int nno = nService.insert(dto);
		
		String root = mhsq.getSession().getServletContext().getRealPath("/");
		String realFolder = root+"resources/noticefiles/";
		File dir = new File(realFolder);
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }
	    
	        // 넘어온 파일을 리스트로 저장
	        List<MultipartFile> multifiles = mhsq.getFiles("uploadFile");
	        if (multifiles.size() == 1 && multifiles.get(0).getOriginalFilename().equals("")) {
	        } else {
	            for (int i = 0; i < multifiles.size(); i++) {
	                // 파일 중복명 처리
	                String genId = UUID.randomUUID().toString();
	                // 본래 파일명
	                String originalfileName = multifiles.get(i).getOriginalFilename();
	                String saveFileName = genId + "_" + originalfileName;
	                // 저장되는 파일 이름
	                String savePath = realFolder + saveFileName; // 저장 될 파일 경로
	                long fileSize = multifiles.get(i).getSize(); // 파일 사이즈
	                multifiles.get(i).transferTo(new File(savePath)); // 파일 저장
	                System.out.println(saveFileName);
	                nService.fileUpload(originalfileName, saveFileName,fileSize,nno);
	                
	                
	            }
	        }
	
		model.addAttribute("id",dto.getId());
		return "redirect:/notice/noticelist/1";
	}
	
	
	
	
	
	

}
