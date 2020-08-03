package com.naver.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import kr.co.domain.PageTO;
import kr.co.domain.QnaDTO;
import kr.co.domain.QnaFileDTO;
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
	public String insert(HttpSession session, String id, String ino, Model model) {
		if (session == null) {
			return "/member/login";
		} else {
			if (id.length() < 1) {
				return "/member/login";
			}
		}
		model.addAttribute("ino",ino);
		return "/qna/insert";
	}
	
	@ResponseBody
	@RequestMapping(value="/findBook", method = RequestMethod.POST)
	public int findBook(String ititle) {
		int result = -1;
		int count = qservice.findBook(ititle);
		if(count>0) result = 1;
		return result;
	}
	
	
	//전체 Q&A 게시판 질문하기
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(QnaDTO dto,  MultipartHttpServletRequest mhsq, String currentino) throws IllegalStateException, IOException {
		
		
		
		
		//ino,filename item테이블에서 가져와서 dto에 넣어주기
		//수정-----------------
		int qno = qservice.insert(dto);
		
		

		String root = mhsq.getSession().getServletContext().getRealPath("/");
		String sRealFolder = root + "resources"+ File.separator+"qnafiles";
		String filepath = makeDayDir(sRealFolder) +  File.separator;
		File dir = new File(filepath);
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
				String savePath = filepath + saveFileName; // 저장 될 파일 경로
				multifiles.get(i).transferTo(new File(savePath)); // 파일 저장
				System.out.println(saveFileName);
				qservice.fileUpload(originalfileName, saveFileName, qno, filepath);

			}
		}
		
		
		return "redirect:/qna/allqnalist/1?ino="+currentino;
	}
	
	
	public static String makeDayDir(String sRealFolder) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1; //MONTH : 0~11
		int date = cal.get(Calendar.DATE);
		int[] arr ={year,month,date};
		
		String yearPath = File.separator + arr[0];
		String monthPath = yearPath + File.separator + String.format("%02d",arr[1]);
		String datePath = monthPath + File.separator + String.format("%02d",arr[2]);
		
		String[] paths = {yearPath,monthPath,datePath};
		
		
		File f = new File(sRealFolder + paths[2]);
		if(f.exists()) {
			return sRealFolder + paths[2]; 
		}
		for(String path : paths) {
			File dirPath = new File(sRealFolder + path);
			if(!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
		return sRealFolder + paths[2];
	}
	
	@RequestMapping(value = "/read/{qno}", method = RequestMethod.GET)
	public String read(Model model, @PathVariable("qno") int qno, String id, String ino) {
		QnaDTO dto = qservice.read(qno);
		model.addAttribute("dto", dto);

		List<QnaFileDTO> filelist = qservice.getFiles(qno);
		model.addAttribute("filelist", filelist);
		String authority = mService.findAuthority(id);
		model.addAttribute("authority", authority);
		model.addAttribute("currentIno",ino);

		return "/qna/read";
	}
	
	@RequestMapping("/fileDownload")
	public void fileDownload(HttpServletRequest hsq, HttpServletResponse rsp, String file_num) throws Exception {
		
		QnaFileDTO files = qservice.fileInfo(file_num);
		String file_name = files.getFile_name();
		String o_name = files.getO_name();
		String fullPath = files.getFilepath() + file_name;
		File downloadFile = new File(fullPath);

		rsp.setContentLength((int) downloadFile.length());
		// 다운로드 창을 띄우기 위한 헤더 조작
		rsp.setContentType("application/octet-stream; charset=utf-8");
		rsp.setHeader("Content-Disposition", "attachment;filename=" + new String(o_name.getBytes(), "ISO8859_1"));
		rsp.setHeader("Content-Transfer-Encoding", "binary");

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
	
	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String reply(HttpSession session, String id, int qno, Model model , String currentIno) {
		if (session == null) {
			return "/member/login";
		} else {
			if (id.length() < 1) {
				return "/member/login";
			}
		}
		QnaDTO orgdto = qservice.read(qno);
		model.addAttribute("currentIno",currentIno);
		model.addAttribute("orgdto", orgdto);
		return "/qna/reply";
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(QnaDTO dto,  MultipartHttpServletRequest mhsq, String currentIno,int orgqno) throws IllegalStateException, IOException {
		
		
		QnaDTO orgdto = qservice.read(orgqno);
		dto.setRepRoot(orgdto.getRepRoot());
		dto.setRepStep(orgdto.getRepStep()+1);
		dto.setRepIndent(orgdto.getRepIndent()+1);
		
		
		int qno = qservice.reply(dto,orgdto);
		
		

		String root = mhsq.getSession().getServletContext().getRealPath("/");
		String sRealFolder = root + "resources"+ File.separator+"qnafiles";
		String filepath = makeDayDir(sRealFolder) +  File.separator;
		File dir = new File(filepath);
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
				String savePath = filepath + saveFileName; // 저장 될 파일 경로
				multifiles.get(i).transferTo(new File(savePath)); // 파일 저장
				System.out.println(saveFileName);
				qservice.fileUpload(originalfileName, saveFileName, qno, filepath);

			}
		}
		
		
		return "redirect:/qna/allqnalist/1?ino="+currentIno;
	}

}
