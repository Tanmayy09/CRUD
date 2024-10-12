package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.factory;

/**
 * Servlet implementation class Editstudent
 */
public class Editstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Editstudent() {
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
		

		int op = Integer.parseInt(request.getParameter("edit"));
		int opp = Integer.parseInt(request.getParameter("pedit"));
		HttpSession session = request.getSession();
		
		String s_name = request.getParameter("ename");
		String s_email = request.getParameter("eemail");
		String dob = request.getParameter("edob");
		String s_mobile = request.getParameter("emobile");
		String s_adm = request.getParameter("eadmn");
		String s_univer = request.getParameter("euniver");
		String y_s = request.getParameter("eyear");
		String batch = request.getParameter("ebatch");
		String gender = request.getParameter("egender");
		String f_name = request.getParameter("efname");
		String f_mobile = request.getParameter("efmobile");
		String add = request.getParameter("eadd");
		
		try {
			Session s = factory.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			String stuUpdate = "UPDATE user SET " + "s_name = :name, s_email = :email, dob = :dob, s_mobile = :mobile, "
					+ "s_adm = :adm, s_univer = :univer, year_sem = :year, batch = :batch WHERE s_ID = :studentId";
			
			String pUpdate ="UPDATE s_personal SET " + "f_name = :name, f_numb = :number, address = :add, gender = :gender WHERE id = :pID";
			// Execute the HQL update query
			int result = s.createQuery(stuUpdate).setParameter("name", s_name).setParameter("email", s_email)
					.setParameter("dob", dob).setParameter("mobile", s_mobile).setParameter("adm", s_adm)
					.setParameter("univer", s_univer).setParameter("year", y_s).setParameter("batch", batch)
					.setParameter("studentId", op)
					.executeUpdate();
			int result2 = s.createQuery(pUpdate).setParameter("gender", gender).setParameter("name", f_name)
					.setParameter("number", f_mobile).setParameter("add", add).setParameter("pID",opp).executeUpdate();
			// Commit the transaction
			tx.commit();
			s.close();

			if (result > 0 && result2 > 0) {
				session.setAttribute("upsucc","Student details Update Successfully");
				response.sendRedirect("cll/stedit.jsp?s_ID=" + op + "&id=" + opp);
			} else {
				session.setAttribute("errsucc","Student details Not Update due to server error");
				response.sendRedirect("cll/stedit.jsp?s_ID=" + op + "&id=" + opp);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
