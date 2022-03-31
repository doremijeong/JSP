package member.service;

import java.sql.SQLException;
import java.util.List;

import member.vo.MemberVO;
import member.vo.PagingVO;

public interface IMemberService {
	
	public List<MemberVO> AllMember(PagingVO pagingVO);
	
	public MemberVO detailMember(String id);
	
	public int memRegistration(MemberVO mv);
	
	public int updateMember(MemberVO mv);
	
	public int deleteMember(String id);
	
	public List<MemberVO> searchMember(MemberVO mv);
	
	public int selectTotalCnt();
	
	public String chkMember(String id);
}
