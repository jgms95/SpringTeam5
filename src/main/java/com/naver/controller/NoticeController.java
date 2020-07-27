package com.naver.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import kr.co.domain.NoticeFilesDTO;
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
	
	
	@RequestMapping(value="/read/{nno}",method=RequestMethod.GET)
	public String read(Model model, @PathVariable("nno") int nno, String id) {
		NoticeDTO dto = nService.read(nno);
		model.addAttribute("dto",dto);
		
		List<NoticeFilesDTO> filelist = nService.getFiles(nno);
		model.addAttribute("filelist",filelist);
		String authority = mService.findAuthority(id);
		model.addAttribute("authority",authority);
		
		return "/notice/read";
	}
	
	
	 @RequestMapping("/fileDownload")
	 public void fileDownload(HttpServletRequest hsq, HttpServletResponse rsp, String file_num) throws Exception{
	        
	        
	        String file_name = nService.getFileName(file_num);
	        String o_name = nService.getOrgFileName(file_num); 
	        
	        //웹사이트 루트디렉토리의 실제 디스크상의 경로 알아내기.
	        String root = hsq.getSession().getServletContext().getRealPath("/"); 
	        String fullPath = root+"resources/noticefiles/" + file_name;
	        File downloadFile = new File(fullPath);
	        
	       
	        rsp.setContentLength((int)downloadFile.length());        
	        //다운로드 창을 띄우기 위한 헤더 조작
	        rsp.setContentType("application/octet-stream; charset=utf-8");
	        rsp.setHeader("Content-Disposition", "attachment;filename=" + new String(o_name.getBytes(), "ISO8859_1"));   
	        rsp.setHeader("Content-Transfer-Encoding","binary");
	       
	        FileInputStream fin = new FileInputStream(downloadFile);
	        ServletOutputStream sout = rsp.getOutputStream();

	        byte[] buf = new byte[1024];
	        int size = -1;

	        while ((size = fin.read(buf, 0, buf.length)) != -1) {
	            sout.write(buf, 0, size);
	        }
	        fin.close();
	        sout.close();
	        
	    }
	    
	 
	 @RequestMapping(value="/delete",method=RequestMethod.GET)
	 public String delete(Model model, HttpServletRequest hsq, HttpSession session, int nno, String id) {
		 if (session == null) {
				return "/member/login";
				} else {
				if (id.length()<1) {
				return "/member/login";
				}
		}
		 
		 List<NoticeFilesDTO> filelist = nService.getFiles(nno);
		 String root = hsq.getSession().getServletContext().getRealPath("/"); 
		 System.out.println(root);
		 for(NoticeFilesDTO file : filelist) {
		     String fullPath = root+"resources/noticefiles/" + file.getFile_name();
		     File deleteFile = new File(fullPath);
		     deleteFile.delete();
		 }
		 
		 
		 nService.deleteNotice(nno);
		 model.addAttribute("id",id);
		 return "redirect:/notice/noticelist/1";
	 }
	
	

}
