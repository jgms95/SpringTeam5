package com.naver.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.PickupDTO;
import kr.co.service.BookSaleService;
import kr.co.service.PickupService;

@Controller
@RequestMapping("pickup")
public class PickupController {
	
	@Inject
	private PickupService pickupService;
	@Inject
	private BookSaleService bService;
	/* 장바구니목록 */
	@RequestMapping(value = "/pickupList/{id}", method = RequestMethod.GET)
	public String pickupList(Model model, @PathVariable("id") String id) {
		//장바구니 개수		
		int cart = bService.cart(id);
		System.out.println(cart);
		model.addAttribute("cart", cart);
		//장바구니개수		
		List<PickupDTO> pickupList = pickupService.pickupList(id);

		model.addAttribute("pickupList", pickupList);

		return "pickup/pickupList";
	}

	/* 체크박스전체삭제 */
	@ResponseBody
	@RequestMapping(value = "/pickupDelete", method = RequestMethod.POST)
	public String pickupDelete2(@RequestParam(value = "chBox[]") List<String> chArr, Model model, HttpSession session,
			PickupDTO dto, String id) {
		if (session == null) {
			return "/member/login";
		} else {
			if (id.length() < 1) {
				return "/member/login";
			}
		}

		int pno = 0;

		for (String i : chArr) {
			pno = Integer.parseInt(i);
			dto.setPno(pno);
			pickupService.pickupDelete2(dto);
		}
		return "";

	}

	/* 개별삭제 */
	@RequestMapping(value = "/pickupDelete/{pno}", method = RequestMethod.GET)
	public String pickupDelete(@PathVariable("pno") int pno, String id, HttpSession session) {
		if (session == null) {
			return "/member/login";
		} else {
			if (id.length() < 1) {
				return "/member/login";
			}
		}
		pickupService.pickupDelete(pno);

		return "redirect:/pickup/pickupList/" + id;// 주소줄에 유저 아이디 필요 }
	}

	/* 수량변경 */
	@RequestMapping(value = "/pickupUpdate/{pno}/{pcs}", method = RequestMethod.GET)
	public String pickupUpdate(@PathVariable("pno") int pno, @PathVariable("pcs") int pcs, String id, PickupDTO dto,
			Model model) {

		pickupService.pickupUpdate(dto);

		return "redirect:/pickup/pickupList/" + id;
	}

	@ResponseBody
	@RequestMapping(value = "/pickupInsert", method = RequestMethod.POST)
	public void pickupInsert(PickupDTO dto) {
		
		pickupService.pickupInsert(dto);
		
	}
}