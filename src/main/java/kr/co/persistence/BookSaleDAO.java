package kr.co.persistence;

import java.util.List;


import kr.co.domain.ItemDTO;
import kr.co.domain.PageTO;
import kr.co.domain.PickupDTO;

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

	int countOfIno(int ino);

	void increasePcs(int ino);

}
