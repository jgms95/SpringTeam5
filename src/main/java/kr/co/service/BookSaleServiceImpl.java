package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.domain.ItemDTO;
import kr.co.domain.PageTO;
import kr.co.domain.PickupDTO;
import kr.co.persistence.BookSaleDAO;

@Service
public class BookSaleServiceImpl implements BookSaleService {

	
	@Autowired
	private BookSaleDAO tDAO;
	
	@Override
	public void insert(ItemDTO dto) {
	  
		tDAO.insert(dto);
		// TODO Auto-generated method stub
		
	}@Override
	public List<ItemDTO> list() {
		// TODO Auto-generated method stub
		return tDAO.list();
	}
	@Override
	public void delete(int ino) {
		// TODO Auto-generated method stub
		tDAO.delete(ino);
	}@Override
	public PageTO<ItemDTO> list(PageTO<ItemDTO> to) {
		// TODO Auto-generated method stub
		return tDAO.list(to);
	}@Override
	public ItemDTO updateui(int ino) {
		// TODO Auto-generated method stub
		return tDAO.updateui(ino);
	}@Override
	public void update(ItemDTO dto) {
		
		tDAO.update(dto);
	}@Override
	public List<ItemDTO> searchlist(String cataCode) {
		// TODO Auto-generated method stub
		return tDAO.searchlist(cataCode);
	}

	@Override
	public PageTO<ItemDTO> searchlist(PageTO<ItemDTO> to, String cataCode) {
		// TODO Auto-generated method stub
		return tDAO.searchlist(to, cataCode);
	}
	@Override
	public PageTO<ItemDTO> searchAll(String keyword, PageTO<ItemDTO> to) {
		// TODO Auto-generated method stub
		return tDAO.searchAll(keyword, to);
	}
	@Override
	public PageTO<ItemDTO> searchTitle(String keyword, PageTO<ItemDTO> to, String searchType) {
	
		return tDAO.searchTitle(keyword, to, searchType);
	}
	@Override
	public void increaseLike(int ino) {
		// TODO Auto-generated method stub
		tDAO.increaseLike(ino);
	}
	@Override
	public List<ItemDTO> best() {
		// TODO Auto-generated method stub
		return tDAO.best();
	}
	@Override
	public void pickupInsert(PickupDTO pickupDTO) {
		
		tDAO.pickupInsert(pickupDTO);
	}
	@Override
	public int countOfIno(int ino) {
		
		return tDAO.countOfIno(ino);
	}
	@Override
	public void increasePcs(int ino) {
		tDAO.increasePcs(ino);
	}@Override
	public List<ItemDTO> cateBest(String cataCode) {
		// TODO Auto-generated method stub
		return tDAO.cateBest(cataCode);
	}
}
