package member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/MemberSearch.do")
public class MemberSearchServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		MemberVO mv = new MemberVO();
		
		String searchOption = req.getParameter("searchOption");
		String searchWord = req.getParameter("search");
//		System.out.println(searchOption);
//		System.out.println(searchWord);
		if(searchOption.equals("아이디")) {
			mv.setId(searchWord);
		}else if(searchOption.equals("이름")) {
			mv.setName(searchWord);
		}else if(searchOption.equals("전화번호")) {
			mv.setPhone(searchWord);
		}else if(searchOption.equals("이메일")) {
			mv.setEmail(searchWord);
		}
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		List<MemberVO> list = service.searchMember(mv);
//		System.out.println(list.size());
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/search.jsp").forward(req, resp);
		
	}
}
