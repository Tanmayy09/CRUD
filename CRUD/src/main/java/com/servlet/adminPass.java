package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.factory;

/**
 * Servlet implementation class adminPass
 */

public class adminPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int aid = Integer.parseInt(request.getParameter("aid"));
		HttpSession session = request.getSession();
		
		String step = request.getParameter("step");
		try {
			Session s = factory.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			if (step.trim().equals("step1")) {
				String oldpass = request.getParameter("oldpassword");
				
				Query c = s.createQuery("SELECT password FROM Admin WHERE id = :aid");
				c.setParameter("aid", aid);
				String currentPass = (String) c.uniqueResult();
				if (currentPass.equals(oldpass)) {
					session.setAttribute("currentPass",currentPass);
					response.sendRedirect("cll/password.jsp?step=step2&id=" + aid);
				} else {
					session.setAttribute("erroldpass", "Old password is incorrect.");
					response.sendRedirect("cll/password.jsp?step=step1&id=" + aid);
				}
			}

			else if (step.equals("step2")) {
				String newpass = request.getParameter("newpassword");
				String renewpass = request.getParameter("renewpassword");
				String checkpass = (String) session.getAttribute("currentPass");
				if(newpass.trim().equals(checkpass))
				{
					session.setAttribute("errnewpass","password matched with previous password");
					response.sendRedirect("cll/password.jsp?step=step2&id=" +aid);
					
				}
				else if (newpass.trim().equals(renewpass)) {
					Query uc = s.createQuery("UPDATE Admin SET password = :newPassword WHERE id = :aid");
					uc.setParameter("newPassword", newpass);
					uc.setParameter("aid",aid);
					int result = uc.executeUpdate();
					tx.commit();

					if (result > 0) {
						session.setAttribute("newpass", "Password updated successfully!");
					} else {
						session.setAttribute("errnewpass", "Failed to update password. Please try again later.");
					}
					response.sendRedirect("cll/password.jsp?step=step2&id=" +aid);
				} else {
					
					session.setAttribute("errepass", "Passwords do not match!");
					response.sendRedirect("cll/password.jsp?step=step2&id=" +aid);
				}
			}

			s.close();		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
