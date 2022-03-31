package member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import member.vo.MemberVO;
import member.vo.PagingVO;
import util.SQLMapClientFactory;

public class MemberDaoImpl implements IMemberDao{
	
	private SqlMapClient smc;
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		smc = SQLMapClientFactory.getInstance();
	}
	
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
	}

	@Override
	public List<MemberVO> AllMember(PagingVO pagingVO) throws SQLException {
		
		return smc.queryForList("memberMgm.allMember",pagingVO);
	}

	@Override
	public MemberVO detailMember(String id) throws SQLException {
		
		return (MemberVO) smc.queryForObject("memberMgm.detailMember",id);
	}

	@Override
	public int memRegistration(MemberVO mv) throws SQLException {
		
		return smc.update("memberMgm.memRegistration",mv);
	}

	@Override
	public int updateMember(MemberVO mv) throws SQLException {
		
		return smc.update("memberMgm.updateMember",mv);
	}

	@Override
	public int deleteMember(String id) throws SQLException {
		
		return smc.delete("memberMgm.deleteMember",id);
	}

	@Override
	public List<MemberVO> searchMember(MemberVO mv) throws SQLException {
		
		return smc.queryForList("memberMgm.searchMember",mv);
	}

	@Override
	public int selectTotalCnt() throws SQLException {
		
		return (int)smc.queryForObject("memberMgm.totalCnt");
	}

	@Override
	public String chkMember(String id) throws SQLException {
		
		return (String) smc.queryForObject("memberMgm.chkMember",id);
	}

}
