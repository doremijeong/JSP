package member.controller;

import java.io.IOException;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/MemberRegister.do")
public class MemeberRegisterServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/registerForm.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String email = req.getParameter("email");
		String picture = req.getParameter("picture");
		int enabled = Integer.parseInt(req.getParameter("enabled"));
		String regdate = req.getParameter("regdate");
		String phone = req.getParameter("phone");
		String name = req.getParameter("name");
		String register = req.getParameter("register");
		String address = req.getParameter("address");
		String authority = req.getParameter("authority");
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		Date reDate = null;
		try {
			reDate = date.parse(regdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		IMemberService memService = MemberServiceImpl.getInstance();
		
		MemberVO mv = new MemberVO();
		mv.setId(id);
		mv.setPwd(pwd);
		mv.setEmail(email);
		mv.setPicture(picture);
		mv.setEnabled(enabled);
		mv.setRegdate(reDate);
		mv.setPhone(phone);
		mv.setName(name);
		mv.setRegister(register);
		mv.setAddress(address);
		mv.setAuthority(authority);
		
		int cnt = memService.memRegistration(mv);
		
		int cntt = memService.updateMember(mv);
		
		String alert ="";
		
		if(cntt >0) {
			alert = "성공";
		}else {
			alert="실패";
		}
		
		req.setAttribute("msg", cntt);
		req.getRequestDispatcher("/msg.jsp").forward(req, resp);
		
		
		/*String redirectUrl = req.getContextPath() + "/MemberList.do";
		
		resp.sendRedirect(redirectUrl);*/
	}
}
