package member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/MemberUpdate.do")
public class MemberUpdateServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
//		System.out.println(id);
		IMemberService memService = MemberServiceImpl.getInstance();
		
		MemberVO mv = memService.detailMember(id);
		
		req.setAttribute("mv", mv);
		
		req.getRequestDispatcher("/memUpdateForm.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		MemberVO mv = new MemberVO();
		
		try {
			String[] patterns = new String[] {"yyyy-MM-dd"};
			DateTimeConverter dtConverter = new DateConverter();
			dtConverter.setPatterns(patterns);
			System.out.println(dtConverter);
			
			
			ConvertUtils.register(dtConverter, Date.class);
			
			BeanUtils.populate(mv, req.getParameterMap());
			System.out.println(mv.getRegdate());
			
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
//		System.out.println(mv);
		IMemberService memService = MemberServiceImpl.getInstance();

		int cnt = memService.updateMember(mv);
		
		String alert ="";
		
		if(cnt >0) {
			alert = "성공";
		}else {
			alert="실패";
		}
		
		req.setAttribute("msg", cnt);
		req.setAttribute("mv", cnt);
		req.getRequestDispatcher("/msg.jsp").forward(req,resp);
		
		/*String redirectUrl = req.getContextPath() + "/MemberList.do";
		
		resp.sendRedirect(redirectUrl);*/
		
		
	}
}
