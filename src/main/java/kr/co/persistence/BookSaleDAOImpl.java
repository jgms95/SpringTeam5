package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.domain.ItemDTO;
import kr.co.domain.PageTO;
import kr.co.domain.PickupDTO;
import kr.co.domain.RecommendDTO;
import kr.co.domain.ReviewVO;

@Repository
public class BookSaleDAOImpl implements BookSaleDAO{

	@Autowired
	private SqlSession session;

	private final String NS = "b.k.s";

	@Override
	public void insert(ItemDTO dto) {
		Integer ino = session.selectOne(NS+".getIno");
		if(ino!=null) {
			ino += 1;
		}else {
			ino = 1 ;
		}
		dto.setIno(ino);
	
		session.insert(NS+".insert",dto);
		
		
	}@Override
	public List<ItemDTO> list() {
		
		
		// TODO Auto-generated method stubc
		return session.selectList(NS+".list");
	}
	@Override
	public void delete(int ino) {
		// TODO Auto-generated method stub
		System.out.println(ino);
		
		session.delete(NS+".delete", ino);
	}
	@Override
	public PageTO<ItemDTO> list(PageTO<ItemDTO> to) {
//		
		to.setPerPage(8);
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());




		List<ItemDTO> list = session.selectList(NS+".list", null, rowBounds);

		to.setList(list);

		Integer amount = session.selectOne(NS+".getAmount");
		if (amount != null) {
			to.setAmount(amount);
		} else {
			to.setAmount(0);
		}

		return to;
}
	@Override
	public ItemDTO updateui(int ino) {
		
		return session.selectOne(NS+".updateui", ino);
	}
	
	@Override
	public void update(ItemDTO dto) {
		// TODO Auto-generated method stub
		session.update(NS+".update", dto);
	}
	@Override
	public List<ItemDTO> searchlist(String cataCode) {
	
		return session.selectList(NS+".searchlist", cataCode);
	}
	@Override
	public PageTO<ItemDTO> searchlist(PageTO<ItemDTO> to, String cataCode) {
		
		to.setPerPage(8);
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());




		List<ItemDTO> list = session.selectList(NS+".searchlist", cataCode, rowBounds);    // catacode 媛��슫�뜲 �꽔�쑝硫� mapper濡� 媛��뒗嫄댁� 紐⑤Ⅴ寃좊떎 (李⑦썑�솗�씤)

		to.setList(list);

		Integer amount = session.selectOne(NS+".searchgetAmount", cataCode);      
		if (amount != null) {
			to.setAmount(amount);
		} else {
			to.setAmount(0);
		}

		return to;
	}
	@Override
	public PageTO<ItemDTO> searchAll(String keyword, PageTO<ItemDTO> to) {
		
		to.setPerPage(8);
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());
		
		List<ItemDTO> list = session.selectList(NS+".searchAll", keyword, rowBounds); 
		to.setList(list);

		Integer amount = session.selectOne(NS+".searchAllgetAmount", keyword);      
		System.out.println(amount+"amount");
		if (amount != null) {
			to.setAmount(amount);
		} else {
			to.setAmount(0);
		}

		return to;
	}
	@Override
	public PageTO<ItemDTO> searchTitle(String keyword, PageTO<ItemDTO> to, String searchType) {
		// TODO Auto-generated method stub
		to.setPerPage(8);
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());
		
		if(searchType.equals("ititle")) {
			
			List<ItemDTO> list = session.selectList(NS+".searchItitle", keyword, rowBounds); 
			System.out.println(list);
			to.setList(list);
			Integer amount = session.selectOne(NS+".searchItitleAmount", keyword);      
			System.out.println(amount+"amount");
			if (amount != null) {
				to.setAmount(amount);
				
			} else {
				to.setAmount(0);
			}
		}
				
		else {
		List<ItemDTO> list = session.selectList(NS+".searchIwriter", keyword, rowBounds); 
		System.out.println(list);
		to.setList(list);
		Integer amount = session.selectOne(NS+".searchIwriterAmount", keyword);      
		System.out.println(amount+"amount");
		if (amount != null) {
			to.setAmount(amount);
			
		} else {
			to.setAmount(0);
		}}

		return to;
	}
	
	@Override
	public void increaseLike(int ino) {
		// TODO Auto-generated method stub
		session.update(NS+".increaseLike", ino);
	}
	@Override
	public List<ItemDTO> best() {
		// TODO Auto-generated method stub
		return session.selectList(NS+".best");
	}
	@Override
	public void pickupInsert(PickupDTO pickupDTO) {
		// TODO Auto-generated method stub
		session.insert(NS+".pickupInsert", pickupDTO);
	}
	@Override
	public int countOfIno(int ino, String id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> info = new HashMap<String, Object>();
		info.put("ino", ino);
		info.put("id", id);
		return session.selectOne(NS+".countOfIno", info);
	}
	@Override
	public void increasePcs(int ino, String id) {
		HashMap<String, Object> info = new HashMap<String, Object>();
		info.put("ino", ino);
		info.put("id", id);
		session.update(NS+".increasePcs", info);
	}
	@Override
	public List<ItemDTO> cateBest(String cataCode) {
	// TODO Auto-generated method stub
	return session.selectList(NS+".cataBest", cataCode);
}	
	@Override
	public int cart(String id) {
	// TODO Auto-generated method stub
	return session.selectOne(NS+".cart", id);
}
	@Override
	public int iwantpcs(int ino, String id) {
		HashMap<String, Object> info = new HashMap<String, Object>();
		info.put("ino", ino);
		info.put("id", id);
		Integer pcs = session.selectOne(NS +".iwantpcs", info);
		pcs = pcs == null ? 0 : pcs;
		
		return pcs;

	}
	
	
	@Override
	public void insertRecommend(RecommendDTO dto) {
		
		Integer ino =  session.selectOne(NS+".getIno2");
		if(ino!=null) {
			ino += 1;
		}else {
			ino = 1 ;
		}
		dto.setIno(ino);
		
		session.insert(NS+".insertRecommend", dto);
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<RecommendDTO> recommend() {
		// TODO Auto-generated method stub
		return session.selectList(NS+".recommend");
	} 
	@Override
	public List<ItemDTO> recommendList(String bookName) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".recommendList", bookName);
	}
	
	@Override
	public void deleteRecommend(String ititle) {
		// TODO Auto-generated method stub
		session.delete(NS+".deleteRecommend", ititle);
	}
	
	@Override
	public ItemDTO itemDetail(int ino) {
		
	
		// TODO Auto-generated method stub
		return session.selectOne(NS+".itemDetail", ino);
	}
	@Override
	public void insertReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		Integer rno = session.selectOne(NS+".getRno");
		if(rno!=null) {
			rno += 1;
		}else {
			rno = 1 ;
		}
		vo.setRno(rno);
		session.insert(NS+".insertReview", vo);
	}
	
	@Override
	public List<ReviewVO> getReviews(int ino) {
		return session.selectList(NS+".getReviews",ino);
	}
	
	@Override
	public void updateReviews(ReviewVO vo) {
		// TODO Auto-generated method stub
		session.selectOne(NS+".updateReviews", vo);
	}
	
	@Override
	public void deleteReviews(int rno) {
		// TODO Auto-generated method stub
		session.selectOne(NS+".deleteReviews", rno);
	}

	@Override
	public ReviewVO updateUIReviews(int rno) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".updateUIReviews", rno);
	}
	
}
