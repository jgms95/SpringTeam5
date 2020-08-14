package com.naver.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import kr.co.domain.PickupDTO;
import kr.co.domain.RecommendDTO;
import kr.co.domain.ReviewVO;
import kr.co.service.BookSaleService;
import kr.co.service.PickupService;



@Controller
@RequestMapping("booksale")
public class BookSaleController {
	@Inject
	private BookSaleService bService;
	
	@Inject
	private PickupService pickupService;
	
@RequestMapping(value = "/insert/{id}", method = RequestMethod.GET)
public String insert(@PathVariable("id") String id, Model model) {
	
	model.addAttribute("id", id);
	return "/booksale/insert";
	
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
	    
		System.out.println("insert 시작");
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
	    String TC = multi.getParameter("TC");
	    String iwriterInfo = multi.getParameter("iwriterInfo");
	    System.out.println(iwriterInfo);
	    System.out.println(iwriter+": 저자 ");
	    String bookInfo = multi.getParameter("bookInfo");
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
	    	     
	    int totalPage = 0;
	    
	    String stotalpage = multi.getParameter("totalpage");
	    System.out.println(stotalpage);
	    if(stotalpage!=null) {
	    	totalPage=Integer.parseInt(stotalpage);
	    }
	  
	    System.out.println(stotalpage);
	 
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
			
			dto = new ItemDTO(0, ititle, iwriterInfo, publishDay, publisher, cateCode, newFileName, content, price, 0, null, percent, discountedPrice, stock, id, prolog, 0, TC, totalPage, null, bookInfo, iwriterInfo);
			System.out.println(dto);
			try {
				mFile.transferTo(new File(path+newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		 
		
	  
		bService.insert(dto);
		
		
	
		return "redirect:/booksale/list?id="+id;
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete( int ino, String id, String ititle) {
		System.out.println(ititle);
		
		bService.deleteRecommend(ititle);
		
		bService.delete(ino);
		
	
		return "redirect:/booksale/list?id="+id;
	}
	
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, String curPage, String id) {
	
		int page = -1;
		if (curPage != null) {
//			└페이지방문시 null인 경우가 많으므로 (속도개선)
			page = Integer.parseInt(curPage);
		} else {
			page = 1;
		}
		
		
		PickupDTO pickup = new PickupDTO();
		PageTO<ItemDTO> to = new PageTO<ItemDTO>(page);
		List<ItemDTO> list = new ArrayList<ItemDTO>();
		List<ItemDTO> best = new ArrayList<ItemDTO>();
//		List<BoardVO> list = bService.list();		
		to = bService.list(to);		
	
		
		list = bService.best(); 
		//장바구니 개수
		
	
		int cart = bService.cart(id);
		
		
		model.addAttribute("cart", cart);
		//장바구니개수
		 if(list.size()>6) {
		        
		      
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
			
			model.addAttribute("pickup", pickup);
		
	}
	
//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public String update(BoardVO vo) {
//		bService.update(vo);
//		return "redirect:/board/read/"+vo.getBno();
//	}
//	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(int ino, Model model, String id) {
		ItemDTO dto = bService.updateui(ino);
		model.addAttribute("dto", dto);
		
		return "booksale/update?id="+id;
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
		String id = multi.getParameter("id");
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
				
		
			try {
				mFile.transferTo(new File(path+newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	  
		bService.update(dto);
		
		
	
		return "redirect:/booksale/list?id="+id;
	}
	@RequestMapping(value = "/searchlist")
	public void searchlist(Model model, String cataCode, String curPage, String id) {
		
		
		int page = -1;
		if (curPage != null) {

			page = Integer.parseInt(curPage);
		} else {
			page = 1;
		}
		PageTO<ItemDTO> to = new PageTO<ItemDTO>(page);
		List<ItemDTO> list = new ArrayList<ItemDTO>();
		List<ItemDTO> best = new ArrayList<ItemDTO>();

		list = bService.cateBest(cataCode); 
		//장바구니 개수		
		int cart = bService.cart(id);
		
		model.addAttribute("cart", cart);
		//장바구니개수		
		
		 if(list.size()>6) {
		       
		      
		      best.add(list.get(0));
		      best.add(list.get(1));
		      best.add(list.get(2));
		      best.add(list.get(3));
		      best.add(list.get(4));
		      best.add(list.get(5));
		      
		            }
			model.addAttribute("best", best);
			
	
		to = bService.searchlist(to, cataCode);
		
		//List<ItemDTO> list = bService.searchlist(cataCode);
		model.addAttribute("to", to);
		model.addAttribute("list", to.getList());
		model.addAttribute("cataCode", cataCode);
		
	
	}
	@RequestMapping(value = "/search")
	   public void search(Model model, String searchType, String keyword, String curPage, String id) {
			System.out.println(id);
	

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
	     	//장바구니 개수
				
	         System.out.println("시작");
	         
				int cart = bService.cart(id);
				System.out.println(cart+"개");
				
				model.addAttribute("cart", cart);
			
				//장바구니개수
	    
	     	System.out.println(cart+"개");
	    	 model.addAttribute("to", to);
	         model.addAttribute("list", to.getList());
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("keyword", keyword);
	         
	      }
	      
	      else if (searchType.equals("ititle") ||searchType.equals("iwriter")) {
	    	 
			to = bService.searchTitle(keyword, to, searchType);
			//장바구니 개수
			
			
			int cart = bService.cart(id);
			System.out.println(cart+"개");
			
			model.addAttribute("cart", cart);
		
			//장바구니개수
	    	 model.addAttribute("to", to);
	         model.addAttribute("list", to.getList());
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("keyword", keyword);
			
		 }
	      else {
	         System.out.println("왜일루가냐");
	      }
	      
	      
	     }
	@RequestMapping(value = "/like", method = RequestMethod.GET)
	public String like(int ino, String id, Model model) {
		System.out.println(ino + " ino ??");
		bService.increaseLike(ino);
		System.out.println(ino);
		return "redirect:/booksale/list?id="+id;
	}
	
	@ResponseBody
	@RequestMapping(value = "/pickupInsert", method = RequestMethod.POST)
	public int pickupInsert(PickupDTO pickupDTO, int ino, ItemDTO itemDTO) {
		int count = bService.countOfIno(ino, pickupDTO.getId());
		
		int pcsCount = bService.iwantpcs(ino, pickupDTO.getId());
		System.out.println("나와라");
		int getstock = itemDTO.getStock();
		System.out.println(getstock);
		System.out.println(pcsCount);
		
		if(pcsCount < getstock) {		
			if(count == 0) {
				bService.pickupInsert(pickupDTO);					
			}
			
			bService.increasePcs(ino, pickupDTO.getId());
		}
		return pcsCount;	
		}

	@RequestMapping(value = "/insertrecommend", method = RequestMethod.GET)
	public String insertreuicommend(){
		return "/booksale/insertrecommend";
		
	}
	
	@RequestMapping(value = "insertrecommend", method = RequestMethod.POST)
	public String insertrecommend(RecommendDTO dto) {
		
		bService.insertRecommend(dto);
		
		
	 
		return "redirect:/";
		
	}
	
	
	// detail 한번해봄
	
	@RequestMapping(value = "/view")
	public String detail(String ino, Model model) {
		int sino = Integer.parseInt(ino);
		ItemDTO dto = bService.itemDetail(sino);		
		
		model.addAttribute("dto", dto);
		return "/booksale/view";	
		
	}
	
	@RequestMapping(value="/itemDetail/{ino}")
	public String itemDetail(Model model, @PathVariable("ino")int ino) throws Exception {		

		
		ItemDTO dto = bService.itemDetail(ino);		
		
	
		model.addAttribute("dto", dto);
		List<ReviewVO> reviews = bService.getReviews(ino);
		model.addAttribute("reviews",reviews);
						
		return "/booksale/itemDetail";	
		
		
	}
	@RequestMapping(value="/deleteReviews", method=RequestMethod.POST)
	public String deleteReviews(ReviewVO vo, HttpSession session) {
		
		if (session == null) {
			return "/member/login";
		} else {
			if (vo.getId().length() < 1) {
				return "/member/login";
			}
		}
		
		bService.deleteReviews(vo.getRno());
		
		return "redirect:/booksale/itemDetail/"+vo.getIno();
	}
	
	@RequestMapping(value="/updateReviews", method = RequestMethod.POST)
	public String updateReviews(ReviewVO vo, HttpSession session) {
		
		if (session == null) {
			return "/member/login";
		} else {
			if (vo.getId().length() < 1) {
				return "/member/login";
			}
		}
		
		bService.updateReviews(vo);
		
		return "redirect:/booksale/itemDetail/"+vo.getIno();
	}
	
	
	@RequestMapping(value = "/reviews", method = RequestMethod.POST)
	public String reviews(HttpSession session, ReviewVO vo) {
		
		if (session == null) {
			return "/member/login";
		} else {
			if (vo.getId().length() < 1) {
				return "/member/login";
			}
		}
		
			bService.insertReview(vo);		

	return "redirect:/booksale/itemDetail/"+vo.getIno();	
	}
	

@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)

public void favicon( HttpServletRequest request, HttpServletResponse reponse ) {

try {

  reponse.sendRedirect("/resources/favicon.ico");

} catch (IOException e) {

  e.printStackTrace();

}

}}
	

	