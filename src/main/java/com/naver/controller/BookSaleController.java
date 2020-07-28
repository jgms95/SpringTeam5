package com.naver.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.ItemDTO;
import kr.co.domain.PageTO;
import kr.co.service.BookSaleService;



@Controller
@RequestMapping("booksale")
public class BookSaleController {
	@Inject
	private BookSaleService bService;
	
	
	
@RequestMapping(value = "/insert", method = RequestMethod.GET)
public void insert() {
}
	
	
//	@RequestMapping(value= "/list" ,method = RequestMethod.GET)
//	public String list(Model model) {
//	
//		
//		List<ItemDTO> list = bService.list();
//		
//		model.addAttribute("list", list);
//		return "/booksale/list";
//	}
//	
	
	/*
	 
    @RequestMapping(value= "/list" ,method = RequestMethod.GET)
	public void list(Model model) {
	
		List<ItemDTO> list = bService.list();
		model.addAttribute("list", list);
		
	}
	  
	*/

	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert( MultipartHttpServletRequest multi) {
	    
    
		String root = multi.getSession().getServletContext().getRealPath("/");

		String path = root+"resources/img/";
		String id = multi.getParameter("id");
		String newFileName = ""; // 업로드 되는 파일명
	    String ititle = multi.getParameter("ititle");
	    String iwriter = multi.getParameter("iwriter");
	    String publishDay = multi.getParameter("publishDay");
	    String publisher = multi.getParameter("publisher");
	    String cateCode = multi.getParameter("cateCode");
	    String content = multi.getParameter("content");
	    String sprice = multi.getParameter("price");
	    String spercent = multi.getParameter("percent");
	    String sstock = multi.getParameter("stock");
	    String prolog = multi.getParameter("prolog");
	   
	    int price =0;	    
	    if(sprice!=null) {
	    	price = Integer.parseInt(sprice);
	    }
	  
	    int a = price;
	 
	    int stock = 0;
	    if(sstock!=null) {
	    	stock = Integer.parseInt(sstock);
	    }
	    
	    
	    int percent = 0;
	    if(spercent!=null) {
	    	percent = Integer.parseInt(spercent);
	    }
	    	     
	    
	  
	    
	 
	    int discountedPrice = (a*(100-percent))/100; 

		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		ItemDTO dto = null;
				
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()){
			String uploadFile = files.next();
						
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
		
			newFileName = System.currentTimeMillis()+"."
					+fileName.substring(fileName.lastIndexOf(".")+1);
			dto = new ItemDTO(0, ititle, iwriter, publishDay, publisher, cateCode, newFileName, content, price, 0, null, percent, discountedPrice, stock, id, prolog);
			System.out.println(dto);
			try {
				mFile.transferTo(new File(path+newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
	  
		bService.insert(dto);
		
		
	
		return "redirect:/booksale/list";
	}
	
	@RequestMapping(value="/delete/{ino}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable("ino") int ino) {
		bService.delete(ino);
	
		return "redirect:/booksale/list";
	}
	
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, String curPage) {

		int page = -1;
		if (curPage != null) {
//			└페이지방문시 null인 경우가 많으므로 (속도개선)
			page = Integer.parseInt(curPage);
		} else {
			page = 1;
		}
		
		PageTO<ItemDTO> to = new PageTO<ItemDTO>(page);
		List<ItemDTO> list = new ArrayList<ItemDTO>();
		List<ItemDTO> best = new ArrayList<ItemDTO>();
//		List<BoardVO> list = bService.list();		
		to = bService.list(to);		
		
		
		list = bService.best(); 
				
		
		 if(list.size()>6) {
		      System.out.println(list.get(1));   
		      
		      best.add(list.get(0));
		      best.add(list.get(1));
		      best.add(list.get(2));
		      best.add(list.get(3));
		      best.add(list.get(4));
		      best.add(list.get(5));
		      
		            }
			model.addAttribute("best", best);
			
	
			model.addAttribute("to", to);
			model.addAttribute("list", to.getList());
			
		
	}
	
//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public String update(BoardVO vo) {
//		bService.update(vo);
//		return "redirect:/board/read/"+vo.getBno();
//	}
//	
	@RequestMapping(value = "/update/{ino}", method = RequestMethod.GET)
	public String update(@PathVariable("ino") int ino, Model model) {
		ItemDTO dto = bService.updateui(ino);
		model.addAttribute("dto", dto);
		
		return "booksale/update";
	}	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update( MultipartHttpServletRequest multi) {
	    
	
		String root = multi.getSession().getServletContext().getRealPath("/");

		String path = root+"resources/img/";
	
		String newFileName = ""; // 업로드 되는 파일명
		String sino = multi.getParameter("ino");
		
		int ino = 0;
		if(sino!=null) {
			ino = Integer.parseInt(sino);
		}
		
	    String ititle = multi.getParameter("ititle");
	    String iwriter = multi.getParameter("iwriter");
	    String publishDay = multi.getParameter("publishDay");
	    String publisher = multi.getParameter("publisher");
	    String cateCode = multi.getParameter("cateCode");
	    String content = multi.getParameter("content");
	    String sprice = multi.getParameter("price");
	    String spercent = multi.getParameter("percent");
	    String sstock = multi.getParameter("stock");
	    String prolog = multi.getParameter("prolog");
	    int percent = 0;
	    if(spercent!=null) {
	    	percent = Integer.parseInt(spercent);
	    }
	    
	    
	    int stock = 0;
	    if(sstock!=null) {
	    	stock = Integer.parseInt(sstock);
	    }
	 
	    
	    int price =0;
	    
	    if(sprice!=null) {
	    	price = Integer.parseInt(sprice);
	    }
	    int a = price;
	    int discountedPrice = (a*(100-percent))/100; 
	    System.out.println(discountedPrice + "dis업데이트");
	
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		ItemDTO dto = null;
				
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()){
			String uploadFile = files.next();
						
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
		
			newFileName = System.currentTimeMillis()+"."
					+fileName.substring(fileName.lastIndexOf(".")+1);
			dto = new ItemDTO(ino, ititle, iwriter, publishDay, publisher, cateCode, newFileName, content, price, 0, null, percent, discountedPrice, stock, null, prolog);
					System.out.println(dto);
			try {
				mFile.transferTo(new File(path+newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	  
		bService.update(dto);
		
		
	
		return "redirect:/booksale/list";
	}
	@RequestMapping(value = "/searchlist")
	public void searchlist(Model model, String cataCode, String curPage) {
		
		System.out.println(cataCode);
		int page = -1;
		if (curPage != null) {

			page = Integer.parseInt(curPage);
		} else {
			page = 1;
		}
		PageTO<ItemDTO> to = new PageTO<ItemDTO>(page);
		
		to = bService.searchlist(to, cataCode);
		System.out.println(to.getAmount());
		//List<ItemDTO> list = bService.searchlist(cataCode);
		model.addAttribute("to", to);
		model.addAttribute("list", to.getList());
		model.addAttribute("cataCode", cataCode);
		
		
	}
	@RequestMapping(value = "/search")
	   public void search(Model model, String searchType, String keyword, String curPage) {
	      
	      System.out.println(searchType  + " : " + keyword);
	  	int page = -1;
		if (curPage != null) {

			page = Integer.parseInt(curPage);
		} else {
			page = 1;
		}
	      PageTO<ItemDTO> to = new PageTO<ItemDTO>(page);
	      List<ItemDTO> list = new ArrayList<ItemDTO>();
	      if(searchType.equals("all")) {
	  
	         to = bService.searchAll(keyword, to);
	         
	      	 System.out.println(to.getAmount());
	    	 System.out.println(to.getStartNum());
	    	 System.out.println(to.getStopPageNum());
	    	 model.addAttribute("to", to);
	         model.addAttribute("list", to.getList());
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("keyword", keyword);
	         
	      }
	      
	      else if (searchType.equals("ititle") ||searchType.equals("iwriter")) {
	    	  System.out.println(searchType +"ititle 로 검색");
			to = bService.searchTitle(keyword, to, searchType);
			System.out.println(to.getAmount());
	    	 System.out.println(to.getStartNum());
	    	 System.out.println(to.getStopPageNum());
	    	 model.addAttribute("to", to);
	         model.addAttribute("list", to.getList());
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("keyword", keyword);
			
		 }
	      else {
	         System.out.println("왜일루가냐");
	      }
	      
	      
	     }
	@RequestMapping(value = "/like/{ino}", method = RequestMethod.GET)
	public String like(@PathVariable("ino") int ino, Model model) {
		bService.increaseLike(ino);
		System.out.println(ino);
		return "redirect:/booksale/list";
	}	
}
	