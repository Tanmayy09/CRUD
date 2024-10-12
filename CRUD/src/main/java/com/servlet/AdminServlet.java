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

import com.entities.Admin;
import com.entities.Course_details;
import com.entities.courses;
import com.helper.factory;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String enteredemail = request.getParameter("email");
		String enteredpassword = request.getParameter("password");
        HttpSession session = request.getSession();

		try {
			Session s = factory.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            
            Course_details c = new Course_details();
            c.savecourse(s);
            

            // Query to fetch the AdminLogin object
            Query q = s.createQuery("FROM Admin WHERE email = :email AND password = :password");
            q.setParameter("email", enteredemail);
            q.setParameter("password", enteredpassword);
            Admin admin = (Admin) q.uniqueResult();         
            tx.commit();
            s.close();

            if (admin != null) {
                // Login successful
                response.sendRedirect("cll/AdminPage.jsp?id="+admin.getId());
                session.setAttribute("adname",admin.getName());
                session.setAttribute("adminID",admin.getId());
                session.setAttribute("ademp", admin.getEmp_id());
            } else {
                // Login failed
                session.setAttribute("error", "Invalid email or password");
                response.sendRedirect("adminLogin.jsp");
            }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
