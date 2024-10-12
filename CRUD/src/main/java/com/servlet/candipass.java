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
 * Servlet implementation class candipass
 */
public class candipass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public candipass() {
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
		int s_ID = Integer.parseInt(request.getParameter("s_ID"));
		String oldp = request.getParameter("oldp");
		String newp = request.getParameter("newp");
		String conp = request.getParameter("conp");
		
		HttpSession session = request.getSession();
		
		try {
			Session s = factory.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			Query q = s.createQuery("SELECT s_password FROM user WHERE s_ID = :id");
			q.setParameter("id",s_ID);
			String c = (String)q.uniqueResult();
			if(c.equals(oldp))
			{
				if(newp.equals(conp))
				{
					Query qq = s.createQuery("UPDATE user SET s_password =:password WHERE s_ID =:id");
					qq.setParameter("password",newp);
					qq.setParameter("id",s_ID);
					int res = qq.executeUpdate();
					tx.commit();
					if(res>0)
					{
						session.setAttribute("upass","password update successfully");
						response.sendRedirect("candi/candipass.jsp?s_ID="+s_ID);
					}
					else
					{
						session.setAttribute("epass","server error try again after sometime");
						response.sendRedirect("candi/candipass.jsp?s_ID="+s_ID);
					}
				}
				else {
					session.setAttribute("epass","password doesn't matched");
					response.sendRedirect("candi/candipass.jsp?s_ID="+s_ID);
				}
			}
			else
			{
				session.setAttribute("erpass","old password is incorrect");
				response.sendRedirect("candi/candipass.jsp?s_ID="+s_ID);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

}
