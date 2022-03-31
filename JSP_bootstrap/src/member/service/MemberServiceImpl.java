package member.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServlet;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import member.vo.MemberVO;
import member.vo.PagingVO;

public class MemberServiceImpl implements IMemberService{
	
	private IMemberDao dao;
	private static IMemberService service;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		
		return service;
	}

	@Override
	public List<MemberVO> AllMember(PagingVO pagingVO) {
		List<MemberVO> list = null;
		
		try {
			list = dao.AllMember(pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MemberVO detailMember(String id) {
		MemberVO mv = null;
		
		try {
			mv = dao.detailMember(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mv;
	}

	@Override
	public int memRegistration(MemberVO mv) {
		int cnt = 0;
		
		try {
			cnt=dao.memRegistration(mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateMember(MemberVO mv) {
		int cnt = 0;
		
		try {
			cnt=dao.updateMember(mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteMember(String id) {
		int cnt = 0;
		
		try {
			cnt = dao.deleteMember(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<MemberVO> searchMember(MemberVO mv) {
		
		List<MemberVO> list = null;
		
		try {
			list = dao.searchMember(mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int selectTotalCnt() {
		
		int cnt = 0;
		
		try {
			cnt = dao.selectTotalCnt();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public String chkMember(String id) {
		
		String chk = null;
		
		try {
			chk = dao.chkMember(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chk;
	}


	
}
