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

import com.entities.courses;
import com.entities.Course_details;
import com.entities.s_personal;
import com.entities.user;
import com.helper.factory;

/**
 * Servlet implementation class A_D_operation
 */
public class A_D_operation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public A_D_operation() {
		super();
		// TODO Auto-generated constructor stub
	}

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

		String op = request.getParameter("operation");
		String id = request.getParameter("id");

		HttpSession session = request.getSession();

		if (op.trim().equals("addStudent")) 
		{
			String s_name = request.getParameter("sname");
			String s_email = request.getParameter("semail");
			String dob = request.getParameter("sdob");
			String password = dob;
			String s_mobile = request.getParameter("smobile");
			String s_adm = request.getParameter("sadmn");
			String s_univer = request.getParameter("suniver");
			String y_s = request.getParameter("syear");
			String batch = request.getParameter("sbatch");
			
			String gender = request.getParameter("sgender");
			String f_name = request.getParameter("sfather");
			String f_mobile = request.getParameter("fmobile");
			String add = request.getParameter("sAdd");
			int c_id = Integer.parseInt(request.getParameter("cID"));
			
			try {
				Session ss = factory.getFactory().openSession();
				Transaction tx = ss.beginTransaction();
				int s = nextsk(ss);
				int p = nextpk(ss);
				int sid =scId(ss);
				courses cd = ss.get(courses.class, c_id);
				
				s_personal pd = new s_personal();
				pd.setP_id(p);
				pd.setF_name(f_name);
				pd.setF_numb(f_mobile);
				pd.setGender(gender);
				pd.setAddress(add);
				
				user u = new user();
				u.setS_ID(s);
				u.setS_name(s_name);
				u.setS_email(s_email);
				u.setS_mobile(s_mobile);
				u.setS_adm(s_adm);
				u.setS_password(password);
				u.setS_univer(s_univer);
				u.setBatch(batch);
				u.setYear_sem(y_s);
				u.setDob(dob);
				u.setC(cd);
				u.setP(pd);
				
				if(u!=null && pd!=null)
				{
					ss.save(pd);
					ss.save(u);
					tx.commit();
					ss.close();
					System.out.println("Done");
					session.setAttribute("msg","Student Added");
					response.sendRedirect("cll/AdminPage.jsp?id="+id);
				}
				else
				{
					session.setAttribute("errmsg","Student Adding due to server problem");
					response.sendRedirect("cll/AdminPage.jsp?id="+id);
				}

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		}
		else if(op.trim().equals("deletestudent"))
		{
			String sdadmn = request.getParameter("sdadmn");
			String sduniver = request.getParameter("sduniver");
			
			try {
		        Session ss = factory.getFactory().openSession();
		        Transaction tx = ss.beginTransaction();

		        // Fetch the user
		        Query s = ss.createQuery("FROM user WHERE s_adm = :s_adm AND s_univer = :s_univer");
		        s.setParameter("s_adm", sdadmn);
		        s.setParameter("s_univer", sduniver);
		        user u = (user) s.uniqueResult();

		        if (u != null) {
		            // Fetch associated personal details
		            s_personal p = u.getP();

		            // Delete the user
		            Query st = ss.createQuery("DELETE FROM user WHERE s_adm = :s_adm AND s_univer = :s_univer");
		            st.setParameter("s_adm", sdadmn);
		            st.setParameter("s_univer", sduniver);
		            int pes = st.executeUpdate();

		            // Delete the personal details
		            if (p != null) {
		                Query pp = ss.createQuery("DELETE FROM s_personal WHERE id = :id");
		                pp.setParameter("id", p.getP_id());
		                int res = pp.executeUpdate();

		                if (res > 0 && pes > 0) {
		                    session.setAttribute("msg", "Student deleted successfully");
		                } else {
		                    session.setAttribute("errmsg", "Error in deleting or no student found");
		                }
		            } else {
		                session.setAttribute("errmsg", "Error: Associated personal details not found.");
		            }
		        } else {
		            session.setAttribute("errmsg", "Error: Student not found.");
		        }

		        tx.commit();
		        ss.close();

		        // Redirect after processing
		        response.sendRedirect("cll/AdminPage.jsp?id="+id);

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
	}

	public int nextpk(Session ss) {
		int pk = 0;
		try {
			Query q = ss.createQuery("select max(id) from s_personal");
			Integer max =(Integer) q.uniqueResult();
			pk=(max!=null)? max:0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			return pk + 1;
	}
	
	public int nextsk(Session ss) {
		int pk = 0;
		try {
			Query q = ss.createQuery("select max(s_ID) from user");
			Integer max =(Integer) q.uniqueResult();
			pk=(max!=null)? max:0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			}
			return pk + 1;
		}
	
	public int scId(Session ss)
	{
		int sc=0;
		try {
			Query s = ss.createQuery("select count(s_ID) from user");
			Integer c =(Integer) s.uniqueResult();
			sc=(c!=null)? c:0;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sc ;
	}
}
