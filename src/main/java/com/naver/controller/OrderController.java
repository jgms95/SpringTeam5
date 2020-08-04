package com.naver.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberDTO;
import kr.co.domain.PickupDTO;
import kr.co.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Inject
	private OrderService Oservice;
	
	@RequestMapping(value = "/orderForm/{id}", method = RequestMethod.GET)
	public String orderForm(@PathVariable("id") String id, Model model) {
		
		MemberDTO mRead = Oservice.mRead(id);
		List<PickupDTO> pList = Oservice.pList(id);
		model.addAttribute("mRead", mRead);
		model.addAttribute("pList", pList);
		
		return "order/orderForm";
	}
	
//	@RequestMapping(value = "/order/{id}", method = RequestMethod.GET)
//	public String order(Model model, @PathVariable("id") String id) {
//		Oservice.order();
//		
//		return "order/order";
//	}
//	

}
