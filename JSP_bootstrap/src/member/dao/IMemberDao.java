package member.dao;

import java.sql.SQLException;
import java.util.List;

import member.vo.MemberVO;
import member.vo.PagingVO;

public interface IMemberDao {
	
	//회원 전체 조회
	public List<MemberVO> AllMember(PagingVO pagingVO) throws SQLException;
	
	//회원 상세 조회
	public MemberVO detailMember(String id) throws SQLException;
	
	//회원 등록
	public int memRegistration(MemberVO mv) throws SQLException;
	
	//회원 수정
	public int updateMember(MemberVO mv) throws SQLException;
	
	//회원 삭제
	public int deleteMember(String id) throws SQLException;
	
	//회원 검색
	public List<MemberVO> searchMember(MemberVO mv) throws SQLException;
	
	//페이징처리
	public int selectTotalCnt() throws SQLException;
	
	//회원 아이디 중복 체크
	public String chkMember(String id) throws SQLException;
	
}
