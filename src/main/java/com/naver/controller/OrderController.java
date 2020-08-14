package com.naver.controller;



import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberDTO;
import kr.co.domain.OrderedListDTO;
import kr.co.domain.PickupDTO;
import kr.co.service.MemberService;
import kr.co.service.OrderService;
import kr.co.service.PickupService;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Inject
	private OrderService Oservice;
	
	@Inject
	private PickupService pickupService;
	
	@Inject
	private MemberService mService;
	
	@RequestMapping(value = "/orderForm", method = RequestMethod.POST)
	public String orderForm(String id, String totalPrice, Model model, HttpServletRequest request) {
		System.out.println(totalPrice);
		
		
		String[] checkArr = request.getParameterValues("items");
	
		MemberDTO mRead = Oservice.mRead(id);
		List<PickupDTO> pList = Oservice.pList(checkArr);

		model.addAttribute("mRead", mRead);
		model.addAttribute("pList", pList);

		model.addAttribute("totalprice",totalPrice);
		return "order/orderForm";
	}
	
	@RequestMapping(value = "/orderPayment/{id}", method = RequestMethod.GET)
	public String orderorderPayment(@PathVariable("id") String id, Model model) {
		
		
		
		return "order/orderPayment";
	}
	
	@RequestMapping(value = "/orderlist", method = RequestMethod.POST)
	public String orderList(OrderedListDTO dto, Model model, HttpServletRequest request, String totalprice) {
		

		
		String[] ititles= request.getParameterValues("ititles");
		String[] inoes= request.getParameterValues("inoes");
		String[] pcses= request.getParameterValues("pcses");
		String[] filenames = request.getParameterValues("filenames");
		String[] payPrices = request.getParameterValues("payPrices");
		for(int i=0; i<ititles.length;i++) {
			dto.setItitle(ititles[i]);
			dto.setIno(Integer.parseInt(inoes[i]));
			dto.setPcs(Integer.parseInt(pcses[i]));
			dto.setFilename(filenames[i]);
			dto.setPayPrice(Integer.parseInt(payPrices[i]));
			Oservice.insertOlist(dto);
			pickupService.deleteOrdered(inoes[i],dto.getId());
		}

		mService.insertAmount(dto.getId(),Integer.parseInt(totalprice));
		
		
		
		

		
		
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/orderInfo/{id}", method = RequestMethod.GET)
	public String orderInfo(@PathVariable("id") String id, Model model) {
		int purchasedAmount = mService.findAmount(id);
		System.out.println(purchasedAmount);
		List<OrderedListDTO> list = Oservice.orderedList(id);
		model.addAttribute("list",list);
		model.addAttribute("purchasedAmount", purchasedAmount);
		
		return "/order/orderlist";
	}
	
	
	
	
	
	
//	@RequestMapping(value = "/order/{id}", method = RequestMethod.GET)
//	public String order(Model model, @PathVariable("id") String id) {
//		Oservice.order();
	
//		return "order/order";
//	}


}
