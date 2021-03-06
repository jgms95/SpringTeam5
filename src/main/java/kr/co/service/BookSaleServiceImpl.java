package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.mail.imap.protocol.Item;

import kr.co.domain.ItemDTO;
import kr.co.domain.PageTO;
import kr.co.domain.PickupDTO;
import kr.co.domain.RecommendDTO;
import kr.co.domain.ReviewVO;
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
	public int countOfIno(int ino, String id) {
		
		return tDAO.countOfIno(ino,id);
	}
	@Override
	public void increasePcs(int ino, String id) {
		tDAO.increasePcs(ino, id);
	}@Override
	public List<ItemDTO> cateBest(String cataCode) {
		// TODO Auto-generated method stub
		return tDAO.cateBest(cataCode);
	}@Override
	public int cart(String id) {
		// TODO Auto-generated method stub
		return tDAO.cart(id);
	}
	@Override
	public int iwantpcs(int ino, String id) {
		
		return tDAO.iwantpcs(ino,id);
	}
	@Override
	public void insertRecommend(RecommendDTO dto) {
		// TODO Auto-generated method stub
		tDAO.insertRecommend(dto);
	}@Override
	public List<RecommendDTO> recommend() {
		// TODO Auto-generated method stub
		return tDAO.recommend();
	}
	@Override
	public List<ItemDTO> recommendList(String bookName) {
		// TODO Auto-generated method stub
		return tDAO.recommendList(bookName);
	}
	
	@Override
	public void deleteRecommend(String ititle) {
		// TODO Auto-generated method stub
		tDAO.deleteRecommend(ititle);
	}
	
@Override
	public ItemDTO itemDetail(int ino) {
		// TODO Auto-generated method stub
		return tDAO.itemDetail(ino);
	}
	
@Override
public void insertReview(ReviewVO vo) {
	// TODO Auto-generated method stub
	tDAO.insertReview(vo);
}
@Override
public List<ReviewVO> getReviews(int ino) {
	return tDAO.getReviews(ino);
}

@Override
public void updateReviews(ReviewVO vo) {
	// TODO Auto-generated method stub
	tDAO.updateReviews(vo);
}

@Override
public void deleteReviews(int rno) {
	// TODO Auto-generated method stub
	tDAO.deleteReviews(rno);
}

@Override
public ReviewVO updateUIReviews(int rno) {
	// TODO Auto-generated method stub
	return tDAO.updateUIReviews(rno);
}
}
