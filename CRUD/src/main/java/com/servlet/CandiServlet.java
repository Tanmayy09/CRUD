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

import com.entities.user;
import com.helper.factory;

/**
 * Servlet implementation class CandiServlet
 */
public class CandiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CandiServlet() {
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
		
		String admission = request.getParameter("uadmn");
		String password = request.getParameter("upassword");
		
		HttpSession session = request.getSession();
		
		try {
			Session s = factory.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			Query q = s.createQuery("FROM user WHERE s_adm = :admission AND s_password = :password");
			q.setParameter("admission",admission);
			q.setParameter("password", password);
			
			user u = (user) q.uniqueResult();
			tx.commit();
			s.close();
			if(u!=null)
			{
				response.sendRedirect("candi/candi_details.jsp?s_ID="+ u.getS_ID());
			}
			else
			{
				session.setAttribute("error","Incorrect Admission or password");
				response.sendRedirect("Index.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

}
