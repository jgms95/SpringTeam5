package kr.co.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.domain.PageTO;
import kr.co.domain.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO {
	@Autowired
	private SqlSession session;
	
	private final String NS = "q.n.a";

	@Override
	public PageTO<QnaDTO> allqnalist(PageTO<QnaDTO> to, String ino, String category) {
		
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage()); 
		List<QnaDTO> list;
		Integer amount;
		if(ino==null || ino.equals("all")) {
			list = session.selectList(NS+".allqnalist",category,rowBounds);
			amount = session.selectOne(NS+".getAmount",category);
		}else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ino", Integer.parseInt(ino));
			map.put("category",category);
			list = session.selectList(NS+".inoqnalist",map,rowBounds);
			amount = session.selectOne(NS+".getInoAmount",map);
		}
		to.setList(list);
		if(amount!=null) {
			to.setAmount(amount);
		}else {
			to.setAmount(0);
		}
		return to;
	}

}
