package kr.co.persistence;

import java.util.List;


import kr.co.domain.ItemDTO;
import kr.co.domain.PageTO;
import kr.co.domain.PickupDTO;
import kr.co.domain.RecommendDTO;
import kr.co.domain.ReviewVO;

public interface BookSaleDAO {

	void insert(ItemDTO dto);

	List<ItemDTO> list();

	void delete(int ino);

	PageTO<ItemDTO> list(PageTO<ItemDTO> to);

	ItemDTO updateui(int ino);

	void update(ItemDTO dto);

	List<ItemDTO> searchlist(String cataCode);

	PageTO<ItemDTO> searchlist(PageTO<ItemDTO> to, String cataCode);



	PageTO<ItemDTO> searchAll(String keyword, PageTO<ItemDTO> to);

	PageTO<ItemDTO> searchTitle(String keyword, PageTO<ItemDTO> to, String searchType);

	void increaseLike(int ino);

	List<ItemDTO> best();

	void pickupInsert(PickupDTO pickupDTO);

	int countOfIno(int ino, String id);

	void increasePcs(int ino, String id);

	List<ItemDTO> cateBest(String cataCode);

	int cart(String id);

	int iwantpcs(int ino, String id);

	void insertRecommend(RecommendDTO dto);

	List<RecommendDTO> recommend();

	List<ItemDTO> recommendList(String bookName);

	void deleteRecommend(String ititle);

	ItemDTO itemDetail(int ino);
	
	void insertReview(ReviewVO vo);

	List<ReviewVO> getReviews(int ino);

	void updateReviews(ReviewVO vo);

	void deleteReviews(int rno);

	ReviewVO updateUIReviews(int rno);


}
