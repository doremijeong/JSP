package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;
import member.vo.PagingVO;

@WebServlet("/MemberList.do")
public class MemberListServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		
		IMemberService memService = MemberServiceImpl.getInstance();
		
		
		int totalCnt = memService.selectTotalCnt();
		PagingVO pagingVO = new PagingVO();
		pagingVO.setCountPerPage(10);
		pagingVO.setCurrentPageNo(pageNo);
		pagingVO.setPageSize(3);
		pagingVO.setTotalCount(totalCnt);
		
		List<MemberVO> list = memService.AllMember(pagingVO);
		
		req.setAttribute("list", list);
		req.setAttribute("pagingVO", pagingVO);
		
		req.getRequestDispatcher("/home.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
