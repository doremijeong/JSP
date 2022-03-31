package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;

@WebServlet("/MemberDelete.do")
public class MemberDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		IMemberService memService = MemberServiceImpl.getInstance();
		
		int cnt = memService.deleteMember(id);
		
		String alert ="";
		
		if(cnt >0) {
			alert = "성공";
		}else {
			alert="실패";
		}
		
		req.setAttribute("msg",cnt);
		
		req.getRequestDispatcher("/msg.jsp").forward(req, resp);
		
		/*PrintWriter out = resp.getWriter();
		out.println("<script>");
		out.print("alert('");
		if(cnt>0){
			out.print("success");
		}
		else{
			out.print("fail");
		}
		out.println("');");
		out.println("location.href='/MemberManagement/MemberList.do'");
		out.println("</script>");*/
		
//		req.getRequestDispatcher("/MemberList.do").forward(req, resp);
		
		
		/*String redirectUrl = req.getContextPath() + "/MemberList.do";
		
		resp.sendRedirect(redirectUrl);*/
		
	}
}
