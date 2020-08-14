package kr.co.ca;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.EventDTO;
import kr.co.domain.ItemDTO;
import kr.co.domain.NoticeDTO;
import kr.co.domain.PageTO;
import kr.co.domain.RecommendDTO;
import kr.co.service.BookSaleService;
import kr.co.service.EventService;
import kr.co.service.NoticeService;


@Controller
public class HomeController {
	@Inject
	private BookSaleService bService;
	@Inject
	private NoticeService nService;
	@Inject
	private EventService eService;
	
	
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String home(@PathVariable("id") String id ,Locale locale, Model model) {
		List<ItemDTO> list = new ArrayList<ItemDTO>();
		List<ItemDTO> best = new ArrayList<ItemDTO>();

		list = bService.best(); 
		 if(list.size()>3) {
		        
		      
		      best.add(list.get(0));
		      best.add(list.get(1));
		      best.add(list.get(2));
		      best.add(list.get(3));
		      best.add(list.get(4));
		      best.add(list.get(5));
		      
		
		      
		            }
	
			model.addAttribute("best", best);	
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		//베스트셀러
		
		//판매자 추천
	
		List<RecommendDTO> list2 = new ArrayList<RecommendDTO>();
		List<RecommendDTO> recommend = new ArrayList<RecommendDTO>();
		list2 = bService.recommend(); 
		 if(list2.size()>4) {
	
	
		        
		  RecommendDTO dto = list2.get(0);    
		  list = bService.recommendList(list2.get(0).getBookName());
		  dto.setIno(list.get(0).getIno());    
		  dto.setFileName(list.get(0).getFilename());		  
		  recommend.add(dto);
		  
		  dto = list2.get(1);    
		  list = bService.recommendList(list2.get(1).getBookName());
		  dto.setIno(list.get(1).getIno());    
		  dto.setFileName(list.get(1).getFilename());
		  recommend.add(dto);
		  
		  dto = list2.get(2);    
		  list = bService.recommendList(list2.get(2).getBookName());
		  dto.setIno(list.get(2).getIno());    
		  dto.setFileName(list.get(2).getFilename());
		  recommend.add(dto);
		  
		  dto = list2.get(3);    
		  list = bService.recommendList(list2.get(3).getBookName());
		  dto.setIno(list.get(3).getIno());    
		  dto.setFileName(list.get(3).getFilename());
		  recommend.add(dto);
		  
		  dto = list2.get(4);    
		  list = bService.recommendList(list2.get(4).getBookName());
		  dto.setIno(list.get(4).getIno());    
		  dto.setFileName(list.get(4).getFilename());
		  recommend.add(dto);

		   

		  
		  model.addAttribute("recommend", recommend);	
		            }
		 
	     	//장바구니 개수
			

         
			int cart = bService.cart(id);
			
			
			model.addAttribute("cart", cart);
		
			//장바구니개수
			
		      int page = 1;
			    
			   

		      PageTO<NoticeDTO> to = new PageTO<NoticeDTO>(page);
		     

		      to = nService.noticelist(to);
		
		      model.addAttribute("to", to);
		      model.addAttribute("list", to.getList());
		      
		      List<EventDTO> list3 =  eService.getEvent();
		      EventDTO dto=null;
		      List<EventDTO> event = null;
		      
		      System.out.println(list3.get(0).getFilename());
		      System.out.println(list3.get(0).getContent());
		      System.out.println(list3.get(0).getEno());
		      System.out.println(list3.get(0).getTitle());
		
		      
		      model.addAttribute("event", list3);
		
		return "main";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<ItemDTO> list = new ArrayList<ItemDTO>();
		List<ItemDTO> best = new ArrayList<ItemDTO>();
	
		list = bService.best(); 
		 if(list.size()>3) {
		        
		      
		      best.add(list.get(0));
		      best.add(list.get(1));
		      best.add(list.get(2));
		      best.add(list.get(3));
		      best.add(list.get(4));
		      best.add(list.get(5));
		      
		
		      
		            }
	
			model.addAttribute("best", best);	
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		//베스트셀러
		
		//판매자 추천
	
		List<RecommendDTO> list2 = new ArrayList<RecommendDTO>();
		List<RecommendDTO> recommend = new ArrayList<RecommendDTO>();
		list2 = bService.recommend(); 
		 if(list2.size()>6) {
	
	
		        
		  RecommendDTO dto = list2.get(0);    
		  list = bService.recommendList(list2.get(0).getBookName());
		  dto.setIno(list.get(0).getIno());    
		  dto.setFileName(list.get(0).getFilename());		  
		  recommend.add(dto);
		  
		  dto = list2.get(1);    
		  list = bService.recommendList(list2.get(1).getBookName());
		  dto.setIno(list.get(1).getIno());    
		  dto.setFileName(list.get(1).getFilename());
		  recommend.add(dto);
		  
		  dto = list2.get(2);    
		  list = bService.recommendList(list2.get(2).getBookName());
		  dto.setIno(list.get(2).getIno());    
		  dto.setFileName(list.get(2).getFilename());
		  recommend.add(dto); 
		  
		
		  
		  dto = list2.get(4);    
		  list = bService.recommendList(list2.get(4).getBookName());
		  dto.setIno(list.get(4).getIno());    
		  dto.setFileName(list.get(4).getFilename());
		  recommend.add(dto);
		  
		  dto = list2.get(5);    
		  list = bService.recommendList(list2.get(5).getBookName());
		  dto.setIno(list.get(5).getIno());    
		  dto.setFileName(list.get(5).getFilename());
		  recommend.add(dto);
		   
		  dto = list2.get(6);    
		  list = bService.recommendList(list2.get(6).getBookName());
		  dto.setIno(list.get(6).getIno());    
		  dto.setFileName(list.get(6).getFilename());
		  recommend.add(dto);
		  
		  model.addAttribute("recommend", recommend);	
		            }
		 
	      int page = 1;
	    
	   

	      PageTO<NoticeDTO> to = new PageTO<NoticeDTO>(page);
	     

	      to = nService.noticelist(to);
	     
	      model.addAttribute("to", to);
	      model.addAttribute("list", to.getList());
		 
	
		//이벤트
	      List<EventDTO> list3 =  eService.getEvent();
	      EventDTO dto=null;
	      List<EventDTO> event = null;
	      
	      System.out.println(list3.get(0).getFilename());
	      System.out.println(list3.get(0).getContent());
	      System.out.println(list3.get(0).getEno());
	      System.out.println(list3.get(0).getTitle());
	   
	      
	      model.addAttribute("event", list3);
		return "main";
	}
	
}
